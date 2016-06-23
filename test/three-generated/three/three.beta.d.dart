@JS('THREE')
library threejs;

import "package:func/func.dart";
import "package:js/js.dart";
import 'dart:html';

external int get REVISION;

enum MOUSE { LEFT, MIDDLE, RIGHT }

enum CullFace { dummy }
external int get CullFaceNone;
external int get CullFaceBack;
external int get CullFaceFront;
external int get CullFaceFrontBack;

enum FrontFaceDirection { dummy }
external int get FrontFaceDirectionCW;
external int get FrontFaceDirectionCCW;

enum ShadowMapType { dummy }
external int get BasicShadowMap;
external int get PCFShadowMap;
external int get PCFSoftShadowMap;

enum Side { dummy }
external int get FrontSide;
external int get BackSide;
external int get DoubleSide;

enum Shading { dummy }
external int get NoShading;
external int get FlatShading;
external int get SmoothShading;

enum Colors { dummy }
external int get NoColors;
external int get FaceColors;
external int get VertexColors;

enum Blending { dummy }
external int get NoBlending;
external int get NormalBlending;
external int get AdditiveBlending;
external int get SubtractiveBlending;
external int get MultiplyBlending;
external int get CustomBlending;

enum BlendingEquation { dummy }
external int get AddEquation;
external int get SubtractEquation;
external int get ReverseSubtractEquation;
external int get MinEquation;
external int get MaxEquation;

enum BlendingDstFactor { dummy }
external int get ZeroFactor;
external int get OneFactor;
external int get SrcColorFactor;
external int get OneMinusSrcColorFactor;
external int get SrcAlphaFactor;
external int get OneMinusSrcAlphaFactor;
external int get DstAlphaFactor;
external int get OneMinusDstAlphaFactor;

enum BlendingSrcFactor { dummy }
external int get DstColorFactor;
external int get OneMinusDstColorFactor;
external int get SrcAlphaSaturateFactor;

enum DepthModes { dummy }
external int get NeverDepth;
external int get AlwaysDepth;
external int get LessDepth;
external int get LessEqualDepth;
external int get EqualDepth;
external int get GreaterEqualDepth;
external int get GreaterDepth;
external int get NotEqualDepth;

enum Combine { dummy }
external int get MultiplyOperation;
external int get MixOperation;
external int get AddOperation;

enum Mapping { dummy }
external int get UVMapping;
external int get CubeReflectionMapping;
external int get CubeRefractionMapping;
external int get EquirectangularReflectionMapping;
external int get EquirectangularRefractionMapping;
external int get SphericalReflectionMapping;

enum Wrapping { dummy }
external int get RepeatWrapping;
external int get ClampToEdgeWrapping;
external int get MirroredRepeatWrapping;

enum TextureFilter { dummy }
external int get NearestFilter;
external int get NearestMipMapNearestFilter;
external int get NearestMipMapLinearFilter;
external int get LinearFilter;
external int get LinearMipMapNearestFilter;
external int get LinearMipMapLinearFilter;

enum TextureDataType { dummy }
external int get UnsignedByteType;
external int get ByteType;
external int get ShortType;
external int get UnsignedShortType;
external int get IntType;
external int get UnsignedIntType;
external int get FloatType;
external int get HalfFloatType;

enum PixelType { dummy }
external int get UnsignedShort4444Type;
external int get UnsignedShort5551Type;
external int get UnsignedShort565Type;

enum PixelFormat { dummy }
external int get AlphaFormat;
external int get RGBFormat;
external int get RGBAFormat;
external int get LuminanceFormat;
external int get LuminanceAlphaFormat;
external int get RGBEFormat;

enum CompressedPixelFormat { dummy }
external int get RGB_S3TC_DXT1_Format;
external int get RGBA_S3TC_DXT1_Format;
external int get RGBA_S3TC_DXT3_Format;
external int get RGBA_S3TC_DXT5_Format;

external int get RGB_PVRTC_4BPPV1_Format;
external int get RGB_PVRTC_2BPPV1_Format;
external int get RGBA_PVRTC_4BPPV1_Format;
external int get RGBA_PVRTC_2BPPV1_Format;

enum AnimationActionLoopStyles { dummy }
external int get LoopOnce;
external int get LoopRepeat;
external int get LoopPingPong;

//void export function warn(dynamic message , ...List<dynamic> optionalParams );
//void export function error(dynamic message , ...List<dynamic> optionalParams );
//void export function log(dynamic message , ...List<dynamic> optionalParams );

@JS()
class WebGLRenderer implements Renderer{
  external factory WebGLRenderer([WebGLRendererParameters parameters]);
  external void setSize(num width , num height );
  external CanvasElement get domElement;
}

/*@anonymous*/
@JS()
class AnimationAction {
  external factory AnimationAction(AnimationClip clip, num startTime, num timeScale, num weight, bool loop);

  external AnimationClip get clip;
  external set clip(AnimationClip v);
  external Mesh get localRoot;
  external set localRoot(Mesh v);
  external num get startTime;
  external set startTime(num v);
  external num get timeScale;
  external set timeScale(num v);
  external num get weight;
  external set weight(num v);
  external AnimationActionLoopStyles get loop;
  external set loop(AnimationActionLoopStyles v);
  external num get loopCount;
  external set loopCount(num v);
  external bool get enabled;
  external set enabled(bool v);
  external num get actionTime;
  external set actionTime(num v);
  external num get clipTime;
  external set clipTime(num v);
  external List<PropertyBinding> get propertyBindings;
  external set propertyBindings(List<PropertyBinding> v);
  external AnimationAction setLocalRoot(Mesh localRoot);
  external num updateTime(num clipDeltaTime);
  external AnimationAction syncWith(AnimationAction action);
  external AnimationAction warpToDuration(num duration);
  external AnimationAction init(num time);
  external List<dynamic> update(num clipDeltaTime);
  external num getTimeScaleAt(num time);
  external num getWeightAt(num time);
}

/*@anonymous*/
@JS()
class AnimationClip {
  external factory AnimationClip(String name, num duration, List<KeyframeTrack> tracks);

  external String get name;
  external set name(String v);
  external List<KeyframeTrack> get tracks;
  external set tracks(List<KeyframeTrack> v);
  external num get duration;
  external set duration(num v);
  external List<dynamic> get results;
  external set results(List<dynamic> v);
  external List<dynamic> getAt(num clipTime);
  external AnimationClip trim();
  external AnimationClip optimize();

  external static AnimationClip CreateFromMorphTargetSequence(
      String name, List<MorphTarget> morphTargetSequence, num fps);
  external AnimationClip findByName(AnimationClip clipArray, String name);
  external static List<AnimationClip> CreateClipsFromMorphTargetSequences(List<MorphTarget> morphTargets, num fps);
  external AnimationClip parse(dynamic json);
  external AnimationClip parseAnimation(dynamic animation, List<Bone> bones, String nodeName);
}

/*@anonymous*/
@JS()
class AnimationMixer {
  external factory AnimationMixer(dynamic root);

  external dynamic get root;
  external set root(dynamic v);
  external num get time;
  external set time(num v);
  external num get timeScale;
  external set timeScale(num v);
  external AnimationAction get actions;
  external set actions(AnimationAction v);
  external dynamic get propertyBindingMap;
  external set propertyBindingMap(dynamic v);
  external void addAction(AnimationAction action);
  external AnimationMixer removeAllActions();
  external AnimationMixer removeAction(AnimationAction action);
  external AnimationAction findActionByName(String name);
  external AnimationMixer play(AnimationAction action, num optionalFadeInDuration);
  external AnimationMixer fadeOut(AnimationAction action, num duration);
  external AnimationMixer fadeIn(AnimationAction action, num duration);
  external AnimationMixer warp(
      AnimationAction action, NumberKeyframeTrack startTimeScale, NumberKeyframeTrack endTimeScale, num duration);
  external AnimationMixer crossFade(
      AnimationAction fadeOutAction, AnimationAction fadeInAction, num duration, bool warp);
  external AnimationMixer update(num deltaTime);
}

/*@anonymous*/
@JS()
class AnimationUtils {
  external factory AnimationUtils();

  external bool getEqualsFunc(dynamic exemplarValue);
  external dynamic lerp(dynamic a, dynamic b, num alpha, bool interTrack);
  external dynamic lerp_object(dynamic a, dynamic b, num alpha);
  external dynamic slerp_object(dynamic a, dynamic b, num alpha);
  external dynamic lerp_num(dynamic a, dynamic b, num alpha);
  external dynamic lerp_bool(dynamic a, dynamic b, num alpha);
  external dynamic lerp_bool_immediate(dynamic a, dynamic b, num alpha);
  external dynamic lerp_String(dynamic a, dynamic b, num alpha);
  external dynamic lerp_String_immediate(dynamic a, dynamic b, num alpha);
  external Function getLerpFunc(dynamic exemplarValue, bool interTrack);
}

/*@anonymous*/
@JS()
class KeyframeTrack {
  external factory KeyframeTrack(String name, List<dynamic> keys);

  external String get name;
  external set name(String v);
  external List<dynamic> get keys;
  external set keys(List<dynamic> v);
  external num get lastIndex;
  external set lastIndex(num v);
  external dynamic getAt(num time);
  external KeyframeTrack shift(num timeOffset);
  external KeyframeTrack scale(num timeScale);
  external KeyframeTrack trim(num startTime, num endTime);
  external KeyframeTrack validate();
  external KeyframeTrack optimize();
  external num keyComparator(KeyframeTrack key0, KeyframeTrack key1);
  external KeyframeTrack parse(dynamic json);
  external dynamic GetTrackTypeForTypeName(String typeName);
}

/*@anonymous*/
@JS()
class PropertyBinding {
  external factory PropertyBinding(dynamic rootNode, String trackName);

  external dynamic get rootNode;
  external set rootNode(dynamic v);
  external String get trackName;
  external set trackName(String v);
  external num get referenceCount;
  external set referenceCount(num v);
  external dynamic get originalValue;
  external set originalValue(dynamic v);
  external String get directoryName;
  external set directoryName(String v);
  external String get nodeName;
  external set nodeName(String v);
  external String get objectName;
  external set objectName(String v);
  external num get objectIndex;
  external set objectIndex(num v);
  external String get propertyName;
  external set propertyName(String v);
  external num get propertyIndex;
  external set propertyIndex(num v);
  external dynamic get node;
  external set node(dynamic v);
  external num get cumulativeValue;
  external set cumulativeValue(num v);
  external num get cumulativeWeight;
  external set cumulativeWeight(num v);
  external void reset();
  external void accumulate(dynamic value, num weight);
  external void unbind();
  external void bind();
  external void apply();
  external dynamic parseTrackName(String trackName);
  external dynamic findNode(dynamic root, String nodeName);
}

/*@anonymous*/
@JS()
class BooleanKeyframeTrack {
  external factory BooleanKeyframeTrack /* extends KeyframeTrack */ (String name, List<dynamic> keys);

  external dynamic get result;
  external set result(dynamic v);
  external void setResult(dynamic value);
  external dynamic lerpValues(dynamic value0, dynamic value1, num alpha);
  external bool compareValues(dynamic value0, dynamic value1);
  external BooleanKeyframeTrack clone();
  external BooleanKeyframeTrack parse(dynamic json);
}

/*@anonymous*/
@JS()
class NumberKeyframeTrack {
  external factory NumberKeyframeTrack();

  external dynamic get result;
  external set result(dynamic v);
  external void setResult(dynamic value);
  external dynamic lerpValues(dynamic value0, dynamic value1, num alpha);
  external bool compareValues(dynamic value0, dynamic value1);
  external NumberKeyframeTrack clone();
  external NumberKeyframeTrack parse(dynamic json);
}

/*@anonymous*/
@JS()
class QuaternionKeyframeTrack {
  external factory QuaternionKeyframeTrack();

  external dynamic get result;
  external set result(dynamic v);
  external void setResult(dynamic value);
  external dynamic lerpValues(dynamic value0, dynamic value1, num alpha);
  external bool compareValues(dynamic value0, dynamic value1);
  external QuaternionKeyframeTrack clone();
  external QuaternionKeyframeTrack parse(dynamic json);
}

/*@anonymous*/
@JS()
class StringKeyframeTrack {
  external factory StringKeyframeTrack();

  external dynamic get result;
  external set result(dynamic v);
  external void setResult(dynamic value);
  external dynamic lerpValues(dynamic value0, dynamic value1, num alpha);
  external bool compareValues(dynamic value0, dynamic value1);
  external StringKeyframeTrack clone();
  external StringKeyframeTrack parse(dynamic json);
}

/*@anonymous*/
@JS()
class VectorKeyframeTrack {
  external factory VectorKeyframeTrack();

  external dynamic get result;
  external set result(dynamic v);
  external void setResult(dynamic value);
  external dynamic lerpValues(dynamic value0, dynamic value1, num alpha);
  external bool compareValues(dynamic value0, dynamic value1);
  external VectorKeyframeTrack clone();
  external VectorKeyframeTrack parse(dynamic json);
}

/*@anonymous*/
@JS()
class Camera {
  external factory Camera /* extends Object3D */ ();

  external Matrix4 get matrixWorldInverse;
  external set matrixWorldInverse(Matrix4 v);

  external Matrix4 get projectionMatrix;
  external set projectionMatrix(Matrix4 v);
  external Vector3 getWorldDirection(Vector3 optionalTarget);
  external void lookAt(Vector3 vector);
  external Camera clone();
  external Camera copy(Camera camera);
}

/*@anonymous*/
@JS()
class CubeCamera {
  external factory CubeCamera /* extends Object3D */ (num near, num far, num cubeResolution);

  external WebGLRenderTargetCube get renderTarget;
  external set renderTarget(WebGLRenderTargetCube v);
  external void updateCubeMap(Renderer renderer, Scene scene);
}

/**
 * Camera with orthographic projection
 *
 * @example
 * var camera = new THREE.OrthographicCamera( width / - 2, width / 2, height / 2, height / - 2, 1, 1000 );
 * scene.add( camera );
 *
 * @see <a href="https:
 */

/*@anonymous*/
@JS()
class OrthographicCamera {
  external factory OrthographicCamera /* extends Camera */ (
      num left, num right, num top, num bottom, num near, num far);

  /**
   * @param left Camera frustum left plane.
   * @param right Camera frustum right plane.
   * @param top Camera frustum top plane.
   * @param bottom Camera frustum bottom plane.
   * @param near Camera frustum near plane.
   * @param far Camera frustum far plane.
   */

  external num get zoom;
  external set zoom(num v);

  external num get left;
  external set left(num v);

  external num get right;
  external set right(num v);

  external num get top;
  external set top(num v);

  external num get bottom;
  external set bottom(num v);

  external num get near;
  external set near(num v);

  external num get far;
  external set far(num v);
  external void updateProjectionMatrix();
  external OrthographicCamera clone();
  external OrthographicCamera copy(OrthographicCamera source);
  external dynamic toJSON(dynamic meta);
}

/**
 * Camera with perspective projection.
 *
 * # example
 *     var camera = new THREE.PerspectiveCamera( 45, width / height, 1, 1000 );
 *     scene.add( camera );
 *
 * @source https:
 */

/*@anonymous*/
@JS()
class PerspectiveCamera {
  external factory PerspectiveCamera /* extends Camera */ (num fov, num aspect, num near, num far);

  /**
   * @param fov Camera frustum vertical field of view. Default value is 50.
   * @param aspect Camera frustum aspect ratio. Default value is 1.
   * @param near Camera frustum near plane. Default value is 0.1.
   * @param far Camera frustum far plane. Default value is 2000.
   */

  external num get zoom;
  external set zoom(num v);

  external num get fov;
  external set fov(num v);

  external num get aspect;
  external set aspect(num v);

  external num get near;
  external set near(num v);

  external num get far;
  external set far(num v);

  /**
   * Uses focal length (in mm) to estimate and set FOV 35mm (fullframe) camera is used if frame size is not specified.
   * Formula based on http:
   * @param focalLength focal length
   * @param frameHeight frame size. Default value is 24.
   */
  external void setLens(num focalLength, num frameHeight);

  /**
   * Sets an offset in a larger frustum. This is useful for multi-window or multi-monitor/multi-machine setups.
   * For example, if you have 3x2 monitors and each monitor is 1920x1080 and the monitors are in grid like this:
   *
   *     +---+---+---+
   *     | dynamic  |
   *     +---+---+---+
   *     | dynamic  |
   *     +---+---+---+
   *
   * then for each monitor you would call it like this:
   *
   *     var w = external 192 get 0;
      external set 0(192 v);
   *     var h = external 108 get 0;
      external set 0(108 v);
   *     var fullWidth = w * 3;
   *     var fullHeight = h * 2;
   *
   *
   *     camera.setViewOffset( fullWidth, fullHeight, w * 0, h * 0, w, h );
   *
   *     camera.setViewOffset( fullWidth, fullHeight, w * 1, h * 0, w, h );
   *
   *     camera.setViewOffset( fullWidth, fullHeight, w * 2, h * 0, w, h );
   *
   *     camera.setViewOffset( fullWidth, fullHeight, w * 0, h * 1, w, h );
   *
   *     camera.setViewOffset( fullWidth, fullHeight, w * 1, h * 1, w, h );
   *
   *     camera.setViewOffset( fullWidth, fullHeight, w * 2, h * 1, w, h ); Note there is no reason monitors have to be the same size or in a grid.
   *
   * @param fullWidth full width of multiview setup
   * @param fullHeight full height of multiview setup
   * @param x horizontal offset of subcamera
   * @param y vertical offset of subcamera
   * @param width width of subcamera
   * @param height height of subcamera
   */
  external void setViewOffset(num fullWidth, num fullHeight, num x, num y, num width, num height);
  external void updateProjectionMatrix();
  external PerspectiveCamera clone();
  external PerspectiveCamera copy(PerspectiveCamera source);
  external dynamic toJSON(dynamic meta);
}

