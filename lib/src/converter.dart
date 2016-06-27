part of dts_converter;

class Converter {
  String convert(String input, String source_library_name, [String prefix = ""]) {
    String f = input;

    // Remove Namespace if exists
    if (f.contains("declare namespace")) {
      f = f.replaceAllMapped(
          new RegExp("\\}?(\\s*)declare\\s+namespace\\s+[A-Za-z0-9.]+\\s*\\{"), (Match m) => "${m[1]}");
      // remove closing bracket at end of file
      f = f.replaceAll(new RegExp("\\}\\s*\$"), "");
      f = _specialPreTreatment(f);
      f = _prepareEdgeCases(f, source_library_name);
      f = _convertToFunc(f);
      f = _convertTopLevelVars(f);
      f = _convertTypes(f);
      f = _convertExportClassBody(f);
      f = _convertSyntax(f);
      f = _convertFieldsToGetSet(f, hasConstructor: true);
      f = _specialPostTreatment(f);
      f = _finishEdgeCases(f, source_library_name);
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
    f = f.replaceAll(new RegExp("\\n\\s*\\*\\s+.*"), "\n");
    f = f.replaceAll(new RegExp("\\/\\*\\*\\s+\\*\\/"), "");
    // replace multiple type definition (defined by pipe) with 'dynamic' type
    f = f.replaceAllMapped(
        new RegExp("([A-Za-z0-9_\\[\\]]+\\s*\\|\\s*[A-Za-z0-9_\\[\\]]+\\s*\\|*\\s*[A-Za-z0-9_\\[\\]]*)"),
        (Match m) => "dynamic "); // "dynamic /* ${m[1]}  */"
    // change stuff. before: [name : Foo] : Bar; after: name : Foo;
    f = f.replaceAllMapped(
        new RegExp("\\[\\s*([A-Za-z0-9_<>]+\\s*:\\s*[A-Za-z0-9_<>]+)\\s*\\]\\s*:\\s*[A-Za-z0-9_<>]+\\s*;"),
        (Match m) => "${m[1]};");

    return (f);
  }

  String _convertToFunc(String f) {
    // convert function calls in constructors to Func's
    //f = f.replaceAllMapped(new RegExp("(\\w+)\\?*\\s*:\\s*\\(\\s*\\)\\s*=>\\s*void"), (Match m) => "VoidFunc0 ${m[1]}");

    // Func0 / VoidFunc0
    f = f.replaceAllMapped(
        new RegExp("([A-Za-z0-9_<>]+)\\?*\\s*:\\s*\\(\\s*\\)\\s*=>\\s*([A-Za-z0-9_<>]+)(\\s*[,\\)])"), (Match m) {
      String s = "Func0<${m[2]}> ${m[1]}${m[3]}";
      if(m[2] == "void"){
        s = "VoidFunc0 ${m[1]}${m[3]}";
      }
      return s;
    });

    //onCompiled?: (effect: Effect) => void
    // Func1 / VoidFunc1
    f = f.replaceAllMapped(
        new RegExp("([A-Za-z0-9_<>]+)\\?*\\s*:\\s*\\(\\s*([A-Za-z0-9_<>]+)\\s*:\\s*([A-Za-z0-9_<>]+)\\s*\\)\\s*=>\\s*([A-Za-z0-9_<>]+)(\\s*[,\\)])"), (Match m) {
      String s = "Func1<${m[3]},${m[4]}> ${m[1]}${m[5]}";
      if(m[4] == "void"){
        s = "VoidFunc1<${m[3]}> ${m[1]}${m[5]}";
      }
      return s;
    });

    // Func2 / VoidFunc2
    f = f.replaceAllMapped(
        new RegExp("([A-Za-z0-9_<>]+)\\?*\\s*:\\s*\\(\\s*[A-Za-z0-9_<>]+\\?*\\s*:\\s*([A-Za-z0-9_<>]+)\\s*,\\s*[A-Za-z0-9_<>]+\\?*\\s*:\\s*([A-Za-z0-9_<>]+)\\s*\\)\\s*=>\\s*([A-Za-z0-9_<>]+)(\\s*[,\\)])"), (Match m) {
      String s = "Func2<${m[2]},${m[3]},${m[4]}> ${m[1]}${m[5]}";
      if(m[4] == "void"){
        s = "VoidFunc2<${m[2]},${m[3]}> ${m[1]}${m[5]}";
      }
      return s;
    });

    // Func3 / VoidFunc3
    f = f.replaceAllMapped(
        new RegExp("([A-Za-z0-9_<>]+)\\?*\\s*:\\s*\\(\\s*[A-Za-z0-9_<>]+\\?*\\s*:\\s*([A-Za-z0-9_<>\\[\\]]+)\\s*,\\s*[A-Za-z0-9_<>]+\\?*\\s*:\\s*([A-Za-z0-9_<>\\[\\]]+)\\s*,\\s*[A-Za-z0-9_<>]+\\?*\\s*:\\s*([A-Za-z0-9_<>\\[\\]]+)\\s*\\)\\s*=>\\s*([A-Za-z0-9_<>]+)(\\s*[,\\)])"), (Match m) {
      String s = "Func3<${m[2]},${m[3]},${m[4]},${m[5]}> ${m[1]}${m[6]}";
      if(m[5] == "void"){
        s = "VoidFunc3<${m[2]},${m[3]},${m[4]}> ${m[1]}${m[6]}";
      }
      return s;
    });


    f = f.replaceAllMapped(
        new RegExp("(\\w+)\\?*\\s*:\\s*\\(url: string, loaded: number, total: number\\)\\s*=>\\s*void"),
        (Match m) => "VoidFunc3<String,num,num> ${m[1]}");
    //func: (u: number, v: number) => Vector3
    f = f.replaceAllMapped(new RegExp("(\\w+)\\?*\\s*:\\s*\\(u: number, v: number\\)\\s*=>\\s*Vector3"),
        (Match m) => "Func2<num,num,Vector3> ${m[1]}");

    return f;
  }

  String _prepareEdgeCases(String f, String jsLibrary) {
    switch (jsLibrary) {
      case "THREE":
        //simplify annoying objects
        f = f.replaceAllMapped(new RegExp("info:[^}]+\\};[^}]+\\};[^}]+\\};"), (Match m) => "info: dynamic;");
        f = f.replaceAllMapped(
            new RegExp("extractAllPoints\\([^}]+\\};"), (Match m) => "extractAllPoints(num points) : dynamic;");
        f = f.replaceAllMapped(new RegExp("parameters:[^}]+\\};"), (Match m) => "parameters: dynamic;");
        f = f.replaceAllMapped(new RegExp("WorldUVGenerator:[^}]+\\};"), (Match m) => "WorldUVGenerator: dynamic;");

        // fix errors in three.d.ts source
        f = f.replaceAll(new RegExp("<T extends Object3D>"), "");
        f = f.replaceAll(new RegExp(": T;"), ": dynamic;");
        f = f.replaceAll(new RegExp("clip: AnimationClip\n"), "clip: AnimationClip;\n");
        f = f.replaceAll(new RegExp("blending\\?: Blending,\\n"), "blending?: Blending;\n");
        f = f.replaceAllMapped(
            new RegExp("(CurveUtils:\\s+\\{[^}]+\\})"), (Match m) => "${m[1]}"); // "dynamic /* ${m[1]}  */"
        break;
      case "BABYLON":
      default:
        f = f.replaceAll(new RegExp("onReady\\?\\: \\(mesh\\: GroundMesh\\) => void;"), "");
        f = f.replaceAllMapped(new RegExp("(subdivisions|precision|radiusFunction)\\?: \\{[^\\}]+\\}"), (Match m) => "${m[1]}: dynamic");
        f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_?\\(\\)]+)\\s*:\\s*\\{[^\\}]+\\}"), (Match m) => "${m[1]}: dynamic");
        f = f.replaceAll(new RegExp("\\}\\s+interface Window"), "\ninterface Window");
        f = f.replaceAllMapped(new RegExp("(interface HTMLMediaElement[^;]+;)"), (Match m) => "${m[1]}\n}\n");
        f = f.replaceAll(new RegExp("mouse cursor or null if none.\\s+\\*\\/"), "");
        f = f.replaceAll(new RegExp("interface ILoadingScreen"), "}\ninterface ILoadingScreen");
        f = f.replaceAll(new RegExp("BABYLON\\.AbstractMesh"), "AbstractMesh");

