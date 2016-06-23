part of dts_converter;

class Converter {
  String convert(String input, String source_library_name, [String prefix = ""]) {
    String f = input;

    // Remove Namespace if exists
    if (f.contains("declare namespace")) {
      f = f.replaceAllMapped(new RegExp("(\\s*)declare\\s+namespace\\s+[A-Za-z0-9.]+\\s*\\{"), (Match m) => "${m[1]}");
      // remove closing bracket at end of file
      f = f.replaceAll(new RegExp("\\}\\s*\$"), "");
      f = _specialPreTreatment(f);
      f = _convertTopLevelVars(f);
      f = _convertTypes(f);
      f = _convertExportClassBody(f);
      f = _convertSyntax(f);
      //f = _convertFieldsInConstructors(f);
      f = _convertFieldsToGetSet(f, hasConstructor: true);
      f = _specialPostTreatment(f);
    } else {
      f = _convertTypes(f);
      f = _convertInterfaceBody(f);
      f = _convertSyntax(f);
      f = _convertFieldsInFactories(f);
      f = _convertFieldsToGetSet(f);
      f = _validateFactories(f);
      f = _convertInterfaceVarDef(f, source_library_name);
    }

    return "${prefix} $f";
  }

  String _specialPreTreatment(String f) {
    // remove implements
    f = f.replaceAll(new RegExp("implements\\s+[A-Za-z0-9_<>]+"), "");
    // remove comments at EOL as they fsck up my regexes
    f = f.replaceAll(new RegExp("\\/\\/.*"), "");
    // remove multiline comments
    f = f.replaceAll(new RegExp("\\/\\*\\*[^\\*]+\\*[^\\*\\/]*\\*[^\\*\\/]*\\*[^\\*\\/]*\\/"), "");
    f = f.replaceAll(new RegExp("\\/\\*\\*[^\\*]+\\*[^\\*\\/]*\\*[^\\*\\/]*\\/"), "");
    // fix an error in three.d.ts source
    f = f.replaceAll(new RegExp("clip: AnimationClip\n"), "clip: AnimationClip;\n");
    // replace multiple type definition (defined by pipe) with 'dynamic' type
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_]+\\s*\\|\\s*[A-Za-z0-9_]+\\s*\\|*\\s*[A-Za-z0-9_]*)"), (Match m) => "dynamic "); // "dynamic /* ${m[1]}  */"
    // change stuff. before: [name : Foo] : Bar; after: name : Foo;
    f = f.replaceAllMapped(new RegExp("\\[\\s*([A-Za-z0-9_<>]+\\s*:\\s*[A-Za-z0-9_<>]+)\\s*\\]\\s*:\\s*[A-Za-z0-9_<>]+\\s*;"), (Match m) => "${m[1]};");
    return f;
  }



  String _convertTopLevelVars(String f) {
    // top level enum
    f = f.replaceAllMapped(new RegExp("export\\s+enum\\s*(.*)\\{\\s*\\}"), (Match m) => "enum ${m[1]} { dummy }");
    // var enum
    //f = f.replaceAllMapped(new RegExp("(\\s+enum\\s*.*)"), (Match m) => "\n/* ${m[1]}  */");
    // convert top level vars to getters
    f = f.replaceAllMapped(new RegExp("export\\s+var\\s+([^:]+).*;"), (Match m) => "external int get ${m[1]};");
    // convert top level vars with {...} to classes
    f = f.replaceAllMapped(new RegExp("export\\s+var\\s+([A-Za-z0-9_]+)\\s*:([^\\}]+)\\};"), (Match m) => "export class ${m[1]} ${m[2]} \n}");
    // convert export interface to class so that the RegEx below will deal with it
    f = f.replaceAllMapped(new RegExp("export\\s+interface\\s+"), (Match m) => "export class ");
    // convert interface to class so that the RegEx below will deal with it
    f = f.replaceAllMapped(new RegExp("interface\\s+"), (Match m) => "export class ");
    //TODO class VideoTexture --> export class VideoTexture
    return f;
  }

  /* --------- TYPES */
  String _convertTypes(String f) {
    f = f.replaceAll(new RegExp("any"), "dynamic");
    f = f.replaceAll(new RegExp("number"), "num");
    f = f.replaceAll(new RegExp("boolean"), "bool");
    f = f.replaceAll(new RegExp("string"), "String");
    f = f.replaceAll(new RegExp("Array<"), "List<");
    f = f.replaceAll(new RegExp("\\{\\}\\[\\]"), "List");
    return f;
  }

  /* --------- INTERFACE DEFINITION BODY
    Search for 'interface' + CLASS + 'extends FOO' + BODY
    Repace with annotated 'external CLASS' and constructor definition
    Comment out 'extends FOO' if exists
    Insert BODY into both factory constructor and class body for later type conversion
   */
  String _convertInterfaceBody(String f) {
    f = f.replaceAllMapped(
        new RegExp("(\\s*)interface\\s+([A-Za-z0-9.]+)\\s+(extends\\s+\\w+)*\\s*\\{([^}]+)\\}\n"),
        (Match m) => "${m[1]}\n@anonymous\n@JS()\nclass ${m[2]} {\n\texternal factory ${m[2]} ${m[3] == null
                                                                               ? ""
                                                                               : "/* ${m[3]} */"}(\n\t\t{${m[4]}});\n${m[4]}\n}\n");
    return f;
  }

  /* --------- NAMESPACED EXPORT DEFINITION BODY
    Search for 'export class' + CLASS + 'extends FOO' + BODY
    Repace with annotated 'external CLASS' and constructor definition
    Comment out 'extends FOO' if exists
    Insert BODY into both factory constructor and class body for later type conversion
   */
  String _convertExportClassBody(String f) {
    // treat Object definitions
    // f.ex. {foo: num, bar: string}
    f = f.replaceAllMapped(new RegExp("(.*)\\s*:\\s*\\{(.*)\\}(.*);"), (Match m) => "/* ${m[1]} #${m[2]}# ${m[3]}; */");

    f = f.replaceAllMapped(
        new RegExp("(\\s*)export\\s+class\\s+([A-Za-z0-9.]+)\\s+(extends\\s+\\w+)*\\s*\\{([^}]+)\\}\n"), (Match m) {
      String constructor = "";

      // get arguments from constructor
      m[4].replaceAllMapped(new RegExp("constructor\\s*\\(([^;]+);"), (Match n) => constructor = "(" + n[1]);

      // modify constructor var definition positions
      constructor = constructor.replaceAllMapped(
          new RegExp("([A-Za-z0-9_]+)\\s*\\?*\\s*:\\s*([^,\\)]+)"), (Match n) => "${n[2]} ${n[1]}");

      // remove constructor string
      String body = m[4].replaceAll(new RegExp("constructor\\s*\\([^;]+\\s*;"), "");

      return "${m[1]}\n@anonymous\n@JS()\nclass ${m[2]} {\n\texternal factory ${m[2]} ${m[3] == null
                                                                               ? ""
                                                                               : "/* ${m[3]} */"}${constructor};\n${body}\n}\n";
    });
    return f;
  }

  /* --------- DEFINITION SYNTAX */
  String _convertSyntax(String f) {
    // Remove "?"
    f = f.replaceAllMapped(new RegExp("(\\?)"), (Match m) => "");

    // Convert function definitions
    // f.ex. foo : () => any  -->  any foo()
    // f.ex. foo : (value : number) => string --> string foo(value : number)
    f = f.replaceAllMapped(new RegExp("\\?*:\\s*\\(([^)]*)\\s*\\)\\s*=>"), (Match m) => "(${m[1]}) :");

    // Convert type definition position
    // f.ex. foo : number --> number foo
    f = f.replaceAllMapped(new RegExp("(\\s*)(.*)\\s*:\\s*(.*)\\s*;"),
        (Match m) => m[2].startsWith("/*") ? m[0] : "${m[1]} ${m[3]} ${m[2]};");
    //fix statics:

    //aus: AnimationClip external static CreateFromMorphTargetSequence( String name , List<MorphTarget> morphTargetSequence , num fps );
    //an: static external AnimationClip CreateFromMorphTargetSequence( String name , List<MorphTarget> morphTargetSequence , num fps );
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_\\[\\]]*)\\s+static\\s+"), (Match m) => "static ${m[1]} ");

    // Convert type definition position in function parameter definition
    // f.ex. foo(bar : number) --> foo(number bar)
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_]+)\\s*:\\s*([A-Za-z0-9_\\[\\]<>]*)\\s*([),])"),
        (Match m) => "${m[2]} ${m[1]} ${m[3]}");

    // Convert typed array to typed List
    // f.ex. number[] --> List<number>
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_]+)\\[\\]"), (Match m) => "List<${m[1]}>");
    return f;
  }

  /* --------- FIELDS */
  String _convertFieldsInFactories(String f) {
    // Fields to factory named arguments
    f = f.replaceAllMapped(new RegExp("\\(\\s*\\{([^}]*)\\}\\s*\\);"), (Match m) {
      //TODO fix 'any' treatment
      //replace any with Function
      String intrnl = m[1].replaceAll(new RegExp("any"), "Func0<dynamic>");
      //remove "()" if Function is the type
      intrnl = intrnl.replaceAllMapped(
          new RegExp("(Func[A-Za-z0-9_<>]+)\\s+(.*)\\s*\\(\\s*\\)"), (Match n) => "${n[1]} ${n[2]}");
      //replace ; with ,
      intrnl = intrnl.replaceAll(new RegExp(";"), ",");
      // remove erraneously inserted arguments (function definitions)
      intrnl = intrnl.replaceAll(new RegExp("\\s*.+\\(.*\\)\\s*,"), "");
      // remove comma at end of parameter list
      intrnl = intrnl.replaceAll(new RegExp(",\\s*\$"), "\n");

      return "(\n\t{${intrnl}\t});";
    });
    return f;
  }

  String _convertFieldsToGetSet(String f, {bool hasConstructor: false}) {
    RegExp searchRegex = new RegExp("(\\}\\s*\\)\\s*;\\s*)([^}]+)\\}");
    if (hasConstructor) {
      //TODO fix
      searchRegex = new RegExp("(external\\s+factory[^;]+;\\s*)([^}]+)\\}");
    }

    // Fields to class getters/setters
    f = f.replaceAllMapped(searchRegex, (Match m) {
      // prefix all members that are not functions with 'external' and add 'get'
      String intrnl = m[2].replaceAllMapped(
          new RegExp("([A-Za-z0-9_<>]+)\\s*([A-Za-z0-9_<>]+)\\s*;"), (Match n) => "external ${n[1]} get ${n[2]};");
      intrnl = intrnl.replaceAllMapped(
          new RegExp("dynamic(.*)\\(\\s*\\)"), (Match n) => "external Func0<dynamic> get ${n[1]}");

      //prefix all functions with 'external'
      intrnl = intrnl.replaceAllMapped(
          new RegExp("([A-Za-z0-9_<>]*\\s*[A-Za-z0-9_<>]+\\s+[A-Za-z0-9_<>]+\\(.*\\))\\s*;"), (Match n) => "external ${n[1]};");

      //create setters
      intrnl = intrnl.replaceAllMapped(new RegExp("external\\s+([A-Za-z0-9_<>]+)\\s+get\\s+([A-Za-z0-9_]+)\\s*;"),
          (Match n) => "external ${n[1]} get ${n[2]};\n\t\texternal set ${n[2]}(${n[1]} v);");

      return "${m[1]}\n\n\t\t${intrnl}\n}";
    });
    return f;
  }

  /* --------- CLEANUP */
  String _validateFactories(String f) {
    // Delete factory if no arguments
    f = f.replaceAll(
        new RegExp("external\\s*factory\\s*[A-Za-z0-9_]+\\s*[A-Za-z0-9_\\/\\* ]*\\s*\\(\\s*\\{\\s*\\}\\);"), "");
    return f;
  }

  /* --------- TRICKY STUFF */

  /**
     * search for interface and var def that are named like the library (e.g. Chart)
        EXAMPLE:
        declare var Chart: {
        Chart new (CanvasRenderingContext2D context );
        defaults: {
        ChartSettings global;
        }
        };
     * */
  String _convertInterfaceVarDef(String f, String source_library_name) {
    String declaredClasses = "";

    RegExp r1 = new RegExp("class ($source_library_name)", caseSensitive: false);
    RegExp r2 = new RegExp("declare var $source_library_name", caseSensitive: false);
    RegExp r3 = new RegExp("$source_library_name\\s+new\\s+\\((.*)\\)\\s*;", caseSensitive: false);
    if (r1.hasMatch(f) && r2.hasMatch(f)) {
      String insert = "";
      String content = "";

      //library name
      String lib_name = r1.firstMatch(f).group(1);

      // extract conversion of 'LIB new (...)' to 'external LIB (...)'
      content = r3.firstMatch(f).group(1);
      insert = "external $lib_name($content);";

      f = f.replaceAllMapped(r3, (Match m) => "");

      // extract everything inside LIB var declaration
      Match match = new RegExp("(declare\\s+var\\s+${lib_name}\\s*\\:\\s*\\{)([^\\}]*\\s*\\}\\s*\\};)").firstMatch(f);
      content = match.group(2);
      f = f.replaceFirst(match.group(1) + match.group(2), "");

      // convert properties of LIB var declaration
      content.replaceAllMapped(new RegExp("([A-Za-z0-9_]+)\\s*:\\s*\\{([^\\}]*)\\}"), (Match m) {
        // convert each property to LIB class getter/setter as own classes
        insert += "\nexternal static ${lib_name}_${m[1]} get ${m[1]};";
        insert += "\nexternal static set ${m[1]}(${lib_name}_${m[1]} v);";
        // convert each property body to own class
        declaredClasses += "\n@anonymous\n@JS()\nclass ${lib_name}_${m[1]}{\n${m[2]}\n}\n";
        declaredClasses = declaredClasses.replaceAllMapped(
            new RegExp("([A-Za-z0-9_]+)\\s+([A-Za-z0-9_]+)\\s*;"), (Match n) => "\nexternal ${n[1]} get ${n[2]};");
      });

      f = f.replaceAllMapped(new RegExp("@anonymous\\s*(@JS\\(\\)\\s*class\\s+${lib_name}\\s*\\{)"),
          (Match m) => "${m[1]}\n\t${insert}\n");
    }

    return "$f \n\n$declaredClasses";
  }



    String _specialPostTreatment(String f) {

      f = f.replaceAll(new RegExp("ArrayLike"), "List");
      // solution has yet to be found
      f = f.replaceAll(new RegExp("void export function"), "//void export function");
      // fix bad factory definitions
      f = f.replaceAllMapped(new RegExp("external\\s+factory\\s+([A-Za-z0-9_]+)\\s*;"), (Match m) => "external factory ${m[1]}();");
      // fix double definition of ShaderChunk (three.js)
      f = f.replaceAll(new RegExp("external int get ShaderChunk;"), "");

      // fix functions as parameters
      f = f.replaceAll(new RegExp("listener\\(dynamic event \\) : void"), "Func1<dynamic, void> listener");
      f = f.replaceAll(new RegExp("onLoad\\(Texture texture \\) : void"), "Func1<Texture, void> onLoad");
      f = f.replaceAll(new RegExp("onError\\(String message \\) : void"), "Func1<String, void> onError");

    /*
    TODO for three.js

onLoad(String responseText ) : void, onProgress(dynamic event ) : void, onError(dynamic event ) : void

    listener(dynamic event ) : void
    [][]
    num|String|foo definitions

    void load(String url , onLoad(DataTexture dataTexture ) : void, onProgress(dynamic event ) : void, onError(dynamic event ) : void);
    load(url: string, onLoad?: (geometry: Geometry, materials: Material[]) => void, onProgress?: (event: any) => void, onError?: (event: any) => void): void;

    parse(dynamic json , String texturePath ) # geometry: Geometry; materials: List<Material> # ;
    parse(json: any, texturePath?: string): { geometry: Geometry; materials?: Material[] };

    textures # [key:String]:Texture # ;
    setTextures(textures # [key:String]:Texture # ): void;

    interface

    enum hack

        info: {
            memory: {
                 num programs;
                 num geometries;
                 num textures;
            };
            render: {
                 num calls;
                 num vertices;
                 num faces;
                 num points;
            };
        };
     */

      return f;
  }
}