/*@anonymous*/
@JS()
class BufferAttribute {
  external factory BufferAttribute(List<num> array, num itemSize);

  external String get uuid;
  external set uuid(String v);
  external List<num> get array;
  external set array(List<num> v);
  external num get itemSize;
  external set itemSize(num v);
  external bool get dynamic;
  external set dynamic(bool v);
/*         updateRange #num offset , count:num# ; */
  external num get version;
  external set version(num v);

  external bool get needsUpdate;
  external set needsUpdate(bool v);
  /** Deprecated, use count instead */
  external num get length;
  external set length(num v);
  external num get count;
  external set count(num v);
  external BufferAttribute setDynamic(bool dynamic);
  external BufferAttribute clone();
  external BufferAttribute copy(BufferAttribute source);
  external BufferAttribute copyAt(num index1, BufferAttribute attribute, num index2);
  external BufferAttribute copyArray(List<num> array);
/*         copyColorsArray(colors #num r , num g , b:num# []): external BufferAttribut get e;
		external set e(BufferAttribut v); */
/*         copyIndicesArray(indices #num a , num b , c:num# []): external BufferAttribut get e;
		external set e(BufferAttribut v); */
/*         copyVector2sArray(vectors #num x , y:num# []): external BufferAttribut get e;
		external set e(BufferAttribut v); */
/*         copyVector3sArray(vectors #num x , num y , z:num# []): external BufferAttribut get e;
		external set e(BufferAttribut v); */
/*         copyVector4sArray(vectors #num x , num y , num z , w:num# []): external BufferAttribut get e;
		external set e(BufferAttribut v); */
  external BufferAttribute set(List<num> value, num offset);
  external num getX(num index);
  external BufferAttribute setX(num index, num x);
  external num getY(num index);
  external BufferAttribute setY(num index, num y);
  external num getZ(num index);
  external BufferAttribute setZ(num index, num z);
  external num getW(num index);
  external BufferAttribute setW(num index, num z);
  external BufferAttribute setXY(num index, num x, num y);
  external BufferAttribute setXYZ(num index, num x, num y, num z);
  external BufferAttribute setXYZW(num index, num x, num y, num z, num w);
}

/*@anonymous*/
@JS()
class Int8Attribute {
  external factory Int8Attribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/*@anonymous*/
@JS()
class Uint8Attribute {
  external factory Uint8Attribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/*@anonymous*/
@JS()
class Uint8ClampedAttribute {
  external factory Uint8ClampedAttribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/*@anonymous*/
@JS()
class Int16Attribute {
  external factory Int16Attribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/*@anonymous*/
@JS()
class Uint16Attribute {
  external factory Uint16Attribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/*@anonymous*/
@JS()
class Int32Attribute {
  external factory Int32Attribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/*@anonymous*/
@JS()
class Uint32Attribute {
  external factory Uint32Attribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/*@anonymous*/
@JS()
class Float32Attribute {
  external factory Float32Attribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/*@anonymous*/
@JS()
class Float64Attribute {
  external factory Float64Attribute /* extends BufferAttribute */ (dynamic array, num itemSize);
}

/**
 * This is a superefficent class for geometries because it saves all data in buffers.
 * It reduces memory costs and cpu cycles. But it is not as easy to work with because of all the nessecary buffer calculations.
 * It is mainly interesting when working static with objects.
 *
 * @see <a href="https:
 */

/*@anonymous*/
@JS()
class BufferGeometry {
  external factory BufferGeometry();

  external static num get MaxIndex;

  external num get id;
  external set id(num v);
  external String get uuid;
  external set uuid(String v);
  external String get name;
  external set name(String v);
  external String get type;
  external set type(String v);
  external BufferAttribute get index;
  external set index(BufferAttribute v);
  external dynamic get attributes;
  external set attributes(dynamic v);
  external dynamic get morphAttributes;
  external set morphAttributes(dynamic v);
/*         groups #num start , num count , materialIndex: num# []; */
  external Box3 get boundingBox;
  external set boundingBox(Box3 v);
  external BoundingSphere get boundingSphere;
  external set boundingSphere(BoundingSphere v);
/*         drawRange # num start , count: num # ; */

  /** Deprecated. */ external void addIndex(BufferAttribute index);
  external BufferAttribute getIndex();
  external void setIndex(BufferAttribute index);

  /** Deprecated. This overloaded method is deprecated. */ external dynamic addAttribute(
      String name, dynamic array, num itemSize);
  external dynamic getAttribute(String name);
  external void removeAttribute(String name);

  /** Deprecated. */
  external Func0<dynamic> get drawcalls;
  external set drawcalls(Func0<dynamic> v);
  /** Deprecated. */
  external Func0<dynamic> get offsets;
  external set offsets(Func0<dynamic> v);

  /** Deprecated. Use addGroup */ external void addDrawCall(num start, num count, num index);
  /** Deprecated. */ external void clearDrawCalls();
  external void addGroup(num start, num count, num materialIndex);
  external void clearGroups();
  external void setDrawRange(num start, num count);
  external void applyMatrix(Matrix4 matrix);
  external BufferGeometry rotateX(num angle);
  external BufferGeometry rotateY(num angle);
  external BufferGeometry rotateZ(num angle);
  external BufferGeometry translate(num x, num y, num z);
  external BufferGeometry scale(num x, num y, num z);
  external void lookAt(Vector3 v);
  external Vector3 center();
  external void setFromObject(Object3D object);
  external void updateFromObject(Object3D object);
  external BufferGeometry fromGeometry(Geometry geometry, dynamic settings);
  external BufferGeometry fromDirectGeometry(DirectGeometry geometry);
  external void computeBoundingBox();
  external void computeBoundingSphere();
  external void computeFaceNormals();
  external void computeVertexNormals();
  external void computeOffsets(num size);
  external BufferGeometry merge(BufferGeometry geometry, num offset);
  external void normalizeNormals();
  external Func0<dynamic> get toJSON;
  external set toJSON(Func0<dynamic> v);
  external BufferGeometry clone();
  external BufferGeometry copy(BufferGeometry source);
  external void dispose();

  external void addEventListener(String type, VoidFunc1<dynamic> listener);
  external void hasEventListener(String type, VoidFunc1<dynamic> listener);
  external void removeEventListener(String type, VoidFunc1<dynamic> listener);
/*         dispatchEvent(event # type: external Strin get g;
		external set g(Strin v); target: external dynami get c;
		external set c(dynami v); # ): external voi get d;
		external set d(voi v); */

}

/*@anonymous*/
@JS()
class Channels {
  external factory Channels();

  external num get mask;
  external set mask(num v);
  external void set(num channel);
  external void enable(num channel);
  external void toggle(num channel);
  external void disable(num channel);
}

/**
 * Object for keeping track of time.
 *
 * @see <a href="https:
 */

/*@anonymous*/
@JS()
class Clock {
  external factory Clock(bool autoStart);

  external bool get autoStart;
  external set autoStart(bool v);

  external num get startTime;
  external set startTime(num v);

  external num get oldTime;
  external set oldTime(num v);

  external num get elapsedTime;
  external set elapsedTime(num v);

  external bool get running;
  external set running(bool v);
  external void start();
  external void stop();
  external num getElapsedTime();
  external num getDelta();
}

/*@anonymous*/
@JS()
class DirectGeometry {
  external factory DirectGeometry();

  external num get id;
  external set id(num v);
  external String get uuid;
  external set uuid(String v);
  external String get name;
  external set name(String v);
  external String get type;
  external set type(String v);
  external List<num> get indices;
  external set indices(List<num> v);
  external List<Vector3> get vertices;
  external set vertices(List<Vector3> v);
  external List<Vector3> get normals;
  external set normals(List<Vector3> v);
  external List<Color> get colors;
  external set colors(List<Color> v);
  external List<Vector2> get uvs;
  external set uvs(List<Vector2> v);
  external List<Vector2> get uvs2;
  external set uvs2(List<Vector2> v);
/*         groups #num start , materialIndex: num# []; */
  external List<MorphTarget> get morphTargets;
  external set morphTargets(List<MorphTarget> v);
  external List<num> get skinWeights;
  external set skinWeights(List<num> v);
  external List<num> get skinIndices;
  external set skinIndices(List<num> v);
  external Box3 get boundingBox;
  external set boundingBox(Box3 v);
  external BoundingSphere get boundingSphere;
  external set boundingSphere(BoundingSphere v);
  external bool get verticesNeedUpdate;
  external set verticesNeedUpdate(bool v);
  external bool get normalsNeedUpdate;
  external set normalsNeedUpdate(bool v);
  external bool get colorsNeedUpdate;
  external set colorsNeedUpdate(bool v);
  external bool get uvsNeedUpdate;
  external set uvsNeedUpdate(bool v);
  external bool get groupsNeedUpdate;
  external set groupsNeedUpdate(bool v);
  external void computeBoundingBox();
  external void computeBoundingSphere();
  external void computeGroups(Geometry geometry);
  external DirectGeometry fromGeometry(Geometry geometry);
  external void dispose();
  external void addEventListener(String type, VoidFunc1<dynamic> listener);
  external void hasEventListener(String type, VoidFunc1<dynamic> listener);
  external void removeEventListener(String type, VoidFunc1<dynamic> listener);
/*         dispatchEvent(event # type: external Strin get g;
		external set g(Strin v); target: external dynami get c;
		external set c(dynami v); # ): external voi get d;
		external set d(voi v); */

}

/**
 * JavaScript events for custom objects
 *
 * # Example
 *     var Car = function () {
 *
 *         EventDispatcher.call( this );
 *         this.start = function () {
 *
    'vroom vroom!' } ) *             this.dispatchEvent( { type: 'start', message;
 *
 *         };
 *
 *     };
 *
 *     var car = new Car();
 *     car.addEventListener( 'start', function ( event ) {
 *
 *         alert( event.message );
 *
 *     } );
 *     car.start();
 *
 * @source src/core/EventDispatcher.js
 */

/*@anonymous*/
@JS()
class EventDispatcher {
  external factory EventDispatcher();

  /**
   * Adds a listener to an event type.
   * @param type The type of the listener that gets removed.
   * @param listener The listener function that gets removed.
   */
  external void addEventListener(String type, VoidFunc1<dynamic> listener);

  /**
   * Adds a listener to an event type.
   * @param type The type of the listener that gets removed.
   * @param listener The listener function that gets removed.
   */
  external void hasEventListener(String type, VoidFunc1<dynamic> listener);

  /**
   * Removes a listener from an event type.
   * @param type The type of the listener that gets removed.
   * @param listener The listener function that gets removed.
   */
  external void removeEventListener(String type, VoidFunc1<dynamic> listener);

/*         dispatchEvent(event # type: external Strin get g;
		external set g(Strin v); target: external dynami get c;
		external set c(dynami v); # ): external voi get d;
		external set d(voi v); */

}

/**
 * Triangle face.
 *
 * # Example
 *     var normal = new THREE.Vector3( 0, 1, 0 );
 *     var color = new THREE.Color( 0xffaa00 );
 *     var face = new THREE.Face3( 0, 1, 2, normal, color, 0 );
 *
 * @source https:
 */

/*@anonymous*/
@JS()
class Face3 {
  external factory Face3(num a, num b, num c, List<Vector3> vertexNormals, List<Color> vertexColors, num materialIndex);

  /**
   * @param a Vertex A index.
   * @param b Vertex B index.
   * @param c Vertex C index.
   * @param normal Face normal or array of vertex normals.
   * @param color Face color or array of vertex colors.
   * @param materialIndex Material index.
   */

  external num get a;
  external set a(num v);

  external num get b;
  external set b(num v);

  external num get c;
  external set c(num v);

  external Vector3 get normal;
  external set normal(Vector3 v);

  external List<Vector3> get vertexNormals;
  external set vertexNormals(List<Vector3> v);

  external Color get color;
  external set color(Color v);

  external List<Color> get vertexColors;
  external set vertexColors(List<Color> v);

  external List<num> get vertexTangents;
  external set vertexTangents(List<num> v);

  external num get materialIndex;
  external set materialIndex(num v);
  external Face3 clone();
}

/*@anonymous*/
@JS()
class MorphTarget {
  external factory MorphTarget();

  external String get name;
  external set name(String v);
  external List<Vector3> get vertices;
  external set vertices(List<Vector3> v);
}

/*@anonymous*/
@JS()
class MorphColor {
  external factory MorphColor();

  external String get name;
  external set name(String v);
  external List<Color> get colors;
  external set colors(List<Color> v);
}

/*@anonymous*/
@JS()
class MorphNormals {
  external factory MorphNormals();

  external String get name;
  external set name(String v);
  external List<Vector3> get normals;
  external set normals(List<Vector3> v);
}

/*@anonymous*/
@JS()
class BoundingSphere {
  external factory BoundingSphere();

  external num get radius;
  external set radius(num v);
}

/**
 * Base class for geometries
 *
 * # Example
 *     var geometry = new THREE.Geometry();
 *     geometry.vertices.push( new THREE.Vector3( -10, 10, 0 ) );
 *     geometry.vertices.push( new THREE.Vector3( -10, -10, 0 ) );
 *     geometry.vertices.push( new THREE.Vector3( 10, -10, 0 ) );
 *     geometry.faces.push( new THREE.Face3( 0, 1, 2 ) );
 *     geometry.computeBoundingSphere();
 *
 * @see https:
 */

/*@anonymous*/
@JS()
class Geometry {
  external factory Geometry();

  external num get id;

  external set id(num v);

  external String get uuid;

  external set uuid(String v);

  external String get name;

  external set name(String v);

  external String get type;

  external set type(String v);

  external List<Vector3> get vertices;

  external set vertices(List<Vector3> v);

  /**
   * Array of vertex colors, matching num and order of vertices.
   * Used in ParticleSystem, Line and Ribbon.
   * Meshes use per-face-use-of-vertex colors embedded directly in faces.
   * To signal an update in this array, Geometry.colorsNeedUpdate needs to be set to true.
   */
  external List<Color> get colors;

  external set colors(List<Color> v);

  /**
   * Array of triangles or/and quads.
   * The array of faces describe how each vertex in the model is connected with each other.
   * To signal an update in this array, Geometry.elementsNeedUpdate needs to be set to true.
   */
  external List<Face3> get faces;

  external set faces(List<Face3> v);
}

/*@anonymous*/
@JS()
class InstancedBufferAttribute {
  external factory InstancedBufferAttribute /* extends BufferAttribute */ (
      List<num> data, num itemSize, num meshPerAttribute);

  external num get meshPerAttribute;
  external set meshPerAttribute(num v);
  external InstancedBufferAttribute clone();
  external InstancedBufferAttribute copy(InstancedBufferAttribute source);
}

/*@anonymous*/
@JS()
class InstancedBufferGeometry {
  external factory InstancedBufferGeometry /* extends BufferGeometry */ ();

  /*         groups #num start , num count , instances:num# []; */ external void addGroup(
      num start, num count, num instances);
  external InstancedBufferGeometry clone();
  external InstancedBufferGeometry copy(InstancedBufferGeometry source);
}

/*@anonymous*/
@JS()
class InstancedInterleavedBuffer {
  external factory InstancedInterleavedBuffer /* extends InterleavedBuffer */ (
      List<num> array, num stride, num meshPerAttribute);

  external num get meshPerAttribute;
  external set meshPerAttribute(num v);
  external InstancedInterleavedBuffer clone();
  external InstancedInterleavedBuffer copy(InstancedInterleavedBuffer source);
}

/*@anonymous*/
@JS()
class InterleavedBuffer {
  external factory InterleavedBuffer(List<num> array, num stride);

  external List<num> get array;
  external set array(List<num> v);
  external num get stride;
  external set stride(num v);
  external bool get dynamic;
  external set dynamic(bool v);
/*         updateRange #num offset , count:num# ; */
  external num get version;
  external set version(num v);
  external num get length;
  external set length(num v);
  external num get count;
  external set count(num v);
  external bool get needsUpdate;
  external set needsUpdate(bool v);
  external InterleavedBuffer setDynamic(bool dynamic);
  external InterleavedBuffer clone();
  external InterleavedBuffer copy(InterleavedBuffer source);
  external InterleavedBuffer copyAt(num index1, InterleavedBufferAttribute attribute, num index2);
  external InterleavedBuffer set(List<num> value, num index);
}

/*@anonymous*/
@JS()
class InterleavedBufferAttribute {
  external factory InterleavedBufferAttribute(InterleavedBuffer interleavedBuffer, num itemSize, num offset);