        break;
    }
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
    f = f.replaceAllMapped(new RegExp("export\\s+var\\s+([A-Za-z0-9_]+)\\s*:([^\\}]+)\\};"),
        (Match m) => "export class ${m[1]} ${m[2]} \n}");
    // convert export interface to class so that the RegEx below will deal with it
    f = f.replaceAllMapped(new RegExp("export\\s+interface\\s+"), (Match m) => "export class ");
    // convert interface to class so that the RegEx below will deal with it
    f = f.replaceAllMapped(new RegExp("interface\\s+"), (Match m) => "export class ");
    // convert lonely class statements to "export class" so that the RegEx below will deal with it
    f = f.replaceAllMapped(new RegExp("\\n\\s*class"), (Match m) => "\nexport class ");
    //remove private vars
    f = f.replaceAllMapped(new RegExp("private.*"), (Match m) => "");
    return f;
  }

  /* --------- TYPES */
  String _convertTypes(String f) {
    f = f.replaceAll(new RegExp("HTMLCanvasElement"), "CanvasElement");
    f = f.replaceAll(new RegExp("HTMLImageElement"), "ImageElement");
    f = f.replaceAll(new RegExp("HTMLVideoElement"), "VideoElement");
    f = f.replaceAll(new RegExp("HTMLElement"), "Element");
    f = f.replaceAll(new RegExp("any"), "dynamic");
    f = f.replaceAll(new RegExp("number"), "num");
    f = f.replaceAll(new RegExp("boolean"), "bool");
    f = f.replaceAll(new RegExp("string"), "String");
    f = f.replaceAll(new RegExp("Array<"), "List<");
    f = f.replaceAll(new RegExp("\\{\\}\\[\\]"), "List");
    f = f.replaceAll(new RegExp("Float32Array"), "List");
    f = f.replaceAll(new RegExp("Uint8Array"), "Uint8List");
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

    f = f.replaceAllMapped(new RegExp("(\\s*)export\\s+class\\s+([A-Za-z0-9_<>]+)([^{]*)\\{([^}]+)\\}\n"), (Match m) {
      String constructor = "";

      // get arguments from constructor
      m[4].replaceAllMapped(new RegExp("constructor\\s*\\(([^;]+);"), (Match n) => constructor = "(" + n[1]);

      //constructor = _convertToFunc(constructor);

      // modify constructor var definition positions
      constructor = constructor.replaceAllMapped(
          new RegExp("([A-Za-z0-9_<>]+)\\s*\\?*\\s*:\\s*([^,\\)]+)"), (Match n) => "${n[2]} ${n[1]}");
      // make arguments optional
      constructor = constructor.replaceAllMapped(new RegExp("\\((.*)\\)"), (Match n) => "([ ${n[1]} ])");

      constructor = constructor.replaceAllMapped(new RegExp("\\(\\[\\s*\\]\\)"), (Match n) => "()");

      // remove constructor string
      String body = m[4].replaceAll(new RegExp("constructor\\s*\\([^;]+;"), "");

      return "${m[1]}\n@JS()\nclass ${m[2]} ${m[3] == null
                                              ? ""
                                              : "${m[3]}"} {\n\texternal factory ${m[2]} ${constructor};\n${body}\n}\n";
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
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_\\[\\]]*)\\s+static\\s+"), (Match m) => "static ${m[1]} ");

    // Convert type definition position in function parameter definition
    // f.ex. foo(bar : number) --> foo(number bar)
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_]+)\\s*:\\s*([A-Za-z0-9_\\[\\]<>]*)\\s*([),])"),
        (Match m) => "${m[2]} ${m[1]} ${m[3]}");

    // Convert typed array to typed List
    // f.ex. number[] --> List<number>
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
      searchRegex = new RegExp("(external\\s+factory[^;]+;\\s*)([^}]+)\\}");
    }

    // []
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_<>]+)\\[\\]"), (Match m) => "List<${m[1]}>");
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_]+)\\[\\]"), (Match m) => "List<${m[1]}>");
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_<>]+)\\[\\]"), (Match m) => "List<${m[1]}>");
    f = f.replaceAllMapped(new RegExp("([A-Za-z0-9_<>]+)\\[\\]"), (Match m) => "List<${m[1]}>");

    // Fields to class getters/setters
    f = f.replaceAllMapped(searchRegex, (Match m) {
      // prefix all members that are not functions with 'external' and add 'get'
      String intrnl = m[2].replaceAllMapped(
          new RegExp("([A-Za-z0-9_<>,]+)\\s+([A-Za-z0-9_<>,]+)\\s*;"), (Match n) => "external ${n[1]} get ${n[2]};");
      intrnl = intrnl.replaceAllMapped(
          new RegExp("^<?dynamic(.*)\\(\\s*\\)"), (Match n) => "external Func0<dynamic> get ${n[1]}");

      //prefix all functions with 'external'
      intrnl = intrnl.replaceAllMapped(
          new RegExp("([A-Za-z0-9_<>]*\\s*[A-Za-z0-9_<>]+\\s+[A-Za-z0-9_<>]+\\(.*\\))\\s*;"),
          (Match n) => "external ${n[1]};");

      // static external --> external static
      intrnl = intrnl.replaceAll(new RegExp("static\\s+external"), "external static");

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

      f = f.replaceAllMapped(
          new RegExp("(@JS\\(\\)\\s*class\\s+${lib_name}\\s*\\{)"), (Match m) => "${m[1]}\n\t${insert}\n");
    }

    return "$f \n\n$declaredClasses";
  }

  String _specialPostTreatment(String f) {
    f = f.replaceAll(new RegExp("ArrayLike"), "List");
    // solution has yet to be found
    f = f.replaceAll(new RegExp("void export function"), "//void export function");
    // fix bad factory definitions
    f = f.replaceAllMapped(
        new RegExp("external\\s+factory\\s+([A-Za-z0-9_<>]+)\\s*;"), (Match m) => "external factory ${m[1]}();");
    // fix enum
    f = f.replaceAll(new RegExp("export enum"), "enum");

    // fix functions as parameters
    f = f.replaceAllMapped(
        new RegExp("(\\w+)\\s*\\((\\w+)\\s+\\w+\\s*\\)\\s*:\\s*void"), (Match m) => "VoidFunc1<${m[2]}> ${m[1]}");
    //onLoad(Geometry geometry , List<Material> materials ) : void
    f = f.replaceAllMapped(
        new RegExp("(\\w+)\\s*\\(([A-Za-z0-9_<>]+)\\s+\\w+\\s*,\\s*([A-Za-z0-9_<>]+)\\s+\\w+\\s*\\)\\s*:\\s*void"),
        (Match m) => "VoidFunc2<${m[2]},${m[3]}> ${m[1]}");

    // comment this: WebGLObjectsInstance new (dynamic gl , dynamic properties , dynamic info );
    // happens because constructor is not named the same as class
    f = f.replaceAllMapped(
        new RegExp("(\\w+)\\s*new\\s*(\\(.*)"), (Match m) => "/* external factory ${m[1]} ${m[2]} */");

    return f;
  }

  String _finishEdgeCases(String f, String jsLibrary) {
    switch (jsLibrary) {
      case "THREE":
        f = f.replaceAll(new RegExp("ArrayLike"), "List");
        // solution has yet to be found
        f = f.replaceAll(new RegExp("void export function"), "//void export function");
        // fix bad factory definitions
        f = f.replaceAllMapped(
            new RegExp("external\\s+factory\\s+([A-Za-z0-9_]+)\\s*;"), (Match m) => "external factory ${m[1]}();");
        // fix double definition of ShaderChunk (three.js)
        f = f.replaceAll(new RegExp("external int get ShaderChunk;"), "");
        f = f.replaceAll(new RegExp("CurvePath<T \\(\\);"), "CurvePath ();");
        // fix Vector extends
        f = f.replaceAllMapped(new RegExp("(class Vector\\d)"), (Match m) => "${m[1]} extends Vector");

        //kill some stuff
        f = f.replaceAllMapped(new RegExp("(export var CurveUtils[^}]+\\})"), (Match m) => "/* already defined */");
        // delete things at end of three js
        f = f.replaceAll(new RegExp("\\}\\s*declare[^;]+;"), "");
        f = f.replaceAll(new RegExp("computed\\s+beforehand\\.\\s+\\*\\/"), "");
        f = f.replaceAll(new RegExp("external int get (Cache|Math);"), "");
        f = f.replaceAll(
            new RegExp("dynamic addAttribute\\(String name , dynamic array , num itemSize \\);external"), "");
        f = f.replaceAll(new RegExp("clone<T>\\(T"), "clone(Object3D");
        f = f.replaceAll(new RegExp("external Func0<dynamic> get toJSON;"), "//external Func0<dynamic> get toJSON;");
        f = f.replaceAll(new RegExp("enum LineMode[^;]+;[^;]+;"), "enum LineMode { dummy }");
        f = f.replaceAll(new RegExp("Curve<T ;"), "Curve();");
        f = f.replaceAll(new RegExp("external\\s+(BufferAttribute|InterleavedBuffer|Material) clone\\(\\);"), "");
        f = f.replaceAll(new RegExp("external\\s+Color set\\(Color color \\);"), "");
        f = f.replaceAll(new RegExp("external\\s+Color set\\(String color \\);"), "");
        f = f.replaceAll(
            new RegExp("external\\s+Matrix3 getInverse\\(Matrix4 matrix , bool throwOnInvertible \\);"), "");
        f = f.replaceAll(new RegExp("external\\s+Quaternion fromArray\\(List<num> xyzw , num offset \\);"), "");
        f = f.replaceAll(new RegExp("external\\s+List<num> toArray\\(List<num> xyzw , num offset \\);"), "");
        f = f.replaceAll(
            new RegExp("external static Quaternion slerp\\(Quaternion qa , Quaternion qb , Quaternion qm , num t \\);"),
            "");
        f = f.replaceAll(new RegExp("external static Vector3 (normal|barycoordFromPoint).*"), "");
        f = f.replaceAll(new RegExp("external static bool containsPoint.*"), "");
        f = f.replaceAll(new RegExp("Vector3 addScaledVector\\( Vector3 v , num s \\);external"), "");
        f = f.replaceAll(new RegExp("external\\s+void add\\(Object3D obj \\);"), "");
        f = f.replaceAll(new RegExp("external\\s+void setClearColor\\(Color color , num alpha \\);"), "");
        f = f.replaceAll(new RegExp("external\\s+void setClearColor\\(num color , num alpha \\);"), "");
        f = f.replaceAll(new RegExp("T getPointAt"), "Vector getPointAt");
        f = f.replaceAll(new RegExp("List<T>"), "List<Vector>");
        f = f.replaceAll(new RegExp("<\\s*T\\s*extends\\s*Vector\\s*>"), "");
        f = f.replaceAll(new RegExp("@JS\\(\\)\\s*class MeshLambertMaterialParameters"),
            "@anonymous\n@JS()\nclass MeshLambertMaterialParameters");
        break;
      case "BABYLON":
        f = f.replaceAll(new RegExp("external\\s+void setAttenuationFunction[^;]+;"), "");
        f = f.replaceAll(new RegExp("namespace Geometry\\.Primitives \\{"), "");
        f = f.replaceAll(new RegExp("Geometry\\.Primitives\\."), "");
        f = f.replaceAll(new RegExp("\\}\\s+@JS\\(\\)\\s*class GroundMesh"), "\n@JS()\nclass GroundMesh");
        f = f.replaceAll(new RegExp("\\}\\s+@JS\\(\\)\\s*class Navigator[^}]+}"), "}");
        f = f.replaceAll(new RegExp("\\}\\s+@JS\\(\\)\\s*class ILoadingScreen"), "\n@JS()\nclass ILoadingScreen");
        f = f.replaceAll(new RegExp("or internal pass"), "/*");
        f = f.replaceAll(new RegExp("List<dynamic>static"), "static List<dynamic>");
        f = f.replaceAll(new RegExp("_CreateBlocks<T>"), "_CreateBlocks");
        f = f.replaceAll(new RegExp("String var CollisionWorker;"), "");
        f = f.replaceAll(new RegExp("bool var WorkerIncluded;"), "");
        f = f.replaceAllMapped(new RegExp("(external factory) ([A-Za-z0-9_]+)<T>"), (Match m) => "${m[1]} ${m[2]}");
        f = f.replaceAllMapped(new RegExp("enum ([A-Za-z0-9_]+)\\s*\\{([^\\}]+)\\}"), (Match m) {
          return 'enum ${m[1]} { ${m[2].replaceAll(new RegExp("=\\s*\\d"), "")} }';
        });
        f = f.replaceAllMapped(new RegExp("\\}\\s*dynamic declare var HMDVRDevice;[^;]+;"), (Match m) => "");
        f = f.replaceAll(new RegExp("List<VoidFunc3<"), "VoidFunc3<List<");
        f = f.replaceAll(new RegExp("external\\s*Curve3 continue\\(Curve3 curve \\);"), "");
        f = f.replaceAllMapped(new RegExp("class Plane  extends _Primitive  \\{\\s*external factory Plane"), (Match m) => "class PlanePrimitive extends _Primitive {\n\t\texternal factory PlanePrimitive");
        /*
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+_enableEffect\\(String renderEffectName, Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+_disableEffect\\(String renderEffectName, Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+_attachCameras\\(Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+_detachCameras\\(Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+_enable\\(Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+_disable\\(Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+_enableDisplayOnlyPass\\(dynamic passName, Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+_disableDisplayOnlyPass\\(dynamic passName, Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+attachCamerasToRenderPipeline\\s*\\(\\s*String\\s+renderPipelineName\\s*,\\s*Camera)"), (Match m) => "\n//${m[1]}");
        f = f.replaceAllMapped(new RegExp("(external\\s+dynamic\\s+detachCamerasFromRenderPipeline\\s*\\(\\s*String renderPipelineName\\s*,\\s*Camera)"), (Match m) => "\n//${m[1]}");
        */
        //f = f.replaceAll(new RegExp("List<T>"), "List<dynamic>");
        /*




    kill:
    }

 dynamic declare var HMDVRDevice;
 dynamic declare var PositionSensorVRDevice;

dynamic _attachCameras(Camera cameras )
dynamic _detachCameras(Camera cameras )
dynamic _enable(Camera cameras )
dynamic _disable(Camera cameras )
         */
        break;
    }

    return f;
  }
}