  external String get uuid;
  external set uuid(String v);
  external InterleavedBuffer get data;
  external set data(InterleavedBuffer v);
  external num get itemSize;
  external set itemSize(num v);
  external num get offset;
  external set offset(num v);
  /** Deprecated, use count instead */
  external num get length;
  external set length(num v);
  external num get count;
  external set count(num v);
  external num getX(num index);
  external InterleavedBufferAttribute setX(num index, num x);
  external num getY(num index);
  external InterleavedBufferAttribute setY(num index, num y);
  external num getZ(num index);
  external InterleavedBufferAttribute setZ(num index, num z);
  external num getW(num index);
  external InterleavedBufferAttribute setW(num index, num z);
  external InterleavedBufferAttribute setXY(num index, num x, num y);
  external InterleavedBufferAttribute setXYZ(num index, num x, num y, num z);
  external InterleavedBufferAttribute setXYZW(num index, num x, num y, num z, num w);
}

/*@anonymous*/
@JS()
class Object3D {
  external factory Object3D();

  external num get id;
  external set id(num v);

  external String get uuid;
  external set uuid(String v);

  external String get name;
  external set name(String v);

  external String get type;
  external set type(String v);

  external Object3D get parent;
  external set parent(Object3D v);

  external Channels get channels;
  external set channels(Channels v);

  external List<Object3D> get children;
  external set children(List<Object3D> v);

  external Vector3 get up;
  external set up(Vector3 v);

  external Vector3 get position;
  external set position(Vector3 v);

  external Euler get rotation;
  external set rotation(Euler v);

  external Quaternion get quaternion;
  external set quaternion(Quaternion v);

  external Vector3 get scale;
  external set scale(Vector3 v);

  external Matrix4 get modelViewMatrix;
  external set modelViewMatrix(Matrix4 v);

  external Matrix3 get normalMatrix;
  external set normalMatrix(Matrix3 v);

  external bool get rotationAutoUpdate;
  external set rotationAutoUpdate(bool v);

  external Matrix4 get matrix;
  external set matrix(Matrix4 v);

  external Matrix4 get matrixWorld;
  external set matrixWorld(Matrix4 v);

  external bool get matrixAutoUpdate;
  external set matrixAutoUpdate(bool v);

  external bool get matrixWorldNeedsUpdate;
  external set matrixWorldNeedsUpdate(bool v);

  external bool get visible;
  external set visible(bool v);

  external bool get castShadow;
  external set castShadow(bool v);

  external bool get receiveShadow;
  external set receiveShadow(bool v);

  external bool get frustumCulled;
  external set frustumCulled(bool v);

  external num get renderOrder;
  external set renderOrder(num v);

  external dynamic get userData;
  external set userData(dynamic v);

  external Vector3 get DefaultUp;
  external set DefaultUp(Vector3 v);
  external Vector3 get DefaultMatrixAutoUpdate;
  external set DefaultMatrixAutoUpdate(Vector3 v);
  external void applyMatrix(Matrix4 matrix);
  external void setRotationFromAxisAngle(Vector3 axis, num angle);
  external void setRotationFromEuler(Euler euler);
  external void setRotationFromMatrix(Matrix4 m);
  external void setRotationFromQuaternion(Quaternion q);

  /**
   * Rotate an object along an axis in object space. The axis is assumed to be normalized.
   * @param axis  A normalized vector in object space.
   * @param angle  The angle in radians.
   */
  external Object3D rotateOnAxis(Vector3 axis, num angle);
  external Object3D rotateX(num angle);
  external Object3D rotateY(num angle);
  external Object3D rotateZ(num angle);
  external Object3D translateOnAxis(Vector3 axis, num distance);

  /**
   *
   * @param distance
   * @param axis
   */
  external Object3D translate(num distance, Vector3 axis);
  external Object3D translateX(num distance);
  external Object3D translateY(num distance);
  external Object3D translateZ(num distance);
  external Vector3 localToWorld(Vector3 vector);
  external Vector3 worldToLocal(Vector3 vector);
  external void lookAt(Vector3 vector);
  external void add(Object3D object);
  external void remove(Object3D object);

  /* deprecated */ external Object3D getChildByName(String name);
  external Object3D getObjectById(num id);
  external Object3D getObjectByName(String name);
  external Object3D getObjectByProperty(String name, String value);
  external Vector3 getWorldPosition(Vector3 optionalTarget);
  external Quaternion getWorldQuaternion(Quaternion optionalTarget);
  external Euler getWorldRotation(Euler optionalTarget);
  external Vector3 getWorldScale(Vector3 optionalTarget);
  external Vector3 getWorldDirection(Vector3 optionalTarget);
  external void raycast(Raycaster raycaster, dynamic intersects);
  external void updateMatrix();
  external void updateMatrixWorld(bool force);
  external dynamic toJSON(dynamic meta);
  external Object3D clone(bool recursive);

  /**
   *
   * @param object
   * @param recursive
   */
  external Object3D copy(Object3D source, bool recursive);

  external void addEventListener(String type, VoidFunc1<dynamic> listener);
  external void hasEventListener(String type, VoidFunc1<dynamic> listener);
  external void removeEventListener(String type, VoidFunc1<dynamic> listener);
/*         dispatchEvent(event # type: external Strin get g;
		external set g(Strin v); target: external dynami get c;
		external set c(dynami v); # ): external voi get d;
		external set d(voi v); */

}

/*@anonymous*/
@JS()
class Intersection {
  external factory Intersection();

  external num get distance;
  external set distance(num v);
  external num get distanceToRay;
  external set distanceToRay(num v);
  external Vector3 get point;
  external set point(Vector3 v);
  external num get index;
  external set index(num v);
  external Face3 get face;
  external set face(Face3 v);
  external num get faceIndex;
  external set faceIndex(num v);
  external Object3D get object;
  external set object(Object3D v);
}

/*@anonymous*/
@JS()
class RaycasterParameters {
  external factory RaycasterParameters();

  external dynamic get Mesh;
  external set Mesh(dynamic v);
  external dynamic get Line;
  external set Line(dynamic v);
  external dynamic get LOD;
  external set LOD(dynamic v);
  external dynamic get Points;
  external set Points(dynamic v);
  external dynamic get Sprite;
  external set Sprite(dynamic v);
}

/*@anonymous*/
@JS()
class Raycaster {
  external factory Raycaster(Vector3 origin, Vector3 direction, num near, num far);

  external Ray get ray;
  external set ray(Ray v);
  external num get near;
  external set near(num v);
  external num get far;
  external set far(num v);
  external RaycasterParameters get params;
  external set params(RaycasterParameters v);
  external num get precision;
  external set precision(num v);
  external num get linePrecision;
  external set linePrecision(num v);
  external void set(Vector3 origin, Vector3 direction);
/*         setFromCamera(coords # x: external nu get m;
		external set m(nu v); y: external nu get m;
		external set m(nu v);# , Camera camera ): external voi get d;
		external set d(voi v); */
  external List<Intersection> intersectObject(Object3D object, bool recursive);
  external List<Intersection> intersectObjects(List<Object3D> objects, bool recursive);
}

/*@anonymous*/
@JS()
class Light extends Object3D{
  external factory Light /* extends Object3D */ (dynamic hex);

  external Color get color;
  external set color(Color v);
  external bool get receiveShadow;
  external set receiveShadow(bool v);

  external num get shadowCameraFov;
  external set shadowCameraFov(num v);
  external num get shadowCameraLeft;
  external set shadowCameraLeft(num v);
  external num get shadowCameraRight;
  external set shadowCameraRight(num v);
  external num get shadowCameraTop;
  external set shadowCameraTop(num v);
  external num get shadowCameraBottom;
  external set shadowCameraBottom(num v);
  external num get shadowCameraNear;
  external set shadowCameraNear(num v);
  external num get shadowCameraFar;
  external set shadowCameraFar(num v);
  external num get shadowBias;
  external set shadowBias(num v);
  external num get shadowDarkness;
  external set shadowDarkness(num v);
  external num get shadowMapWidth;
  external set shadowMapWidth(num v);
  external num get shadowMapHeight;
  external set shadowMapHeight(num v);
  external Light clone(bool recursive);
  external Light copy(Light source);
  external dynamic toJSON(dynamic meta);
}

/*@anonymous*/
@JS()
class LightShadow {
  external factory LightShadow(Camera camera);

  external Camera get camera;
  external set camera(Camera v);
  external num get bias;
  external set bias(num v);
  external num get darkness;
  external set darkness(num v);
  external Vector2 get mapSize;
  external set mapSize(Vector2 v);
  external RenderTarget get map;
  external set map(RenderTarget v);
  external Matrix4 get matrix;
  external set matrix(Matrix4 v);
  external void copy(LightShadow source);
  external LightShadow clone();
}

/**
 * This light's color gets applied to all the objects in the scene globally.
 *
 * # example
 *     var light = new THREE.AmbientLight( 0x404040 );
 *     scene.add( light );
 *
 * @source https:
 */

/*@anonymous*/
@JS()
class AmbientLight {
  external factory AmbientLight /* extends Light */ (dynamic hex);

  external AmbientLight clone(bool recursive);
  external AmbientLight copy(AmbientLight source);
}

/**
 * Affects objects using MeshLambertMaterial or MeshPhongMaterial.
 *
 * @example
 *
 * var directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 );
 * directionalLight.position.set( 0, 1, 0 );
 * scene.add( directionalLight );
 *
 * @see <a href="https:
 */

/*@anonymous*/
@JS()
class DirectionalLight {
  external factory DirectionalLight /* extends Light */ (dynamic hex, num intensity);

  external Object3D get target;
  external set target(Object3D v);

  external num get intensity;
  external set intensity(num v);

  external LightShadow get shadow;
  external set shadow(LightShadow v);
  external DirectionalLight clone(bool recursive);
  external DirectionalLight copy(DirectionalLight source);
}

/*@anonymous*/
@JS()
class HemisphereLight {
  external factory HemisphereLight /* extends Light */ (dynamic skyColorHex, dynamic groundColorHex, num intensity);

  external Color get groundColor;
  external set groundColor(Color v);
  external num get intensity;
  external set intensity(num v);
  external HemisphereLight clone(bool recursive);
  external HemisphereLight copy(HemisphereLight source);
}

/**
 * Affects objects using {@link MeshLambertMaterial} or {@link MeshPhongMaterial}.
 *
 * @example
 * var light = new THREE.PointLight( 0xff0000, 1, 100 );
 * light.position.set( 50, 50, 50 );
 * scene.add( light );
 */

/*@anonymous*/
@JS()
class PointLight extends Light {
  external factory PointLight   (dynamic hex, [num intensity, num distance, num decay]);

  /*
         * Light's intensity.
         * Default - 1.0.
         */
  external num get intensity;
  external set intensity(num v);

  external num get distance;
  external set distance(num v);

  external num get decay;
  external set decay(num v);

  external LightShadow get shadow;
  external set shadow(LightShadow v);
  external PointLight clone(bool recursive);
  external PointLight copy(PointLight source);
}

/*@anonymous*/
@JS()
class SpotLight {
  external factory SpotLight /* extends Light */ (
      dynamic hex, num intensity, num distance, num angle, num exponent, num decay);

  external Object3D get target;
  external set target(Object3D v);

  external num get intensity;
  external set intensity(num v);

  external num get distance;
  external set distance(num v);

  /*
         * Maximum extent of the spotlight, in radians, from its direction.
         * Default — Math.PI/2.
         */
  external num get angle;
  external set angle(num v);

  external num get exponent;
  external set exponent(num v);

  external num get decay;
  external set decay(num v);

  external LightShadow get shadow;
  external set shadow(LightShadow v);
  external SpotLight clone(bool recursive);
  external SpotLight copy(PointLight source);
}

/*@anonymous*/
@JS()
class Progress {
  external factory Progress();

  external num get total;
  external set total(num v);
  external num get loaded;
  external set loaded(num v);
}

/**
 * Base class for implementing loaders.
 *
 * Events:
 *     load
 *         Dispatched when the image has completed loading
 *         content — loaded image
 *
 *     error
 *
 *          Dispatched when the image can't be loaded
 *          message — error message
 */

/*@anonymous*/
@JS()
class Loader {
  external factory Loader();

  external void onLoadStart();
  external void onLoadProgress();
  external void onLoadComplete();

  external String get crossOrigin;
  external set crossOrigin(String v);
  external String extractUrlBase(String url);
  external List<Material> initMaterials(List<Material> materials, String texturePath);
  external bool createMaterial(Material m, String texturePath, String crossOrigin);
}

/*@anonymous*/
@JS()
class Cache {
  external factory Cache();

  external bool get enabled;
  external set enabled(bool v);
  external List<dynamic> get files;
  external set files(List<dynamic> v);
  external void add(String key, dynamic file);
  external dynamic get(String key);
  external void remove(String key);
  external void clear();
}

/*

/*@anonymous*/
@JS()
class ObjectLoader {
	external factory ObjectLoader (LoadingManager manager);





		external LoadingManager get manager;
		external set manager(LoadingManager v);
         external String get texturePass;
		external set texturePass(String v);external

         void load(String url , onLoad(Object3D object ) : void);external
         void setTexturePath( String value );external
         void setCrossOrigin(String crossOrigin );
         T external parse<T extends Object3D>(dynamic json , onLoad(Object3D object ) : void);external
         List<dynamic> parseGeometries(dynamic json );external
         List<Material> parseMaterials(dynamic json , List<Texture> textures );
         List<external Func0<dynamic> external get > parseImages( dynamic json , onLoad : void );external
         List<Texture> parseTextures( dynamic json , dynamic images );
         T external parseObject<T extends Object3D>(dynamic data , List<dynamic> geometries , List<Material> materials );



}

   */

/*@anonymous*/
@JS()
class MaterialParameters {
  external factory MaterialParameters();

  external String get name;
  external set name(String v);
  external Side get side;
  external set side(Side v);
  external num get opacity;
  external set opacity(num v);
  external bool get transparent;
  external set transparent(bool v);
  external Blending get blending;
  external set blending(Blending v);
  external BlendingDstFactor get blendSrc;
  external set blendSrc(BlendingDstFactor v);
  external BlendingSrcFactor get blendDst;
  external set blendDst(BlendingSrcFactor v);
  external BlendingEquation get blendEquation;
  external set blendEquation(BlendingEquation v);
  external bool get depthTest;
  external set depthTest(bool v);
  external bool get depthWrite;
  external set depthWrite(bool v);
  external bool get polygonOffset;
  external set polygonOffset(bool v);
  external num get polygonOffsetFactor;
  external set polygonOffsetFactor(num v);
  external num get polygonOffsetUnits;
  external set polygonOffsetUnits(num v);
  external num get alphaTest;
  external set alphaTest(num v);
  external num get overdraw;
  external set overdraw(num v);
  external bool get visible;
  external set visible(bool v);
  external bool get needsUpdate;
  external set needsUpdate(bool v);
}

/*@anonymous*/
@JS()
class Material {
  external factory Material();

  external num get id;
  external set id(num v);

  external String get uuid;
  external set uuid(String v);

  external String get name;
  external set name(String v);

  external String get type;
  external set type(String v);

  external Side get side;
  external set side(Side v);

  external num get opacity;
  external set opacity(num v);

  external bool get transparent;
  external set transparent(bool v);

  external Blending get blending;
  external set blending(Blending v);

  external BlendingDstFactor get blendSrc;
  external set blendSrc(BlendingDstFactor v);

  external BlendingSrcFactor get blendDst;
  external set blendDst(BlendingSrcFactor v);

  external BlendingEquation get blendEquation;
  external set blendEquation(BlendingEquation v);

  external num get blendSrcAlpha;
  external set blendSrcAlpha(num v);
  external num get blendDstAlpha;
  external set blendDstAlpha(num v);
  external num get blendEquationAlpha;
  external set blendEquationAlpha(num v);

  external DepthModes get depthFunc;
  external set depthFunc(DepthModes v);

  external bool get depthTest;
  external set depthTest(bool v);

  external bool get depthWrite;
  external set depthWrite(bool v);

  external bool get colorWrite;
  external set colorWrite(bool v);

  external dynamic get precision;
  external set precision(dynamic v);

  external bool get polygonOffset;
  external set polygonOffset(bool v);

  external num get polygonOffsetFactor;
  external set polygonOffsetFactor(num v);

  external num get polygonOffsetUnits;
  external set polygonOffsetUnits(num v);

  external num get alphaTest;
  external set alphaTest(num v);

  /**
   * Enables/disables overdraw. If greater than zero, polygons are drawn slightly bigger in order to fix antialiasing gaps when using the CanvasRenderer. Default is 0.
   */
  external num get overdraw;
  external set overdraw(num v);

  external bool get visible;
  external set visible(bool v);

  external bool get needsUpdate;
  external set needsUpdate(bool v);
  external void setValues(Object values);
  external dynamic toJSON(dynamic meta);
  external Material clone();
  external void update();
  external void dispose();
  external void addEventListener(String type, VoidFunc1<dynamic> listener);
  external void hasEventListener(String type, VoidFunc1<dynamic> listener);
  external void removeEventListener(String type, VoidFunc1<dynamic> listener);
/*         dispatchEvent(event # type: external Strin get g;
		external set g(Strin v); target: external dynami get c;
		external set c(dynami v); # ): external voi get d;
		external set d(voi v); */

}

/*@anonymous*/
@JS()
class LineBasicMaterialParameters {
  external factory LineBasicMaterialParameters() /* extends MaterialParameters */;

  external dynamic get color;
  external set color(dynamic v);
  external num get linewidth;
  external set linewidth(num v);
  external String get linecap;
  external set linecap(String v);
  external String get linejoin;
  external set linejoin(String v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get fog;
  external set fog(bool v);
}

/*@anonymous*/
@JS()
class LineBasicMaterial {
  external factory LineBasicMaterial /* extends Material */ (LineBasicMaterialParameters parameters);

  external Color get color;
  external set color(Color v);
  external num get linewidth;
  external set linewidth(num v);
  external String get linecap;
  external set linecap(String v);
  external String get linejoin;
  external set linejoin(String v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get fog;
  external set fog(bool v);
  external LineBasicMaterial clone();
  external LineBasicMaterial copy(LineBasicMaterial source);
}

/*@anonymous*/
@JS()
class LineDashedMaterialParameters {
  external factory LineDashedMaterialParameters() /* extends MaterialParameters */;

  external dynamic get color;
  external set color(dynamic v);
  external num get linewidth;
  external set linewidth(num v);
  external num get scale;
  external set scale(num v);
  external num get dashSize;
  external set dashSize(num v);
  external num get gapSize;
  external set gapSize(num v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get fog;
  external set fog(bool v);
}

/*@anonymous*/
@JS()
class LineDashedMaterial {
  external factory LineDashedMaterial /* extends Material */ (LineDashedMaterialParameters parameters);

  external Color get color;
  external set color(Color v);
  external num get linewidth;
  external set linewidth(num v);
  external num get scale;
  external set scale(num v);
  external num get dashSize;
  external set dashSize(num v);
  external num get gapSize;
  external set gapSize(num v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get fog;
  external set fog(bool v);
  external LineDashedMaterial clone();
  external LineDashedMaterial copy(LineDashedMaterial source);
}

/*@anonymous*/
@JS()
class MeshBasicMaterialParameters {
  external factory MeshBasicMaterialParameters() /* extends MaterialParameters */;

  external dynamic get color;
  external set color(dynamic v);
  external num get opacity;
  external set opacity(num v);
  external Texture get map;
  external set map(Texture v);
  external Texture get aoMap;
  external set aoMap(Texture v);
  external num get aoMapIntensity;
  external set aoMapIntensity(num v);
  external Texture get specularMap;
  external set specularMap(Texture v);
  external Texture get alphaMap;
  external set alphaMap(Texture v);
  external Texture get envMap;
  external set envMap(Texture v);
  external Combine get combine;
  external set combine(Combine v);
  external num get reflectivity;
  external set reflectivity(num v);
  external num get refractionRatio;
  external set refractionRatio(num v);
  external Shading get shading;
  external set shading(Shading v);
  external Blending get blending;
  external set blending(Blending v);
  external bool get depthTest;
  external set depthTest(bool v);
  external bool get depthWrite;
  external set depthWrite(bool v);
  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get skinning;
  external set skinning(bool v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external bool get fog;
  external set fog(bool v);
}

/*@anonymous*/
@JS()
class MeshBasicMaterial {
  external factory MeshBasicMaterial /* extends Material */ (MeshBasicMaterialParameters parameters);

  external Color get color;
  external set color(Color v);
  external Texture get map;
  external set map(Texture v);
  external Texture get aoMap;
  external set aoMap(Texture v);
  external num get aoMapIntensity;
  external set aoMapIntensity(num v);
  external Texture get specularMap;
  external set specularMap(Texture v);
  external Texture get alphaMap;
  external set alphaMap(Texture v);
  external Texture get envMap;
  external set envMap(Texture v);
  external Combine get combine;
  external set combine(Combine v);
  external num get reflectivity;
  external set reflectivity(num v);
  external num get refractionRatio;
  external set refractionRatio(num v);
  external bool get fog;
  external set fog(bool v);
  external Shading get shading;
  external set shading(Shading v);
  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external String get wireframeLinecap;
  external set wireframeLinecap(String v);
  external String get wireframeLinejoin;
  external set wireframeLinejoin(String v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get skinning;
  external set skinning(bool v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external MeshBasicMaterial clone();
  external MeshBasicMaterial copy(MeshBasicMaterial source);
}

/*@anonymous*/
@JS()
class MeshDepthMaterialParameters {
  external factory MeshDepthMaterialParameters() /* extends MaterialParameters */;

  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
}

/*@anonymous*/
@JS()
class MeshDepthMaterial {
  external factory MeshDepthMaterial /* extends Material */ (MeshDepthMaterialParameters parameters);

  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external MeshDepthMaterial clone();
  external MeshDepthMaterial copy(MeshDepthMaterial source);
}

@anonymous
@JS()
class MeshLambertMaterialParameters extends MaterialParameters{
  external factory MeshLambertMaterialParameters({dynamic color});

  external dynamic get color;
  external set color(dynamic v);
  external num get emissive;
  external set emissive(num v);
  external num get opacity;
  external set opacity(num v);
  external Texture get map;
  external set map(Texture v);
  external Texture get specularMap;
  external set specularMap(Texture v);
  external Texture get alphaMap;
  external set alphaMap(Texture v);
  external Texture get envMap;
  external set envMap(Texture v);
  external Combine get combine;
  external set combine(Combine v);
  external num get reflectivity;
  external set reflectivity(num v);
  external num get refractionRatio;
  external set refractionRatio(num v);
  external bool get fog;
  external set fog(bool v);
  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get skinning;
  external set skinning(bool v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external bool get morphNormals;
  external set morphNormals(bool v);
}

/*@anonymous*/
@JS()
class MeshLambertMaterial extends Material{
  external factory MeshLambertMaterial /* extends Material */ (MeshLambertMaterialParameters parameters);

  external Color get color;
  external set color(Color v);
  external Color get emissive;
  external set emissive(Color v);
  external Texture get map;
  external set map(Texture v);
  external Texture get specularMap;
  external set specularMap(Texture v);
  external Texture get alphaMap;
  external set alphaMap(Texture v);
  external Texture get envMap;
  external set envMap(Texture v);
  external Combine get combine;
  external set combine(Combine v);
  external num get reflectivity;
  external set reflectivity(num v);
  external num get refractionRatio;
  external set refractionRatio(num v);
  external bool get fog;
  external set fog(bool v);
  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external String get wireframeLinecap;
  external set wireframeLinecap(String v);
  external String get wireframeLinejoin;
  external set wireframeLinejoin(String v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get skinning;
  external set skinning(bool v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external bool get morphNormals;
  external set morphNormals(bool v);
  external MeshLambertMaterial clone();
  external MeshLambertMaterial copy(MeshLambertMaterial source);
}

/*@anonymous*/
@JS()
class MeshNormalMaterialParameters {
  external factory MeshNormalMaterialParameters() /* extends MaterialParameters */;

  external num get opacity;
  external set opacity(num v);
  external Shading get shading;
  external set shading(Shading v);
  external Blending get blending;
  external set blending(Blending v);
  external bool get depthTest;
  external set depthTest(bool v);
  external bool get depthWrite;
  external set depthWrite(bool v);

  /** Render geometry as wireframe. Default is false (i.e. render as smooth shaded). */
  external bool get wireframe;
  external set wireframe(bool v);
  /** Controls wireframe thickness. Default is 1. */
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
}

/*@anonymous*/
@JS()
class MeshNormalMaterial {
  external factory MeshNormalMaterial /* extends Material */ (MeshNormalMaterialParameters parameters);

  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external MeshNormalMaterial clone();
  external MeshNormalMaterial copy(MeshNormalMaterial source);
}

/*@anonymous*/
@JS()
class MeshPhongMaterialParameters {
  external factory MeshPhongMaterialParameters() /* extends MaterialParameters */;

  /** geometry color in hexadecimal. Default is 0xffffff. */
  external dynamic get color;
  external set color(dynamic v);
  external num get emissive;
  external set emissive(num v);
  external num get specular;
  external set specular(num v);
  external num get shininess;
  external set shininess(num v);
  external num get opacity;
  external set opacity(num v);
  external Texture get map;
  external set map(Texture v);
  external Texture get lightMap;
  external set lightMap(Texture v);
  external num get lightMapIntensity;
  external set lightMapIntensity(num v);
  external Texture get aoMap;
  external set aoMap(Texture v);
  external num get aoMapIntensity;
  external set aoMapIntensity(num v);
  external Texture get emissiveMap;
  external set emissiveMap(Texture v);
  external Texture get bumpMap;
  external set bumpMap(Texture v);
  external num get bumpScale;
  external set bumpScale(num v);
  external Texture get normalMap;
  external set normalMap(Texture v);
  external Vector2 get normalScale;
  external set normalScale(Vector2 v);
  external Texture get displacementMap;
  external set displacementMap(Texture v);
  external num get displacementScale;
  external set displacementScale(num v);
  external num get displacementBias;
  external set displacementBias(num v);
  external Texture get specularMap;
  external set specularMap(Texture v);
  external Texture get alphaMap;
  external set alphaMap(Texture v);
  external Texture get envMap;
  external set envMap(Texture v);
  external Combine get combine;
  external set combine(Combine v);
  external num get reflectivity;
  external set reflectivity(num v);
  external num get refractionRatio;
  external set refractionRatio(num v);
  external Shading get shading;
  external set shading(Shading v);
  external Blending get blending;
  external set blending(Blending v);
  external bool get depthTest;
  external set depthTest(bool v);
  external bool get depthWrite;
  external set depthWrite(bool v);
  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get skinning;
  external set skinning(bool v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external bool get morphNormals;
  external set morphNormals(bool v);
  external bool get fog;
  external set fog(bool v);
}

/*@anonymous*/
@JS()
class MeshPhongMaterial {
  external factory MeshPhongMaterial /* extends Material */ (MeshPhongMaterialParameters parameters);

  external Color get color;
  external set color(Color v);
  external Color get emissive;
  external set emissive(Color v);
  external Color get specular;
  external set specular(Color v);
  external num get shininess;
  external set shininess(num v);
  external bool get metal;
  external set metal(bool v);
  external Texture get map;
  external set map(Texture v);
  external Texture get lightMap;
  external set lightMap(Texture v);
  external num get lightMapIntensity;
  external set lightMapIntensity(num v);
  external Texture get aoMap;
  external set aoMap(Texture v);
  external num get aoMapIntensity;
  external set aoMapIntensity(num v);
  external Texture get emissiveMap;
  external set emissiveMap(Texture v);
  external Texture get bumpMap;
  external set bumpMap(Texture v);
  external num get bumpScale;
  external set bumpScale(num v);
  external Texture get normalMap;
  external set normalMap(Texture v);
  external Vector2 get normalScale;
  external set normalScale(Vector2 v);
  external Texture get displacementMap;
  external set displacementMap(Texture v);
  external num get displacementScale;
  external set displacementScale(num v);
  external num get displacementBias;
  external set displacementBias(num v);
  external Texture get specularMap;
  external set specularMap(Texture v);
  external Texture get alphaMap;
  external set alphaMap(Texture v);
  external Texture get envMap;
  external set envMap(Texture v);
  external Combine get combine;
  external set combine(Combine v);
  external num get reflectivity;
  external set reflectivity(num v);
  external num get refractionRatio;
  external set refractionRatio(num v);
  external bool get fog;
  external set fog(bool v);
  external Shading get shading;
  external set shading(Shading v);
  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external String get wireframeLinecap;
  external set wireframeLinecap(String v);
  external String get wireframeLinejoin;
  external set wireframeLinejoin(String v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get skinning;
  external set skinning(bool v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external bool get morphNormals;
  external set morphNormals(bool v);
  external MeshPhongMaterial clone();
  external MeshPhongMaterial copy(MeshPhongMaterial source);
}

/*@anonymous*/
@JS()
class MultiMaterial {
  external factory MultiMaterial /* extends Material */ (List<Material> materials);

  external List<Material> get materials;
  external set materials(List<Material> v);

  external Func0<dynamic> get toJSON;
  external set toJSON(Func0<dynamic> v);
  external MultiMaterial clone();
}

/*@anonymous*/
@JS()
class MeshFaceMaterial {
  external factory MeshFaceMaterial() /* extends MultiMaterial */;
}

/*@anonymous*/
@JS()
class PointsMaterialParameters {
  external factory PointsMaterialParameters() /* extends MaterialParameters */;

  external dynamic get color;
  external set color(dynamic v);
  external num get opacity;
  external set opacity(num v);
  external Texture get map;
  external set map(Texture v);
  external num get size;
  external set size(num v);
  external bool get sizeAttenuation;
  external set sizeAttenuation(bool v);
  external bool get depthTest;
  external set depthTest(bool v);
  external bool get depthWrite;
  external set depthWrite(bool v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get fog;
  external set fog(bool v);
}

/*@anonymous*/
@JS()
class PointsMaterial {
  external factory PointsMaterial /* extends Material */ (PointsMaterialParameters parameters);

  external Color get color;
  external set color(Color v);
  external Texture get map;
  external set map(Texture v);
  external num get size;
  external set size(num v);
  external bool get sizeAttenuation;
  external set sizeAttenuation(bool v);
  external bool get vertexColors;
  external set vertexColors(bool v);
  external bool get fog;
  external set fog(bool v);
  external PointsMaterial clone();
  external PointsMaterial copy(PointsMaterial source);
}

/*@anonymous*/
@JS()
class RawShaderMaterial {
  external factory RawShaderMaterial /* extends ShaderMaterial */ (ShaderMaterialParameters parameters);
}

/*@anonymous*/
@JS()
class ShaderMaterialParameters {
  external factory ShaderMaterialParameters() /* extends MaterialParameters */;

  external dynamic get defines;
  external set defines(dynamic v);
  external dynamic get uniforms;
  external set uniforms(dynamic v);
  external String get fragmentShader;
  external set fragmentShader(String v);
  external String get vertexShader;
  external set vertexShader(String v);
  external Shading get shading;
  external set shading(Shading v);
  external Blending get blending;
  external set blending(Blending v);
  external bool get depthTest;
  external set depthTest(bool v);
  external bool get depthWrite;
  external set depthWrite(bool v);
  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external bool get lights;
  external set lights(bool v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get skinning;
  external set skinning(bool v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external bool get morphNormals;
  external set morphNormals(bool v);
  external bool get fog;
  external set fog(bool v);
}

/*@anonymous*/
@JS()
class ShaderMaterial {
  external factory ShaderMaterial /* extends Material */ (ShaderMaterialParameters parameters);

  external dynamic get defines;
  external set defines(dynamic v);
  external dynamic get uniforms;
  external set uniforms(dynamic v);
  external String get vertexShader;
  external set vertexShader(String v);
  external String get fragmentShader;
  external set fragmentShader(String v);
  external Shading get shading;
  external set shading(Shading v);
  external num get linewidth;
  external set linewidth(num v);
  external bool get wireframe;
  external set wireframe(bool v);
  external num get wireframeLinewidth;
  external set wireframeLinewidth(num v);
  external bool get fog;
  external set fog(bool v);
  external bool get lights;
  external set lights(bool v);
  external Colors get vertexColors;
  external set vertexColors(Colors v);
  external bool get skinning;
  external set skinning(bool v);
  external bool get morphTargets;
  external set morphTargets(bool v);
  external bool get morphNormals;
  external set morphNormals(bool v);
  external bool get derivatives;
  external set derivatives(bool v);
  external dynamic get defaultAttributeValues;
  external set defaultAttributeValues(dynamic v);
  external String get index0AttributeName;
  external set index0AttributeName(String v);
  external ShaderMaterial clone();
  external ShaderMaterial copy(ShaderMaterial source);
  external dynamic toJSON(dynamic meta);
}

/*@anonymous*/
@JS()
class SpriteMaterialParameters {
  external factory SpriteMaterialParameters() /* extends MaterialParameters */;

  external dynamic get color;
  external set color(dynamic v);
  external num get opacity;
  external set opacity(num v);
  external Texture get map;
  external set map(Texture v);
  external Blending get blending;
  external set blending(Blending v);
  external bool get depthTest;
  external set depthTest(bool v);
  external bool get depthWrite;
  external set depthWrite(bool v);
  external Vector2 get uvOffset;
  external set uvOffset(Vector2 v);
  external Vector2 get uvScale;
  external set uvScale(Vector2 v);
  external bool get fog;
  external set fog(bool v);
}

/*@anonymous*/
@JS()
class SpriteMaterial {
  external factory SpriteMaterial /* extends Material */ (SpriteMaterialParameters parameters);

  external Color get color;
  external set color(Color v);
  external Texture get map;
  external set map(Texture v);
  external num get rotation;
  external set rotation(num v);
  external bool get fog;
  external set fog(bool v);
  external SpriteMaterial clone();
  external SpriteMaterial copy(SpriteMaterial source);
}

/*@anonymous*/
@JS()
class Box2 {
  external factory Box2(Vector2 min, Vector2 max);

  external Vector2 get max;
  external set max(Vector2 v);
  external Vector2 get min;
  external set min(Vector2 v);
  external Box2 set(Vector2 min, Vector2 max);
  external Box2 setFromPoints(List<Vector2> points);
  external Box2 setFromCenterAndSize(Vector2 center, Vector2 size);
  external Box2 clone();
  external Box2 copy(Box2 box);
  external Box2 makeEmpty();
  external bool empty();
  external Vector2 center(Vector2 optionalTarget);
  external Vector2 size(Vector2 optionalTarget);
  external Box2 expandByPoint(Vector2 point);
  external Box2 expandByVector(Vector2 vector);
  external Box2 expandByScalar(num scalar);
  external bool containsPoint(Vector2 point);
  external bool containsBox(Box2 box);
  external Vector2 getParameter(Vector2 point);
  external bool isIntersectionBox(Box2 box);
  external Vector2 clampPoint(Vector2 point, Vector2 optionalTarget);
  external num distanceToPoint(Vector2 point);
  external Box2 intersect(Box2 box);
  external Box2 union(Box2 box);
  external Box2 translate(Vector2 offset);
  external bool equals(Box2 box);
}

/*@anonymous*/
@JS()
class Box3 {
  external factory Box3(Vector3 min, Vector3 max);

  external Vector3 get max;
  external set max(Vector3 v);
  external Vector3 get min;
  external set min(Vector3 v);
  external Box3 set(Vector3 min, Vector3 max);
  external Box3 setFromPoints(List<Vector3> points);
  external Box3 setFromCenterAndSize(Vector3 center, Vector3 size);
  external Box3 setFromObject(Object3D object);
  external Box3 clone();
  external Box3 copy(Box3 box);
  external Box3 makeEmpty();
  external bool empty();
  external Vector3 center(Vector3 optionalTarget);
  external Vector3 size(Vector3 optionalTarget);
  external Box3 expandByPoint(Vector3 point);
  external Box3 expandByVector(Vector3 vector);
  external Box3 expandByScalar(num scalar);
  external bool containsPoint(Vector3 point);
  external bool containsBox(Box3 box);
  external Vector3 getParameter(Vector3 point);
  external bool isIntersectionBox(Box3 box);
  external Vector3 clampPoint(Vector3 point, Vector3 optionalTarget);
  external num distanceToPoint(Vector3 point);
  external Sphere getBoundingSphere(Sphere optionalTarget);
  external Box3 intersect(Box3 box);
  external Box3 union(Box3 box);
  external Box3 applyMatrix4(Matrix4 matrix);
  external Box3 translate(Vector3 offset);
  external bool equals(Box3 box);
}

/*@anonymous*/
@JS()
class HSL {
  external factory HSL();

  external num get h;
  external set h(num v);
  external num get s;
  external set s(num v);
  external num get l;
  external set l(num v);
}

/**
 * Represents a color. See also {@link ColorUtils}.
 *
 * @example
 * var color = new THREE.Color( 0xff0000 );
 *
 * @see <a href="https:
 */

/*@anonymous*/
@JS()
class Color {
  external factory Color(num r, num g, num b);

  external num get r;
  external set r(num v);

  external num get g;
  external set g(num v);

  external num get b;
  external set b(num v);
  external Color set(Color color);
  external Color setHex(num hex);

  /**
   * Sets this color from RGB values.
   * @param r Red channel value between 0 and 1.
   * @param g Green channel value between 0 and 1.
   * @param b Blue channel value between 0 and 1.
   */
  external Color setRGB(num r, num g, num b);

  /**
   * Sets this color from HSL values.
   * Based on MochiKit implementation by Bob Ippolito.
   *
   * @param h Hue channel value between 0 and 1.
   * @param s Saturation value channel between 0 and 1.
   * @param l Value channel value between 0 and 1.
   */
  external Color setHSL(num h, num s, num l);
  external Color setStyle(String style);
  external Color clone();
  external Color copy(Color color);
  external Color copyGammaToLinear(Color color, num gammaFactor);
  external Color copyLinearToGamma(Color color, num gammaFactor);
  external Color convertGammaToLinear();
  external Color convertLinearToGamma();
  external num getHex();
  external String getHexString();
  external HSL getHSL();
  external String getStyle();
  external Color offsetHSL(num h, num s, num l);
  external Color add(Color color);
  external Color addColors(Color color1, Color color2);
  external Color addScalar(num s);
  external Color multiply(Color color);
  external Color multiplyScalar(num s);
  external Color lerp(Color color, num alpha);
  external bool equals(Color color);
  external Color fromArray(List<num> rgb, num offset);
  external List<num> toArray(List<num> array, num offset);
}

/*@anonymous*/
@JS()
class ColorKeywords {
  external factory ColorKeywords();

  external static num get aliceblue;

  external static num get antiquewhite;

  external static num get aqua;

  external static num get aquamarine;

  external static num get azure;

  external static num get beige;

  external static num get bisque;

  external static num get black;

  external static num get blanchedalmond;

  external static num get blue;

  external static num get blueviolet;

  external static num get brown;

  external static num get burlywood;

  external static num get cadetblue;

  external static num get chartreuse;

  external static num get chocolate;

  external static num get coral;

  external static num get cornflowerblue;

  external static num get cornsilk;

  external static num get crimson;

  external static num get cyan;

  external static num get darkblue;

  external static num get darkcyan;

  external static num get darkgoldenrod;

  external static num get darkgray;

  external static num get darkgreen;

  external static num get darkgrey;

  external static num get darkkhaki;

  external static num get darkmagenta;

  external static num get darkolivegreen;

  external static num get darkorange;

  external static num get darkorchid;

  external static num get darkred;

  external static num get darksalmon;

  external static num get darkseagreen;

  external static num get darkslateblue;

  external static num get darkslategray;

  external static num get darkslategrey;

  external static num get darkturquoise;

  external static num get darkviolet;

  external static num get deeppink;

  external static num get deepskyblue;

  external static num get dimgray;

  external static num get dimgrey;

  external static num get dodgerblue;

  external static num get firebrick;

  external static num get floralwhite;

  external static num get forestgreen;

  external static num get fuchsia;

  external static num get gainsboro;

  external static num get ghostwhite;

  external static num get gold;

  external static num get goldenrod;

  external static num get gray;

  external static num get green;

  external static num get greenyellow;

  external static num get grey;

  external static num get honeydew;

  external static num get hotpink;

  external static num get indianred;

  external static num get indigo;

  external static num get ivory;

  external static num get khaki;

  external static num get lavender;

  external static num get lavenderblush;

  external static num get lawngreen;

  external static num get lemonchiffon;

  external static num get lightblue;

  external static num get lightcoral;

  external static num get lightcyan;

  external static num get lightgoldenrodyellow;

  external static num get lightgray;

  external static num get lightgreen;

  external static num get lightgrey;

  external static num get lightpink;

  external static num get lightsalmon;

  external static num get lightseagreen;

  external static num get lightskyblue;

  external static num get lightslategray;

  external static num get lightslategrey;

  external static num get lightsteelblue;

  external static num get lightyellow;

  external static num get lime;

  external static num get limegreen;

  external static num get linen;

  external static num get magenta;

  external static num get maroon;

  external static num get mediumaquamarine;

  external static num get mediumblue;

  external static num get mediumorchid;

  external static num get mediumpurple;

  external static num get mediumseagreen;

  external static num get mediumslateblue;

  external static num get mediumspringgreen;

  external static num get mediumturquoise;

  external static num get mediumvioletred;

  external static num get midnightblue;

  external static num get mintcream;

  external static num get mistyrose;

  external static num get moccasin;

  external static num get navajowhite;

  external static num get navy;

  external static num get oldlace;

  external static num get olive;

  external static num get olivedrab;

  external static num get orange;

  external static num get orangered;

  external static num get orchid;

  external static num get palegoldenrod;

  external static num get palegreen;

  external static num get paleturquoise;

  external static num get palevioletred;

  external static num get papayawhip;

  external static num get peachpuff;

  external static num get peru;

  external static num get pink;

  external static num get plum;

  external static num get powderblue;

  external static num get purple;

  external static num get red;

  external static num get rosybrown;

  external static num get royalblue;

  external static num get saddlebrown;

  external static num get salmon;

  external static num get sandybrown;

  external static num get seagreen;

  external static num get seashell;

  external static num get sienna;

  external static num get silver;

  external static num get skyblue;

  external static num get slateblue;

  external static num get slategray;

  external static num get slategrey;

  external static num get snow;

  external static num get springgreen;

  external static num get steelblue;

  external static num get tan;

  external static num get teal;

  external static num get thistle;

  external static num get tomato;

  external static num get turquoise;

  external static num get violet;

  external static num get wheat;

  external static num get white;

  external static num get whitesmoke;

  external static num get yellow;

  external static num get yellowgreen;
}

/*@anonymous*/
@JS()
class Euler {
  external factory Euler(num x, num y, num z, String order);

  external static String get DefaultOrder;

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
  external String get order;
  external set order(String v);
  external Euler set(num x, num y, num z, String order);
  external Euler clone();
  external Euler copy(Euler euler);
  external Euler setFromRotationMatrix(Matrix4 m, String order, bool update);
  external Euler setFromQuaternion(Quaternion q, String order, bool update);
  external Euler setFromVector3(Vector3 v, String order);
  external Euler reorder(String newOrder);
  external bool equals(Euler euler);
  external Euler fromArray(List<dynamic> xyzo);
  external List<num> toArray(List<num> array, num offset);
  external Vector3 toVector3(Vector3 optionalResult);
  external void onChange();
}

/*@anonymous*/
@JS()
class Frustum {
  external factory Frustum(Plane p0, Plane p1, Plane p2, Plane p3, Plane p4, Plane p5);

  external List<Plane> get planes;
  external set planes(List<Plane> v);
  external Frustum set(num p0, num p1, num p2, num p3, num p4, num p5);
  external Frustum clone();
  external Frustum copy(Frustum frustum);
  external Frustum setFromMatrix(Matrix4 m);
  external bool intersectsObject(Object3D object);
  external bool intersectsSphere(Sphere sphere);
  external bool intersectsBox(Box3 box);
  external bool containsPoint(Vector3 point);
}

/*@anonymous*/
@JS()
class Line3 {
  external factory Line3(Vector3 start, Vector3 end);

  external Vector3 get start;
  external set start(Vector3 v);
  external Vector3 get end;
  external set end(Vector3 v);
  external Line3 set(Vector3 start, Vector3 end);
  external Line3 clone();
  external Line3 copy(Line3 line);
  external Vector3 center(Vector3 optionalTarget);
  external Vector3 delta(Vector3 optionalTarget);
  external num distanceSq();
  external num distance();
  external Vector3 at(num t, Vector3 optionalTarget);
  external num closestPointToPointParameter(Vector3 point, bool clampToLine);
  external Vector3 closestPointToPoint(Vector3 point, bool clampToLine, Vector3 optionalTarget);
  external Line3 applyMatrix4(Matrix4 matrix);
  external bool equals(Line3 line);
}

/*@anonymous*/
@JS()
class Math {
  external factory Math();

  external String generateUUID();

  /**
   * Clamps the x to be between a and b.
   *
   * @param value Value to be clamped.
   * @param min Minimum value
   * @param max Maximum value.
   */
  external num clamp(num value, num min, num max);
  external num euclideanModulo(num n, num m);

  /**
   * Linear mapping of x from range [a1, a2] to range [b1, b2].
   *
   * @param x Value to be mapped.
   * @param a1 Minimum value for range A.
   * @param a2 Maximum value for range A.
   * @param b1 Minimum value for range B.
   * @param b2 Maximum value for range B.
   */
  external num mapLinear(num x, num a1, num a2, num b1, num b2);
  external num smoothstep(num x, num min, num max);
  external num smootherstep(num x, num min, num max);
  external num random16();
  external num randInt(num low, num high);
  external num randFloat(num low, num high);

  /**
   * Random float from - range / 2 to range / 2 interval.
   */
  external num randFloatSpread(num range);
  external num degToRad(num degrees);
  external num radToDeg(num radians);
  external bool isPowerOfTwo(num value);
  external num nearestPowerOfTwo(num value);
  external num nextPowerOfTwo(num value);
}

/*@anonymous*/
@JS()
class Matrix {
  external factory Matrix();

  external List get elements;
  external set elements(List v);
  external Matrix identity();
  external Matrix copy(Matrix m);
  external Matrix multiplyScalar(num s);
  external num determinant();
  external Matrix getInverse(Matrix matrix, bool throwOnInvertible);
  external Matrix transpose();
  external Matrix clone();
}

/*@anonymous*/
@JS()
class Matrix3 {
  external factory Matrix3(num n11, num n12, num n13, num n21, num n22, num n23, num n31, num n32, num n33);

  external List get elements;
  external set elements(List v);
  external Matrix3 set(num n11, num n12, num n13, num n21, num n22, num n23, num n31, num n32, num n33);
  external Matrix3 identity();
  external Matrix3 clone();
  external Matrix3 copy(Matrix3 m);
  external List<num> applyToVector3Array(List<num> array, num offset, num length);
  external BufferAttribute applyToBuffer(BufferAttribute buffer, num offset, num length);
  external Matrix3 multiplyScalar(num s);
  external num determinant();
  external Matrix3 getInverse(Matrix3 matrix, bool throwOnInvertible);
  external Matrix3 transpose();
  external List<num> flattenToArrayOffset(List<num> array, num offset);
  external Matrix3 getNormalMatrix(Matrix4 m);
  external List<num> transposeIntoArray(List<num> r);
  external Matrix3 fromArray(List<num> array);
  external List<num> toArray();
}

/**
 * A 4x4 Matrix.
 *
 * @example
 *
 * var m = new THREE.Matrix4();
 * var m1 = new THREE.Matrix4();
 * var m2 = new THREE.Matrix4();
 * var m3 = new THREE.Matrix4();
 * var alpha = 0;
 * var beta = Math.PI;
 * var gamma = Math.PI/2;
 * m1.makeRotationX( alpha );
 * m2.makeRotationY( beta );
 * m3.makeRotationZ( gamma );
 * m.multiplyMatrices( m1, m2 );
 * m.multiply( m3 );
 */

/*@anonymous*/
@JS()
class Matrix4 {
  external factory Matrix4(num n11, num n12, num n13, num n14, num n21, num n22, num n23, num n24, num n31, num n32,
                           num n33, num n34, num n41, num n42, num n43, num n44);

  external List get elements;
  external set elements(List v);
  external Matrix4 set(num n11, num n12, num n13, num n14, num n21, num n22, num n23, num n24, num n31, num n32,
                       num n33, num n34, num n41, num n42, num n43, num n44);
  external Matrix4 identity();
  external Matrix4 clone();
  external Matrix4 copy(Matrix4 m);
  external Matrix4 copyPosition(Matrix4 m);
  external Matrix4 extractBasis(Vector3 xAxis, Vector3 yAxis, Vector3 zAxis);
  external Matrix4 makeBasis(Vector3 xAxis, Vector3 yAxis, Vector3 zAxis);
  external Matrix4 extractRotation(Matrix4 m);
  external Matrix4 makeRotationFromEuler(Euler euler);
  external Matrix4 makeRotationFromQuaternion(Quaternion q);
  external Matrix4 lookAt(Vector3 eye, Vector3 target, Vector3 up);
  external Matrix4 multiply(Matrix4 m);
  external Matrix4 multiplyMatrices(Matrix4 a, Matrix4 b);
  external Matrix4 multiplyToArray(Matrix4 a, Matrix4 b, List<num> r);
  external Matrix4 multiplyScalar(num s);
  external List<num> applyToVector3Array(List<num> array, num offset, num length);
  external BufferAttribute applyToBuffer(BufferAttribute buffer, num offset, num length);
  external num determinant();
  external Matrix4 transpose();
  external List<num> flattenToArrayOffset(List<num> array, num offset);
  external Vector3 setPosition(Vector3 v);
  external Matrix4 getInverse(Matrix4 m, bool throwOnInvertible);
  external Matrix4 scale(Vector3 v);
  external num getMaxScaleOnAxis();
  external Matrix4 makeTranslation(num x, num y, num z);

  /**
   * Sets this matrix as rotation transform around x axis by theta radians.
   *
   * @param theta Rotation angle in radians.
   */
  external Matrix4 makeRotationX(num theta);

  /**
   * Sets this matrix as rotation transform around y axis by theta radians.
   *
   * @param theta Rotation angle in radians.
   */
  external Matrix4 makeRotationY(num theta);

  /**
   * Sets this matrix as rotation transform around z axis by theta radians.
   *
   * @param theta Rotation angle in radians.
   */
  external Matrix4 makeRotationZ(num theta);

  /**
   * Sets this matrix as rotation transform around axis by angle radians.
   * Based on http:
   *
   * @param axis Rotation axis.
   * @param theta Rotation angle in radians.
   */
  external Matrix4 makeRotationAxis(Vector3 axis, num angle);
  external Matrix4 makeScale(num x, num y, num z);
  external Matrix4 compose(Vector3 translation, Quaternion rotation, Vector3 scale);
  external List<Object> decompose(Vector3 translation, Quaternion rotation, Vector3 scale);
  external Matrix4 makeFrustum(num left, num right, num bottom, num top, num near, num far);
  external Matrix4 makePerspective(num fov, num aspect, num near, num far);
  external Matrix4 makeOrthographic(num left, num right, num top, num bottom, num near, num far);
  external bool equals(Matrix4 matrix);
  external Matrix4 fromArray(List<num> array);
  external List<num> toArray();
}

/*@anonymous*/
@JS()
class Plane {
  external factory Plane(Vector3 normal, num constant);

  external Vector3 get normal;
  external set normal(Vector3 v);
  external num get constant;
  external set constant(num v);
  external Plane set(Vector3 normal, num constant);
  external Plane setComponents(num x, num y, num z, num w);
  external Plane setFromNormalAndCoplanarPoint(Vector3 normal, Vector3 point);
  external Plane setFromCoplanarPoints(Vector3 a, Vector3 b, Vector3 c);
  external Plane clone();
  external Plane copy(Plane plane);
  external Plane normalize();
  external Plane negate();
  external num distanceToPoint(Vector3 point);
  external num distanceToSphere(Sphere sphere);
  external Vector3 projectPoint(Vector3 point, Vector3 optionalTarget);
  external Vector3 orthoPoint(Vector3 point, Vector3 optionalTarget);
  external bool isIntersectionLine(Line3 line);
  external Vector3 intersectLine(Line3 line, Vector3 optionalTarget);
  external Vector3 coplanarPoint(bool optionalTarget);
  external Plane applyMatrix4(Matrix4 matrix, Matrix3 optionalNormalMatrix);
  external Plane translate(Vector3 offset);
  external bool equals(Plane plane);
}

/**
 * Implementation of a quaternion. This is used for rotating things without incurring in the dreaded gimbal lock issue, amongst other advantages.
 *
 * @example
 * var quaternion = new THREE.Quaternion();
 * quaternion.setFromAxisAngle( new THREE.Vector3( 0, 1, 0 ), Math.PI / 2 );
 * var vector = new THREE.Vector3( 1, 0, 0 );
 * vector.applyQuaternion( quaternion );
 */

/*@anonymous*/
@JS()
class Quaternion {
  external factory Quaternion(num x, num y, num z, num w);

  /**
   * @param x x coordinate
   * @param y y coordinate
   * @param z z coordinate
   * @param w w coordinate
   */

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
  external num get w;
  external set w(num v);
  external Quaternion set(num x, num y, num z, num w);
  external Quaternion clone();
  external Quaternion copy(Quaternion q);
  external Quaternion setFromEuler(Euler euler, bool update);

  /**
   * Sets this quaternion from rotation specified by axis and angle.
   * Adapted from http:
   * Axis have to be normalized, angle is in radians.
   */
  external Quaternion setFromAxisAngle(Vector3 axis, num angle);
  external Quaternion setFromRotationMatrix(Matrix4 m);
  external Quaternion setFromUnitVectors(Vector3 vFrom, Vector3 vTo);
  external Quaternion inverse();
  external Quaternion conjugate();
  external num dot(Vector3 v);
  external num lengthSq();
  external num length();
  external Quaternion normalize();
  external Quaternion multiply(Quaternion q);
  external Quaternion multiplyQuaternions(Quaternion a, Quaternion b);
  external Vector3 multiplyVector3(Vector3 vector);
  external Quaternion slerp(Quaternion qb, num t);
  external bool equals(Quaternion v);
  external Quaternion fromArray(List<num> xyzw, num offset);
  external List<num> toArray(List<num> xyzw, num offset);
  external void onChange();

// external static Quaternion slerp(Quaternion qa , Quaternion qb , Quaternion qm , num t );

}

/*@anonymous*/
@JS()
class Ray {
  external factory Ray(Vector3 origin, Vector3 direction);

  external Vector3 get origin;
  external set origin(Vector3 v);
  external Vector3 get direction;
  external set direction(Vector3 v);
  external Ray set(Vector3 origin, Vector3 direction);
  external Ray clone();
  external Ray copy(Ray ray);
  external Vector3 at(num t, Vector3 optionalTarget);
  external Ray recast(num t);
  external Vector3 closestPointToPoint(Vector3 point, Vector3 optionalTarget);
  external num distanceToPoint(Vector3 point);
  external num distanceSqToPoint(Vector3 point);
  external num distanceSqToSegment(Vector3 v0, Vector3 v1, Vector3 optionalPointOnRay, Vector3 optionalPointOnSegment);
  external bool isIntersectionSphere(Sphere sphere);
  external Vector3 intersectSphere(Sphere sphere, Vector3 optionalTarget);
  external bool isIntersectionPlane(Plane plane);
  external num distanceToPlane(Plane plane);
  external Vector3 intersectPlane(Plane plane, Vector3 optionalTarget);
  external bool isIntersectionBox(Box3 box);
  external Vector3 intersectBox(Box3 box, Vector3 optionalTarget);
  external Vector3 intersectTriangle(Vector3 a, Vector3 b, Vector3 c, bool backfaceCulling, Vector3 optionalTarget);
  external Ray applyMatrix4(Matrix4 matrix4);
  external bool equals(Ray ray);
}

/*@anonymous*/
@JS()
class Sphere {
  external factory Sphere(Vector3 center, num radius);

  external Vector3 get center;
  external set center(Vector3 v);
  external num get radius;
  external set radius(num v);
  external Sphere set(Vector3 center, num radius);
  external Sphere setFromPoints(List<Vector3> points, Vector3 optionalCenter);
  external Sphere clone();
  external Sphere copy(Sphere sphere);
  external bool empty();
  external bool containsPoint(Vector3 point);
  external num distanceToPoint(Vector3 point);
  external bool intersectsSphere(Sphere sphere);
  external Vector3 clampPoint(Vector3 point, Vector3 optionalTarget);
  external Box3 getBoundingBox(Box3 optionalTarget);
  external Sphere applyMatrix4(Matrix4 matrix);
  external Sphere translate(Vector3 offset);
  external bool equals(Sphere sphere);
}

/*@anonymous*/
@JS()
class SplineControlPoint {
  external factory SplineControlPoint();

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
}

/**
 * Represents a spline.
 *
 * @see <a href="https:
 */

/*@anonymous*/
@JS()
class Spline {
  external factory Spline(List<SplineControlPoint> points);

  external List<SplineControlPoint> get points;
  external set points(List<SplineControlPoint> v);

  /**
   * Initialises using the data in the array as a series of points. Each value in a must be another array with three values, where a[n] is v, the value for the nth point, and v[0], v[1] and v[2] are the x, y and z coordinates of that point n, respectively.
   *
   * @param a array of triplets containing x, y, z coordinates
   */
  external void initFromArray(List<List<num>> a);

  /**
   * Return the interpolated point at k.
   *
   * @param k point index
   */
  external SplineControlPoint getPoint(num k);

  external List<List<num>> getControlPointsArray();

/*         getLength(num nSubDivisions ) # chunks: external List<num get >; total: external nu get m;
		external set m(nu v); # ; */

  /**
   * Modifies the spline so that it looks similar to the original but has its points distributed in such way that moving along the spline it's done at a more or less constant speed. The points should also appear more uniformly spread along the curve.
   * This is done by resampling the original spline, with the density of sampling controlled by samplingCoef. Here it's interesting to note that denser sampling is not necessarily better: if sampling is too high, you may get weird kinks in curvature.
   *
   * @param samplingCoef how mdynamic intermediate values to use between spline points
   */
  external void reparametrizeByArcLength(num samplingCoef);
}

/**
 * ( export class Vector&lt;T&gt; )
 *
 * Abstract export class of Vector2, Vector3 and Vector4.
 * Currently the members of Vector is NOT type safe because it accepts different typed vectors.
 * Those definitions will be changed when TypeScript innovates Generics to be type safe.
 *
 * @example
    THREE.Vector = new THREE.Vector3() * var v;
 * v.addVectors(new THREE.Vector2(0, 1), new THREE.Vector2(2, 3));
 */

/*@anonymous*/
@JS()
class Vector {
  external factory Vector();

  external void setComponent(num index, num value);
  external num getComponent(num index);
  external Vector copy(Vector v);
  external Vector add(Vector v);
  external Vector addVectors(Vector a, Vector b);
  external Vector sub(Vector v);
  external Vector subVectors(Vector a, Vector b);
  external Vector multiplyScalar(num s);
  external Vector divideScalar(num s);
  external Vector negate();
  external num dot(Vector v);
  external num lengthSq();
  external num length();
  external Vector normalize();

  /**
   * NOTE: Vector4 doesn't have the property.
   *
      num * distanceTo(T v );
   */
  external num distanceTo(Vector v);

  /**
   * NOTE: Vector4 doesn't have the property.
   *
      num * distanceToSquared(T v );
   */
  external num distanceToSquared(Vector v);
  external Vector setLength(num l);
  external Vector lerp(Vector v, num alpha);
  external bool equals(Vector v);
  external Vector clone();
}

/**
 * 2D vector.
 *
 * ( class Vector2  )
 */

/*@anonymous*/
@JS()
class Vector2 {
  external factory Vector2(num x, num y);

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);

  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
  external Vector2 set(num x, num y);
  external Vector2 setX(num x);
  external Vector2 setY(num y);
  external void setComponent(num index, num value);
  external num getComponent(num index);
  external Vector2 clone();
  external Vector2 copy(Vector2 v);
  external Vector2 add(Vector2 v);
  external Vector2 addScalar(num s);
  external Vector2 addVectors(Vector2 a, Vector2 b);
  external Vector2 addScaledVector(Vector2 v, num s);
  external Vector2 sub(Vector2 v);
  external Vector2 subVectors(Vector2 a, Vector2 b);
  external Vector2 multiply(Vector2 v);
  external Vector2 multiplyScalar(num scalar);
  external Vector2 divide(Vector2 v);
  external Vector2 divideScalar(num s);
  external Vector2 min(Vector2 v);
  external Vector2 max(Vector2 v);
  external Vector2 clamp(Vector2 min, Vector2 max);
  external Vector2 clampScalar(num min, num max);
  external Vector2 clampLength(num min, num max);
  external Vector2 floor();
  external Vector2 ceil();
  external Vector2 round();
  external Vector2 roundToZero();
  external Vector2 negate();
  external num dot(Vector2 v);
  external num lengthSq();
  external num length();
  external num lengthManhattan();
  external Vector2 normalize();
  external num distanceTo(Vector2 v);
  external num distanceToSquared(Vector2 v);
  external Vector2 setLength(num length);
  external Vector2 lerp(Vector2 v, num alpha);
  external Vector2 lerpVectors(Vector2 v1, Vector2 v2, num alpha);
  external bool equals(Vector2 v);
  external Vector2 fromArray(List<num> xy, num offset);
  external List<num> toArray(List<num> xy, num offset);
  external Vector2 fromAttribute(BufferAttribute attribute, num index, num offset);
  external Vector2 rotateAround(Vector2 center, num angle);
}

/**
 * 3D vector.
 *
 * @example
 * var a = new THREE.Vector3( 1, 0, 0 );
 * var b = new THREE.Vector3( 0, 1, 0 );
 * var c = new THREE.Vector3();
 * c.crossVectors( a, b );
 *
 * @see <a href="https:
 *
 * ( class Vector3  )
 */

/*@anonymous*/
@JS()
class Vector3 {
  external factory Vector3(num x, num y, num z);

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
  external Vector3 set(num x, num y, num z);
  external Vector3 setX(num x);
  external Vector3 setY(num y);
  external Vector3 setZ(num z);
  external void setComponent(num index, num value);
  external num getComponent(num index);
  external Vector3 clone();
  external Vector3 copy(Vector3 v);
  external Vector3 add(Vector3 a);
  external Vector3 addScalar(num s);
  external Vector3 addScaledVector(Vector3 v, num s);
  external Vector3 addVectors(Vector3 a, Vector3 b);
  external Vector3 sub(Vector3 a);
  external Vector3 subScalar(num s);
  external Vector3 subVectors(Vector3 a, Vector3 b);
  external Vector3 multiply(Vector3 v);
  external Vector3 multiplyScalar(num s);
  external Vector3 multiplyVectors(Vector3 a, Vector3 b);
  external Vector3 applyEuler(Euler euler);
  external Vector3 applyAxisAngle(Vector3 axis, num angle);
  external Vector3 applyMatrix3(Matrix3 m);
  external Vector3 applyMatrix4(Matrix4 m);
  external Vector3 applyProjection(Matrix4 m);
  external Vector3 applyQuaternion(Quaternion q);
  external Vector3 project(Camera camrea);
  external Vector3 unproject(Camera camera);
  external Vector3 transformDirection(Matrix4 m);
  external Vector3 divide(Vector3 v);
  external Vector3 divideScalar(num s);
  external Vector3 min(Vector3 v);
  external Vector3 max(Vector3 v);
  external Vector3 clamp(Vector3 min, Vector3 max);
  external Vector3 clampScalar(num min, num max);
  external Vector3 clampLength(num min, num max);
  external Vector3 floor();
  external Vector3 ceil();
  external Vector3 round();
  external Vector3 roundToZero();
  external Vector3 negate();
  external num dot(Vector3 v);
  external num lengthSq();
  external num length();
  external num lengthManhattan();
  external Vector3 normalize();
  external Vector3 setLength(num l);
  external Vector3 lerp(Vector3 v, num alpha);
  external Vector3 lerpVectors(Vector3 v1, Vector3 v2, num alpha);
  external Vector3 cross(Vector3 a);
  external Vector3 crossVectors(Vector3 a, Vector3 b);
  external Vector3 projectOnVector(Vector3 v);
  external Vector3 projectOnPlane(Vector3 planeNormal);
  external Vector3 reflect(Vector3 vector);
  external num angleTo(Vector3 v);
  external num distanceTo(Vector3 v);
  external num distanceToSquared(Vector3 v);
  external Vector3 setFromMatrixPosition(Matrix4 m);
  external Vector3 setFromMatrixScale(Matrix4 m);
  external Vector3 setFromMatrixColumn(num index, Matrix4 matrix);
  external bool equals(Vector3 v);
  external Vector3 fromArray(List<num> xyz, num offset);
  external List<num> toArray(List<num> xyz, num offset);
  external Vector3 fromAttribute(BufferAttribute attribute, num index, num offset);
}

/**
 * 4D vector.
 *
 * ( class Vector4  )
 */

/*@anonymous*/
@JS()
class Vector4 {
  external factory Vector4(num x, num y, num z, num w);

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
  external num get w;
  external set w(num v);
  external Vector4 set(num x, num y, num z, num w);
  external Vector4 setX(num x);
  external Vector4 setY(num y);
  external Vector4 setZ(num z);
  external Vector4 setW(num w);
  external void setComponent(num index, num value);
  external num getComponent(num index);
  external Vector4 clone();
  external Vector4 copy(Vector4 v);
  external Vector4 add(Vector4 v);
  external Vector4 addScalar(num s);
  external Vector4 addVectors(Vector4 a, Vector4 b);
  external Vector4 addScaledVector(Vector4 v, num s);
  external Vector4 sub(Vector4 v);
  external Vector4 subScalar(num s);
  external Vector4 subVectors(Vector4 a, Vector4 b);
  external Vector4 multiplyScalar(num s);
  external Vector4 applyMatrix4(Matrix4 m);
  external Vector4 divideScalar(num s);
  external Vector4 setAxisAngleFromQuaternion(Quaternion q);
  external Vector4 setAxisAngleFromRotationMatrix(Matrix4 m);
  external Vector4 min(Vector4 v);
  external Vector4 max(Vector4 v);
  external Vector4 clamp(Vector4 min, Vector4 max);
  external Vector4 clampScalar(num min, num max);
  external Vector4 floor();
  external Vector4 ceil();
  external Vector4 round();
  external Vector4 roundToZero();
  external Vector4 negate();
  external num dot(Vector4 v);
  external num lengthSq();
  external num length();
  external num lengthManhattan();
  external Vector4 normalize();
  external Vector4 setLength(num length);
  external Vector4 lerp(Vector4 v, num alpha);
  external Vector4 lerpVectors(Vector4 v1, Vector4 v2, num alpha);
  external bool equals(Vector4 v);
  external Vector4 fromArray(List<num> xyzw, num offset);
  external List<num> toArray(List<num> xyzw, num offset);
  external Vector4 fromAttribute(BufferAttribute attribute, num index, num offset);
}

/*@anonymous*/
@JS()
class Bone {
  external factory Bone /* extends Object3D */ (SkinnedMesh skin);

  external SkinnedMesh get skin;
  external set skin(SkinnedMesh v);
  external Bone clone();
  external Bone copy(Bone source);
}

/*@anonymous*/
@JS()
class Group {
  external factory Group /* extends Object3D */ ();
}

/*@anonymous*/
@JS()
class LOD {
  external factory LOD /* extends Object3D */ ();

  external List<dynamic> get levels;
  external set levels(List<dynamic> v);
  external void addLevel(Object3D object, num distance);
  external Object3D getObjectForDistance(num distance);
  external void raycast(Raycaster raycaster, dynamic intersects);
  external void update(Camera camera);
  external LOD clone();
  external LOD copy(LOD source);
  external dynamic toJSON(dynamic meta);
}

/*@anonymous*/
@JS()
class LensFlareProperty {
  external factory LensFlareProperty();

  external Texture get texture;
  external set texture(Texture v);
  external num get size;
  external set size(num v);
  external num get distance;
  external set distance(num v);
  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
  external num get scale;
  external set scale(num v);
  external num get rotation;
  external set rotation(num v);
  external num get opacity;
  external set opacity(num v);
  external Color get color;
  external set color(Color v);
  external Blending get blending;
  external set blending(Blending v);
}

/*@anonymous*/
@JS()
class LensFlare {
  external factory LensFlare /* extends Object3D */ (
      Texture texture, num size, num distance, Blending blending, Color color);

  external List<LensFlareProperty> get lensFlares;
  external set lensFlares(List<LensFlareProperty> v);
  external Vector3 get positionScreen;
  external set positionScreen(Vector3 v);
  external void customUpdateCallback(LensFlare object);
  external void add(Texture texture, num size, num distance, Blending blending, Color color);

  //external void add(Object3D obj );

  external void updateLensFlares();
  external LensFlare clone();
  external LensFlare copy(LensFlare source);
}

/*@anonymous*/
@JS()
class Line {
  external factory Line /* extends Object3D */ (dynamic geometry, dynamic material, num mode);

  external dynamic get geometry;
  external set geometry(dynamic v);
  external Material get material;
  external set material(Material v);
  external void raycast(Raycaster raycaster, dynamic intersects);
  external Line clone();
  external Line copy(Line source);
}

/*@anonymous*/
@JS()
class LineSegments {
  external factory LineSegments /* extends Line */ (dynamic geometry, dynamic material, num mode);

  external LineSegments clone();
  external LineSegments copy(LineSegments source);
}

/*@anonymous*/
@JS()
class Mesh extends Object3D{
  external factory Mesh /* extends Object3D */ (Geometry geometry, Material material);

  external dynamic get geometry;
  external set geometry(dynamic v);
  external Material get material;
  external set material(Material v);
  external void updateMorphTargets();
  external num getMorphTargetIndexByName(String name);
  external void raycast(Raycaster raycaster, dynamic intersects);
  external Mesh clone();
  external Mesh copy(Mesh source);
}

/**
 * A class for displaying particles in the form of variable size points. For example, if using the WebGLRenderer, the particles are displayed using GL_POINTS.
 *
 * @see <a href="https:
 */

/*@anonymous*/
@JS()
class Points {
  external factory Points /* extends Object3D */ (dynamic geometry, dynamic material);

  external Geometry get geometry;
  external set geometry(Geometry v);

  external Material get material;
  external set material(Material v);
  external void raycast(Raycaster raycaster, dynamic intersects);
  external Points clone();
  external Points copy(Points source);
}

/*@anonymous*/
@JS()
class Skeleton {
  external factory Skeleton(List<Bone> bones, List<Matrix4> boneInverses, bool useVertexTexture);

  external bool get useVertexTexture;
  external set useVertexTexture(bool v);
  external Matrix4 get identityMatrix;
  external set identityMatrix(Matrix4 v);
  external List<Bone> get bones;
  external set bones(List<Bone> v);
  external num get boneTextureWidth;
  external set boneTextureWidth(num v);
  external num get boneTextureHeight;
  external set boneTextureHeight(num v);
  external List get boneMatrices;
  external set boneMatrices(List v);
  external DataTexture get boneTexture;
  external set boneTexture(DataTexture v);
  external List<Matrix4> get boneInverses;
  external set boneInverses(List<Matrix4> v);
  external void calculateInverses(Bone bone);
  external void pose();
  external void update();
  external Skeleton clone();
}

/*@anonymous*/
@JS()
class SkinnedMesh {
  external factory SkinnedMesh /* extends Mesh */ (dynamic geometry, ShaderMaterial material, bool useVertexTexture);

  external String get bindMode;
  external set bindMode(String v);
  external Matrix4 get bindMatrix;
  external set bindMatrix(Matrix4 v);
  external Matrix4 get bindMatrixInverse;
  external set bindMatrixInverse(Matrix4 v);
  external void bind(Skeleton skeleton, Matrix4 bindMatrix);
  external void pose();
  external void normalizeSkinWeights();
  external void updateMatrixWorld(bool force);
  external SkinnedMesh clone();
  external SkinnedMesh copy(SkinnedMesh source);

  external Skeleton get skeleton;
  external set skeleton(Skeleton v);
}

/*@anonymous*/
@JS()
class Sprite {
  external factory Sprite /* extends Object3D */ (Material material);

  external BufferGeometry get geometry;
  external set geometry(BufferGeometry v);
  external SpriteMaterial get material;
  external set material(SpriteMaterial v);
  external void raycast(Raycaster raycaster, dynamic intersects);
  external Sprite clone();
  external Sprite copy(Sprite source);
}

/*@anonymous*/
@JS()
class Renderer {
  external factory Renderer();

  external void render(Scene scene, Camera camera);
  external void setSize(num width, num height, bool updateStyle);
  external CanvasElement get domElement;
  external set domElement(CanvasElement v);
}

/*@anonymous*/
@JS()
class WebGLRendererParameters {
  external factory WebGLRendererParameters();

  external CanvasElement get canvas;
  external set canvas(CanvasElement v);

  external String get precision;
  external set precision(String v);

  external bool get alpha;
  external set alpha(bool v);

  external bool get premultipliedAlpha;
  external set premultipliedAlpha(bool v);

  external bool get antialias;
  external set antialias(bool v);

  external bool get stencil;
  external set stencil(bool v);

  external bool get preserveDrawingBuffer;
  external set preserveDrawingBuffer(bool v);

  external num get clearColor;
  external set clearColor(num v);

  external num get clearAlpha;
  external set clearAlpha(num v);

  external num get devicePixelRatio;
  external set devicePixelRatio(num v);

  external bool get logarithmicDepthBuffer;
  external set logarithmicDepthBuffer(bool v);
}

/*@anonymous*/
@JS()
class RenderTarget {
  external factory RenderTarget();
}

/*@anonymous*/
@JS()
class WebGLRenderTargetOptions {
  external factory WebGLRenderTargetOptions();

  external Wrapping get wrapS;
  external set wrapS(Wrapping v);
  external Wrapping get wrapT;
  external set wrapT(Wrapping v);
  external TextureFilter get magFilter;
  external set magFilter(TextureFilter v);
  external TextureFilter get minFilter;
  external set minFilter(TextureFilter v);
  external num get anisotropy;
  external set anisotropy(num v);
  external num get format;
  external set format(num v);
  external TextureDataType get type;
  external set type(TextureDataType v);
  external bool get depthBuffer;
  external set depthBuffer(bool v);
  external bool get stencilBuffer;
  external set stencilBuffer(bool v);
}

/*@anonymous*/
@JS()
class WebGLRenderTarget {
  external factory WebGLRenderTarget(num width, num height, WebGLRenderTargetOptions options);

  external String get uuid;
  external set uuid(String v);
  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
  external Wrapping get wrapS;
  external set wrapS(Wrapping v);
  external Wrapping get wrapT;
  external set wrapT(Wrapping v);
  external TextureFilter get magFilter;
  external set magFilter(TextureFilter v);
  external TextureFilter get minFilter;
  external set minFilter(TextureFilter v);
  external num get anisotropy;
  external set anisotropy(num v);
  external Vector2 get offset;
  external set offset(Vector2 v);
  external Vector2 get repeat;
  external set repeat(Vector2 v);
  external num get format;
  external set format(num v);
  external num get type;
  external set type(num v);
  external bool get depthBuffer;
  external set depthBuffer(bool v);
  external bool get stencilBuffer;
  external set stencilBuffer(bool v);
  external bool get generateMipmaps;
  external set generateMipmaps(bool v);
  external dynamic get shareDepthFrom;
  external set shareDepthFrom(dynamic v);
  external void setSize(num width, num height);
  external WebGLRenderTarget clone();
  external WebGLRenderTarget copy(WebGLRenderTarget source);
  external void dispose();
  external void addEventListener(String type, VoidFunc1<dynamic> listener);
  external void hasEventListener(String type, VoidFunc1<dynamic> listener);
  external void removeEventListener(String type, VoidFunc1<dynamic> listener);
/*         dispatchEvent(event # type: external Strin get g;
		external set g(Strin v); target: external dynami get c;
		external set c(dynami v); # ): external voi get d;
		external set d(voi v); */

}

/*@anonymous*/
@JS()
class WebGLRenderTargetCube {
  external factory WebGLRenderTargetCube /* extends WebGLRenderTarget */ (
      num width, num height, WebGLRenderTargetOptions options);

  external num get activeCubeFace;
  external set activeCubeFace(num v);
}

/*@anonymous*/
@JS()
class ShaderChunk {
  external factory ShaderChunk();

  external String get name;
  external set name(String v);

  external String get common;
  external set common(String v);

  external String get alphamap_fragment;
  external set alphamap_fragment(String v);
  external String get alphamap_pars_fragment;
  external set alphamap_pars_fragment(String v);
  external String get alphatest_fragment;
  external set alphatest_fragment(String v);
  external String get aomap_fragment;
  external set aomap_fragment(String v);
  external String get aomap_pars_fragment;
  external set aomap_pars_fragment(String v);
  external String get begin_vertex;
  external set begin_vertex(String v);
  external String get beginnormal_vertex;
  external set beginnormal_vertex(String v);
  external String get bumpmap_pars_fragment;
  external set bumpmap_pars_fragment(String v);
  external String get color_fragment;
  external set color_fragment(String v);
  external String get color_pars_fragment;
  external set color_pars_fragment(String v);
  external String get color_pars_vertex;
  external set color_pars_vertex(String v);
  external String get color_vertex;
  external set color_vertex(String v);
  external String get defaultnormal_vertex;
  external set defaultnormal_vertex(String v);
  external String get displacementmap_pars_vertex;
  external set displacementmap_pars_vertex(String v);
  external String get displacementmap_vertex;
  external set displacementmap_vertex(String v);
  external String get emissivemap_fragment;
  external set emissivemap_fragment(String v);
  external String get emissivemap_pars_fragment;
  external set emissivemap_pars_fragment(String v);
  external String get envmap_fragment;
  external set envmap_fragment(String v);
  external String get envmap_pars_fragment;
  external set envmap_pars_fragment(String v);
  external String get envmap_pars_vertex;
  external set envmap_pars_vertex(String v);
  external String get envmap_vertex;
  external set envmap_vertex(String v);
  external String get fog_fragment;
  external set fog_fragment(String v);
  external String get fog_pars_fragment;
  external set fog_pars_fragment(String v);
  external String get hemilight_fragment;
  external set hemilight_fragment(String v);
  external String get lightmap_fragment;
  external set lightmap_fragment(String v);
  external String get lightmap_pars_fragment;
  external set lightmap_pars_fragment(String v);
  external String get lights_lambert_pars_vertex;
  external set lights_lambert_pars_vertex(String v);
  external String get lights_lambert_vertex;
  external set lights_lambert_vertex(String v);
  external String get lights_phong_fragment;
  external set lights_phong_fragment(String v);
  external String get lights_phong_pars_fragment;
  external set lights_phong_pars_fragment(String v);
  external String get lights_phong_pars_vertex;
  external set lights_phong_pars_vertex(String v);
  external String get lights_phong_vertex;
  external set lights_phong_vertex(String v);
  external String get linear_to_gamma_fragment;
  external set linear_to_gamma_fragment(String v);
  external String get logdepthbuf_fragment;
  external set logdepthbuf_fragment(String v);
  external String get logdepthbuf_pars_fragment;
  external set logdepthbuf_pars_fragment(String v);
  external String get logdepthbuf_pars_vertex;
  external set logdepthbuf_pars_vertex(String v);
  external String get logdepthbuf_vertex;
  external set logdepthbuf_vertex(String v);
  external String get map_fragment;
  external set map_fragment(String v);
  external String get map_pars_fragment;
  external set map_pars_fragment(String v);
  external String get map_particle_fragment;
  external set map_particle_fragment(String v);
  external String get map_particle_pars_fragment;
  external set map_particle_pars_fragment(String v);
  external String get morphnormal_vertex;
  external set morphnormal_vertex(String v);
  external String get morphtarget_pars_vertex;
  external set morphtarget_pars_vertex(String v);
  external String get morphtarget_vertex;
  external set morphtarget_vertex(String v);
  external String get normal_phong_fragment;
  external set normal_phong_fragment(String v);
  external String get normalmap_pars_fragment;
  external set normalmap_pars_fragment(String v);
  external String get project_vertex;
  external set project_vertex(String v);
  external String get shadowmap_fragment;
  external set shadowmap_fragment(String v);
  external String get shadowmap_pars_fragment;
  external set shadowmap_pars_fragment(String v);
  external String get shadowmap_pars_vertex;
  external set shadowmap_pars_vertex(String v);
  external String get shadowmap_vertex;
  external set shadowmap_vertex(String v);
  external String get skinbase_vertex;
  external set skinbase_vertex(String v);
  external String get skinning_pars_vertex;
  external set skinning_pars_vertex(String v);
  external String get skinning_vertex;
  external set skinning_vertex(String v);
  external String get skinnormal_vertex;
  external set skinnormal_vertex(String v);
  external String get specularmap_fragment;
  external set specularmap_fragment(String v);
  external String get specularmap_pars_fragment;
  external set specularmap_pars_fragment(String v);
  external String get uv2_pars_fragment;
  external set uv2_pars_fragment(String v);
  external String get uv2_pars_vertex;
  external set uv2_pars_vertex(String v);
  external String get uv2_vertex;
  external set uv2_vertex(String v);
  external String get uv_pars_fragment;
  external set uv_pars_fragment(String v);
  external String get uv_pars_vertex;
  external set uv_pars_vertex(String v);
  external String get uv_vertex;
  external set uv_vertex(String v);
  external String get worldpos_vertex;
  external set worldpos_vertex(String v);
}

/*@anonymous*/
@JS()
class Shader {
  external factory Shader();

  external dynamic get uniforms;
  external set uniforms(dynamic v);
  external String get vertexShader;
  external set vertexShader(String v);
  external String get fragmentShader;
  external set fragmentShader(String v);
}

/*@anonymous*/
@JS()
class ShaderLib {
  external factory ShaderLib();

  external String get name;
  external set name(String v);
  external Shader get basic;
  external set basic(Shader v);
  external Shader get lambert;
  external set lambert(Shader v);
  external Shader get phong;
  external set phong(Shader v);
  external Shader get particle_basic;
  external set particle_basic(Shader v);
  external Shader get dashed;
  external set dashed(Shader v);
  external Shader get depth;
  external set depth(Shader v);
  external Shader get normal;
  external set normal(Shader v);
  external Shader get normalmap;
  external set normalmap(Shader v);
  external Shader get cube;
  external set cube(Shader v);
  external Shader get equirect;
  external set equirect(Shader v);
  external Shader get depthRGBA;
  external set depthRGBA(Shader v);
}

/*@anonymous*/
@JS()
class UniformsLib {
  external factory UniformsLib();

  external dynamic get common;
  external set common(dynamic v);
  external dynamic get aomap;
  external set aomap(dynamic v);
  external dynamic get lightmap;
  external set lightmap(dynamic v);
  external dynamic get emissivemap;
  external set emissivemap(dynamic v);
  external dynamic get bumpmap;
  external set bumpmap(dynamic v);
  external dynamic get normalmap;
  external set normalmap(dynamic v);
  external dynamic get displacementmap;
  external set displacementmap(dynamic v);
  external dynamic get fog;
  external set fog(dynamic v);
  external dynamic get lights;
  external set lights(dynamic v);
  external dynamic get points;
  external set points(dynamic v);
  external dynamic get shadowmap;
  external set shadowmap(dynamic v);
}

/*@anonymous*/
@JS()
class UniformsUtils {
  external factory UniformsUtils();

  external dynamic merge(List<dynamic> uniforms);
  external dynamic clone(dynamic uniforms_src);
}

/*@anonymous*/
@JS()
class WebGLGeometriesInstance {
  external factory WebGLGeometriesInstance();

  external dynamic get(dynamic object);
}

/*@anonymous*/
@JS()
class WebGLIndexedBufferRendererInstance {
  external factory WebGLIndexedBufferRendererInstance();

  external void setMode(dynamic value);
  external void setIndex(dynamic index);
  external void render(dynamic start, dynamic count);
  external void renderInstances(dynamic geometry);
}

/*@anonymous*/
@JS()
class WebGLObjectsInstance {
  external factory WebGLObjectsInstance();

  external dynamic getAttributeBuffer(dynamic attribute);
  external dynamic getWireframeAttribute(dynamic geometry);
  external void update(dynamic object);
}

/*@anonymous*/
@JS()
class WebGLProgramsInstance {
  external factory WebGLProgramsInstance();

  external List<dynamic> getParameters(dynamic material, dynamic lights, dynamic fog, dynamic object);
  external dynamic getProgramCode(dynamic material, dynamic parameters);
  external dynamic acquireProgram(dynamic material, dynamic parameters, dynamic code);
  external void releaseProgram(dynamic program);
}

/*@anonymous*/
@JS()
class WebGLPropertiesInstance {
  external factory WebGLPropertiesInstance();

  external dynamic get(dynamic object);
  external void delete(dynamic object);
  external void clear();
}

/*@anonymous*/
@JS()
class LensFlarePlugin {
  external factory LensFlarePlugin();

  external void init(Renderer renderer);
  external void render(Scene scene, Camera camera, num viewportWidth, num viewportHeight);
}

/*@anonymous*/
@JS()
class SpritePlugin {
  external factory SpritePlugin();

  external void init(Renderer renderer);
  external void render(Scene scene, Camera camera, num viewportWidth, num viewportHeight);
}

/*@anonymous*/
@JS()
class IFog {
  external factory IFog();

  external String get name;
  external set name(String v);
  external Color get color;
  external set color(Color v);
  external IFog clone();
}

/*@anonymous*/
@JS()
class Fog {
  external factory Fog(num hex, num near, num far);

  external String get name;
  external set name(String v);

  external Color get color;
  external set color(Color v);

  external num get near;
  external set near(num v);

  external num get far;
  external set far(num v);
  external Fog clone();
}

/*@anonymous*/
@JS()
class FogExp2 {
  external factory FogExp2(dynamic hex, num density);

  external String get name;
  external set name(String v);
  external Color get color;
  external set color(Color v);

  external num get density;
  external set density(num v);
  external FogExp2 clone();
}

/*@anonymous*/
@JS()
class Scene {
  external factory Scene /* extends Object3D */ ();

  external IFog get fog;
  external set fog(IFog v);

  external Material get overrideMaterial;
  external set overrideMaterial(Material v);
  external bool get autoUpdate;
  external set autoUpdate(bool v);
  external Scene copy(Scene source);
}

/*@anonymous*/
@JS()
class CanvasTexture {
  external factory CanvasTexture /* extends Texture */ (dynamic canvas, Mapping mapping, Wrapping wrapS, Wrapping wrapT,
                                                        TextureFilter magFilter, TextureFilter minFilter, PixelFormat format, TextureDataType type, num anisotropy);

  external bool get needsUpdate;
  external set needsUpdate(bool v);
}

/*@anonymous*/
@JS()
class CompressedTexture {
  external factory CompressedTexture /* extends Texture */ (
      List<ImageData> mipmaps,
      num width,
      num height,
      PixelFormat format,
      TextureDataType type,
      Mapping mapping,
      Wrapping wrapS,
      Wrapping wrapT,
      TextureFilter magFilter,
      TextureFilter minFilter,
      num anisotropy);

  /*         image # width: external nu get m;
		external set m(nu v); height: external nu get m;
		external set m(nu v); # ; */
  external List<ImageData> get mipmaps;
  external set mipmaps(List<ImageData> v);
  external bool get flipY;
  external set flipY(bool v);
  external bool get generateMipmaps;
  external set generateMipmaps(bool v);
}

/*@anonymous*/
@JS()
class CubeTexture {
  external factory CubeTexture /* extends Texture */ (
      List<dynamic> images,
      Mapping mapping,
      Wrapping wrapS,
      Wrapping wrapT,
      TextureFilter magFilter,
      TextureFilter minFilter,
      PixelFormat format,
      TextureDataType type,
      num anisotropy);

  external List<dynamic> get images;
  external set images(List<dynamic> v);
  external CubeTexture copy(CubeTexture source);
}

/*@anonymous*/
@JS()
class DataTexture {
  external factory DataTexture /* extends Texture */ (
      ImageData data,
      num width,
      num height,
      PixelFormat format,
      TextureDataType type,
      Mapping mapping,
      Wrapping wrapS,
      Wrapping wrapT,
      TextureFilter magFilter,
      TextureFilter minFilter,
      num anisotropy);

  /*         image # data: external ImageDat get a;
		external set a(ImageDat v); width: external nu get m;
		external set m(nu v); height: external nu get m;
		external set m(nu v); # ; */
  external TextureFilter get magFilter;
  external set magFilter(TextureFilter v);
  external TextureFilter get minFilter;
  external set minFilter(TextureFilter v);
  external bool get flipY;
  external set flipY(bool v);
  external bool get generateMipmaps;
  external set generateMipmaps(bool v);
}

/*@anonymous*/
@JS()
class Texture {
  external factory Texture(dynamic image, Mapping mapping, Wrapping wrapS, Wrapping wrapT, TextureFilter magFilter,
                           TextureFilter minFilter, PixelFormat format, TextureDataType type, num anisotropy);

  external num get id;
  external set id(num v);
  external String get uuid;
  external set uuid(String v);
  external String get name;
  external set name(String v);
  external String get sourceFile;
  external set sourceFile(String v);
  external dynamic get image;
  external set image(dynamic v);
  external List<ImageData> get mipmaps;
  external set mipmaps(List<ImageData> v);
  external Mapping get mapping;
  external set mapping(Mapping v);
  external Wrapping get wrapS;
  external set wrapS(Wrapping v);
  external Wrapping get wrapT;
  external set wrapT(Wrapping v);
  external TextureFilter get magFilter;
  external set magFilter(TextureFilter v);
  external TextureFilter get minFilter;
  external set minFilter(TextureFilter v);
  external num get anisotropy;
  external set anisotropy(num v);
  external PixelFormat get format;
  external set format(PixelFormat v);
  external TextureDataType get type;
  external set type(TextureDataType v);
  external Vector2 get offset;
  external set offset(Vector2 v);
  external Vector2 get repeat;
  external set repeat(Vector2 v);
  external bool get generateMipmaps;
  external set generateMipmaps(bool v);
  external bool get premultiplyAlpha;
  external set premultiplyAlpha(bool v);
  external bool get flipY;
  external set flipY(bool v);
  external num get unpackAlignment;
  external set unpackAlignment(num v);
  external num get version;
  external set version(num v);
  external bool get needsUpdate;
  external set needsUpdate(bool v);
  external void onUpdate();
  external static dynamic get DEFAULT_IMAGE;
  external static dynamic get DEFAULT_MAPPING;

  external Texture clone();
  external Texture copy(Texture source);
  external dynamic toJSON(dynamic meta);
  external void dispose();
  external void transformUv(Vector uv);
  external void addEventListener(String type, VoidFunc1<dynamic> listener);
  external void hasEventListener(String type, VoidFunc1<dynamic> listener);
  external void removeEventListener(String type, VoidFunc1<dynamic> listener);
/*         dispatchEvent(event # type: external Strin get g;
		external set g(Strin v); target: external dynami get c;
		external set c(dynami v); # ): external voi get d;
		external set d(voi v); */

}

/*@anonymous*/
@JS()
class ImageUtils {
  external factory ImageUtils();

  external String get crossOrigin;
  external set crossOrigin(String v);

  external Texture loadTexture(String url, Mapping mapping, VoidFunc1<Texture> onLoad, VoidFunc1<String> onError);
  external Texture loadTextureCube(
      List<String> array, Mapping mapping, VoidFunc1<Texture> onLoad, VoidFunc1<String> onError);
  external CanvasElement getNormalMap(ImageElement image, num depth);
  external DataTexture generateDataTexture(num width, num height, Color color);
}

/*@anonymous*/
@JS()
class SceneUtils {
  external factory SceneUtils();

  external Object3D createMultiMaterialObject(Geometry geometry, List<Material> materials);
  external void detach(Object3D child, Object3D parent, Scene scene);
  external void attach(Object3D child, Scene scene, Object3D parent);
}

/*@anonymous*/
@JS()
class ShapeUtils {
  external factory ShapeUtils();

  external num area(List<num> contour);
  external List<num> triangulate(List<num> contour, bool indices);
  external List<num> triangulateShape(List<num> contour, List<dynamic> holes);
  external bool isClockWise(List<num> pts);
  external num b2(num t, num p0, num p1, num p2);
  external num b3(num t, num p0, num p1, num p2, num p3);
}

/*@anonymous*/
@JS()
class Audio {
  external factory Audio /* extends Object3D */ (AudioListener listener);

  external String get type;
  external set type(String v);
  external bool get autoplay;
  external set autoplay(bool v);
  external num get startTime;
  external set startTime(num v);
  external num get playbackRate;
  external set playbackRate(num v);
  external bool get isPlaying;
  external set isPlaying(bool v);
  external Audio load(String file);
  external void play();
  external void pause();
  external void stop();
  external void connect();
  external void disconnect();
  external void setFilter(dynamic value);
  external Func0<dynamic> get getFilter;
  external set getFilter(Func0<dynamic> v);
  external void setPlaybackRate(num value);
  external num getPlaybackRate();
  external void setLoop(bool value);
  external bool getLoop();
  external void setRefDistance(num value);
  external num getRefDistance();
  external void setRolloffFactor(num value);
  external num getRolloffFactor();
  external void setVolume(num value);
  external num getVolume();
  external void updateMatrixWorld(bool force);
}

/*@anonymous*/
@JS()
class AudioListener {
  external factory AudioListener /* extends Object3D */ ();

  external String get type;
  external set type(String v);

  external void updateMatrixWorld(bool force);
}

/*@anonymous*/
@JS()
class CurveUtils {
  external factory CurveUtils();

  external num tangentQuadraticBezier(num t, num p0, num p1, num p2);
  external num tangentCubicBezier(num t, num p0, num p1, num p2, num p3);
  external num tangentSpline(num t, num p0, num p1, num p2, num p3);
  external num interpolate(num p0, num p1, num p2, num p3, num t);
}

/*@anonymous*/
@JS()
class BoundingBox {
  external factory BoundingBox();

  external num get minX;
  external set minX(num v);
  external num get minY;
  external set minY(num v);
  external num get minZ;
  external set minZ(num v);
  external num get maxX;
  external set maxX(num v);
  external num get maxY;
  external set maxY(num v);
  external num get maxZ;
  external set maxZ(num v);
}

/*@anonymous*/
@JS()
class PathAction {
  external factory PathAction();

  external dynamic get args;
  external set args(dynamic v);
}

/*@anonymous*/
@JS()
class ArcCurve {
  external factory ArcCurve /* extends EllipseCurve */ (
      num aX, num aY, num aRadius, num aStartAngle, num aEndAngle, bool aClockwise);
}

/*@anonymous*/
@JS()
class CubeGeometry extends Geometry{
  external factory CubeGeometry(num w, num h, num d, [num ws, num hs, num ds]) /* extends BoxGeometry */;
}

/*@anonymous*/
@JS()
class EdgesGeometry {
  external factory EdgesGeometry /* extends BufferGeometry */ (BufferGeometry geometry, num thresholdAngle);

  external EdgesGeometry clone();
}

/*@anonymous*/
@JS()
class IcosahedronGeometry {
  external factory IcosahedronGeometry /* extends PolyhedronGeometry */ (num radius, num detail);

  external IcosahedronGeometry clone();
}

/*@anonymous*/
@JS()
class OctahedronGeometry {
  external factory OctahedronGeometry /* extends PolyhedronGeometry */ (num radius, num detail);

  external OctahedronGeometry clone();
}

/*@anonymous*/
@JS()
class TetrahedronGeometry {
  external factory TetrahedronGeometry /* extends PolyhedronGeometry */ (num radius, num detail);

  external TetrahedronGeometry clone();
}

/*@anonymous*/
@JS()
class WireframeGeometry {
  external factory WireframeGeometry /* extends BufferGeometry */ (dynamic geometry);
}

/*@anonymous*/
@JS()
class ArrowHelper {
  external factory ArrowHelper /* extends Object3D */ (
      Vector3 dir, Vector3 origin, num length, num hex, num headLength, num headWidth);

  external Line get line;
  external set line(Line v);
  external Mesh get cone;
  external set cone(Mesh v);
  external void setDirection(Vector3 dir);
  external void setLength(num length, num headLength, num headWidth);
  external void setColor(num hex);
}

/*@anonymous*/
@JS()
class AxisHelper {
  external factory AxisHelper /* extends LineSegments */ (num size);
}

/*@anonymous*/
@JS()
class BoundingBoxHelper {
  external factory BoundingBoxHelper /* extends Mesh */ (Object3D object, num hex);

  external Object3D get object;
  external set object(Object3D v);
  external Box3 get box;
  external set box(Box3 v);
  external void update();
}

/*@anonymous*/
@JS()
class BoxHelper {
  external factory BoxHelper /* extends LineSegments */ (Object3D object);

  external void update(Object3D object);
}

/*@anonymous*/
@JS()
class CameraHelper {
  external factory CameraHelper /* extends LineSegments */ (Camera camera);

  external Camera get camera;
  external set camera(Camera v);
/*         pointMap # [id: String]: external List<num get >; # ; */ external void update();
}

/*@anonymous*/
@JS()
class DirectionalLightHelper {
  external factory DirectionalLightHelper /* extends Object3D */ (Light light, num size);

  external Light get light;
  external set light(Light v);
  external Line get lightPlane;
  external set lightPlane(Line v);
  external Line get targetLine;
  external set targetLine(Line v);
  external void dispose();
  external void update();
}

/*@anonymous*/
@JS()
class EdgesHelper {
  external factory EdgesHelper /* extends LineSegments */ (Object3D object, num hex, num thresholdAngle);
}

/*@anonymous*/
@JS()
class FaceNormalsHelper {
  external factory FaceNormalsHelper /* extends LineSegments */ (Object3D object, num size, num hex, num linewidth);

  external Object3D get object;
  external set object(Object3D v);
  external num get size;
  external set size(num v);
  external void update(Object3D object);
}

/*@anonymous*/
@JS()
class GridHelper {
  external factory GridHelper /* extends LineSegments */ (num size, num step);

  external Color get color1;
  external set color1(Color v);
  external Color get color2;
  external set color2(Color v);
  external void setColors(num colorCenterLine, num colorGrid);
}

/*@anonymous*/
@JS()
class HemisphereLightHelper {
  external factory HemisphereLightHelper /* extends Object3D */ (Light light, num sphereSize);

  external Light get light;
  external set light(Light v);
  external List<Color> get colors;
  external set colors(List<Color> v);
  external Mesh get lightSphere;
  external set lightSphere(Mesh v);
  external void dispose();
  external void update();
}

/*@anonymous*/
@JS()
class PointLightHelper {
  external factory PointLightHelper /* extends Object3D */ (Light light, num sphereSize);

  external Light get light;
  external set light(Light v);
  external void dispose();
  external void update();
}

/*@anonymous*/
@JS()
class SkeletonHelper {
  external factory SkeletonHelper /* extends LineSegments */ (Object3D bone);

  external List<Bone> get bones;
  external set bones(List<Bone> v);
  external Object3D get root;
  external set root(Object3D v);
  external List<Bone> getBoneList(Object3D object);
  external void update();
}

/*@anonymous*/
@JS()
class SpotLightHelper {
  external factory SpotLightHelper /* extends Object3D */ (Light light, num sphereSize, num arrowLength);

  external Light get light;
  external set light(Light v);
  external Mesh get cone;
  external set cone(Mesh v);
  external void dispose();
  external void update();
}

/*@anonymous*/
@JS()
class VertexNormalsHelper {
  external factory VertexNormalsHelper /* extends LineSegments */ (Object3D object, num size, num hex, num linewidth);

  external Object3D get object;
  external set object(Object3D v);
  external num get size;
  external set size(num v);
  external void update(Object3D object);
}

/*@anonymous*/
@JS()
class WireframeHelper {
  external factory WireframeHelper /* extends LineSegments */ (Object3D object, num hex);
}

/*@anonymous*/
@JS()
class ImmediateRenderObject {
  external factory ImmediateRenderObject /* extends Object3D */ (Material material);

  external Material get material;
  external set material(Material v);
  external void render(Function renderCallback);
}

/*@anonymous*/
@JS()
class MorphBlendMeshAnimation {
  external factory MorphBlendMeshAnimation();

  external num get start;
  external set start(num v);
  external num get end;
  external set end(num v);
  external num get length;
  external set length(num v);
  external num get fps;
  external set fps(num v);
  external num get duration;
  external set duration(num v);
  external num get lastFrame;
  external set lastFrame(num v);
  external num get currentFrame;
  external set currentFrame(num v);
  external bool get active;
  external set active(bool v);
  external num get time;
  external set time(num v);
  external num get direction;
  external set direction(num v);
  external num get weight;
  external set weight(num v);
  external bool get directionBackwards;
  external set directionBackwards(bool v);
  external bool get mirroredLoop;
  external set mirroredLoop(bool v);
}

/*@anonymous*/
@JS()
class MorphBlendMesh {
  external factory MorphBlendMesh /* extends Mesh */ (Geometry geometry, Material material);

  /*         animationsMap # name: external Strin get g;
		external set g(Strin v); # ; */
  external List<MorphBlendMeshAnimation> get animationsList;
  external set animationsList(List<MorphBlendMeshAnimation> v);
  external void createAnimation(String name, num start, num end, num fps);
  external void autoCreateAnimations(num fps);
  external void setAnimationDirectionForward(String name);
  external void setAnimationDirectionBackward(String name);
  external void setAnimationFPS(String name, num fps);
  external void setAnimationDuration(String name, num duration);
  external void setAnimationWeight(String name, num weight);
  external void setAnimationTime(String name, num time);
  external num getAnimationTime(String name);
  external num getAnimationDuration(String name);
  external void playAnimation(String name);
  external void stopAnimation(String name);
  external void update(num delta);
}
