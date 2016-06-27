part of babylon;

@JS()
class _DepthCullingState {
  external factory _DepthCullingState();

  external bool get isDirty;
  external set isDirty(bool v);
  external num get zOffset;
  external set zOffset(num v);
  external num get cullFace;
  external set cullFace(num v);
  external bool get cull;
  external set cull(bool v);
  external num get depthFunc;
  external set depthFunc(num v);
  external bool get depthMask;
  external set depthMask(bool v);
  external bool get depthTest;
  external set depthTest(bool v);
  external void reset();
  external void apply(WebGLRenderingContext gl);
}

@JS()
class _AlphaState {
  external factory _AlphaState();

  external bool get isDirty;
  external set isDirty(bool v);
  external bool get alphaBlend;
  external set alphaBlend(bool v);
  external void setAlphaBlendFunctionParameters(
      num value0, num value1, num value2, num value3);
  external void reset();
  external void apply(WebGLRenderingContext gl);
}

@JS()
class EngineCapabilities {
  external factory EngineCapabilities();

  external num get maxTexturesImageUnits;
  external set maxTexturesImageUnits(num v);
  external num get maxTextureSize;
  external set maxTextureSize(num v);
  external num get maxCubemapTextureSize;
  external set maxCubemapTextureSize(num v);
  external num get maxRenderTextureSize;
  external set maxRenderTextureSize(num v);
  external bool get standardDerivatives;
  external set standardDerivatives(bool v);
  external dynamic get s3tc;
  external set s3tc(dynamic v);
  external bool get textureFloat;
  external set textureFloat(bool v);
  external dynamic get textureAnisotropicFilterExtension;
  external set textureAnisotropicFilterExtension(dynamic v);
  external num get maxAnisotropy;
  external set maxAnisotropy(num v);
  external dynamic get instancedArrays;
  external set instancedArrays(dynamic v);
  external bool get uintIndices;
  external set uintIndices(bool v);
  external bool get highPrecisionShaderSupported;
  external set highPrecisionShaderSupported(bool v);
  external bool get fragmentDepthSupported;
  external set fragmentDepthSupported(bool v);
  external dynamic get drawBuffersExtension;
  external set drawBuffersExtension(dynamic v);
}

@JS()
class Engine {
  external factory Engine(
      [CanvasElement canvas,
      bool antialias,
      dynamic options,
      bool adaptToDeviceRatio]);

  external static num get ALPHA_DISABLE;
  external static num get ALPHA_ONEONE;
  external static num get ALPHA_ADD;
  external static num get ALPHA_COMBINE;
  external static num get ALPHA_SUBTRACT;
  external static num get ALPHA_MULTIPLY;
  external static num get ALPHA_MAXIMIZED;
  external static num get DELAYLOADSTATE_NONE;
  external static num get DELAYLOADSTATE_LOADED;
  external static num get DELAYLOADSTATE_LOADING;
  external static num get DELAYLOADSTATE_NOTLOADED;
  external static num get TEXTUREFORMAT_ALPHA;
  external static num get TEXTUREFORMAT_LUMINANCE;
  external static num get TEXTUREFORMAT_LUMINANCE_ALPHA;
  external static num get TEXTUREFORMAT_RGB;
  external static num get TEXTUREFORMAT_RGBA;
  external static num get TEXTURETYPE_UNSIGNED_INT;
  external static num get TEXTURETYPE_FLOAT;
  external static String get Version;
  external static num get Epsilon;
  external static num get CollisionsEpsilon;
  external static String get CodeRepository;
  external static String get ShadersRepository;
  external bool get isFullscreen;
  external set isFullscreen(bool v);
  external bool get isPointerLock;
  external set isPointerLock(bool v);
  external bool get cullBackFaces;
  external set cullBackFaces(bool v);
  external bool get renderEvenInBackground;
  external set renderEvenInBackground(bool v);
  external bool get enableOfflineSupport;
  external set enableOfflineSupport(bool v);
  external List<Scene> get scenes;
  external set scenes(List<Scene> v);
  external WebGLRenderingContext get _gl;
  external set _gl(WebGLRenderingContext v);

  external static AudioEngine get audioEngine;

  external String get webGLVersion;
  external set webGLVersion(String v);
  external void resetTextureCache();
  external dynamic getGlInfo();
  external num getAspectRatio(Camera camera, bool useScreen);
  external num getRenderWidth(bool useScreen);
  external num getRenderHeight(bool useScreen);
  external CanvasElement getRenderingCanvas();
  external ClientRect getRenderingCanvasClientRect();
  external void setHardwareScalingLevel(num level);
  external num getHardwareScalingLevel();
  external List<WebGLTexture> getLoadedTexturesCache();
  external EngineCapabilities getCaps();
  external num get drawCalls;
  external set drawCalls(num v);
  external void resetDrawCalls();
  external void setDepthFunctionToGreater();
  external void setDepthFunctionToGreaterOrEqual();
  external void setDepthFunctionToLess();
  external void setDepthFunctionToLessOrEqual();
  external void stopRenderLoop(VoidFunc0 renderFunction);
  external void _renderLoop();
  external void runRenderLoop(VoidFunc0 renderFunction);
  external void switchFullscreen(bool requestPointerLock);
  external void clear(dynamic color, bool backBuffer, bool depthStencil);
  external void setViewport(
      Viewport viewport, num requiredWidth, num requiredHeight);
  external void setDirectViewport(num x, num y, num width, num height);
  external void beginFrame();
  external void endFrame();
  external void resize();
  external void setSize(num width, num height);
  external void bindFramebuffer(WebGLTexture texture, num faceIndex);
  external void unBindFramebuffer(
      WebGLTexture texture, bool disableGenerateMipMaps);
  external void generateMipMapsForCubemap(WebGLTexture texture);
  external void flushFramebuffer();
  external void restoreDefaultFramebuffer();
  external WebGLBuffer createVertexBuffer(dynamic vertices);
  external WebGLBuffer createDynamicVertexBuffer(num capacity);
  external void updateDynamicVertexBuffer(
      WebGLBuffer vertexBuffer, dynamic vertices, num offset);
  external WebGLBuffer createIndexBuffer(dynamic indices);
  external void bindBuffers(WebGLBuffer vertexBuffer, WebGLBuffer indexBuffer,
                            List<num> vertexDeclaration, num vertexStrideSize, Effect effect);
  external void bindMultiBuffers(
      List<VertexBuffer> vertexBuffers, WebGLBuffer indexBuffer, Effect effect);
  external bool _releaseBuffer(WebGLBuffer buffer);
  external WebGLBuffer createInstancesBuffer(num capacity);
  external void deleteInstancesBuffer(WebGLBuffer buffer);
  external void updateAndBindInstancesBuffer(
      WebGLBuffer instancesBuffer, List data, List<num> offsetLocations);
  external void unBindInstancesBuffer(
      WebGLBuffer instancesBuffer, List<num> offsetLocations);
  external void applyStates();
  external void draw(
      bool useTriangles, num indexStart, num indexCount, num instancesCount);
  external void drawPointClouds(
      num verticesStart, num verticesCount, num instancesCount);
  external void drawUnIndexed(bool useTriangles, num verticesStart,
                              num verticesCount, num instancesCount);
  external void _releaseEffect(Effect effect);
  external Effect createEffect(
      dynamic baseName,
      List<String> attributesNames,
      List<String> uniformsNames,
      List<String> samplers,
      String defines,
      EffectFallbacks fallbacks,
      VoidFunc1<Effect> onCompiled,
      VoidFunc2<Effect, String> onError);
  external Effect createEffectForParticles(
      String fragmentName,
      List<String> uniformsNames,
      List<String> samplers,
      String defines,
      EffectFallbacks fallbacks,
      VoidFunc1<Effect> onCompiled,
      VoidFunc2<Effect, String> onError);
  external WebGLProgram createShaderProgram(
      String vertexCode, String fragmentCode, String defines);
  external List<WebGLUniformLocation> getUniforms(
      WebGLProgram shaderProgram, List<String> uniformsNames);
  external List<num> getAttributes(
      WebGLProgram shaderProgram, List<String> attributesNames);
  external void enableEffect(Effect effect);
  external void setArray(WebGLUniformLocation uniform, List<num> array);
  external void setArray2(WebGLUniformLocation uniform, List<num> array);
  external void setArray3(WebGLUniformLocation uniform, List<num> array);
  external void setArray4(WebGLUniformLocation uniform, List<num> array);
  external void setMatrices(WebGLUniformLocation uniform, List matrices);
  external void setMatrix(WebGLUniformLocation uniform, Matrix matrix);
  external void setMatrix3x3(WebGLUniformLocation uniform, List matrix);
  external void setMatrix2x2(WebGLUniformLocation uniform, List matrix);
  external void setFloat(WebGLUniformLocation uniform, num value);
  external void setFloat2(WebGLUniformLocation uniform, num x, num y);
  external void setFloat3(WebGLUniformLocation uniform, num x, num y, num z);
  external void setBool(WebGLUniformLocation uniform, num bool);
  external void setFloat4(
      WebGLUniformLocation uniform, num x, num y, num z, num w);
  external void setColor3(WebGLUniformLocation uniform, Color3 color3);
  external void setColor4(
      WebGLUniformLocation uniform, Color3 color3, num alpha);
  external void setState(
      bool culling, num zOffset, bool force, bool reverseSide);
  external void setDepthBuffer(bool enable);
  external bool getDepthWrite();
  external void setDepthWrite(bool enable);
  external void setColorWrite(bool enable);
  external void setAlphaMode(num mode);
  external num getAlphaMode();
  external void setAlphaTesting(bool enable);
  external bool getAlphaTesting();
  external void wipeCaches();
  external void setSamplingMode(WebGLTexture texture, num samplingMode);
  external WebGLTexture createTexture(
      String url,
      bool noMipmap,
      bool invertY,
      Scene scene,
      num samplingMode,
      VoidFunc0 onLoad,
      VoidFunc0 onError,
      dynamic buffer);
  external void updateRawTexture(WebGLTexture texture, ArrayBufferView data,
                                 num format, bool invertY, String compression);
  external WebGLTexture createRawTexture(
      ArrayBufferView data,
      num width,
      num height,
      num format,
      bool generateMipMaps,
      bool invertY,
      num samplingMode,
      String compression);
  external WebGLTexture createDynamicTexture(num width, num height,
                                             bool generateMipMaps, num samplingMode, bool forceExponantOfTwo);
  external void updateTextureSamplingMode(
      num samplingMode, WebGLTexture texture);
  external void updateDynamicTexture(
      WebGLTexture texture, CanvasElement canvas, bool invertY);
  external void updateVideoTexture(
      WebGLTexture texture, VideoElement video, bool invertY);
  external WebGLTexture createRenderTargetTexture(
      dynamic size, dynamic options);
  external WebGLTexture createRenderTargetCubeTexture(
      num size, dynamic options);
  external WebGLTexture createCubeTexture(
      String rootUrl, Scene scene, List<String> files, bool noMipmap);
  external void _releaseTexture(WebGLTexture texture);
  external void bindSamplers(Effect effect);
  external void _bindTexture(num channel, WebGLTexture texture);
  external void setTextureFromPostProcess(num channel, PostProcess postProcess);
  external void unbindAllTextures();
  external void setTexture(num channel, BaseTexture texture);
  external void _setAnisotropicLevel(num key, BaseTexture texture);
  external Uint8List readPixels(num x, num y, num width, num height);
  external void releaseInternalTexture(WebGLTexture texture);
  external void dispose();
  external void displayLoadingUI();
  external void hideLoadingUI();
  external ILoadingScreen get loadingScreen;
  external set loadingScreen(ILoadingScreen v);
  external String get loadingUIText;
  external set loadingUIText(String v);
  external String get loadingUIBackgroundColor;
  external set loadingUIBackgroundColor(String v);
  external num getFps();
  external num getDeltaTime();

  external static bool isSupported();
}

@JS()
class Window {
  external factory Window();

  external dynamic mozIndexedDB(dynamic func);
  external dynamic webkitIndexedDB(dynamic func);
  external dynamic IDBTransaction(dynamic func);
  external dynamic webkitIDBTransaction(dynamic func);
  external dynamic msIDBTransaction(dynamic func);
  external dynamic IDBKeyRange(dynamic func);
  external dynamic webkitIDBKeyRange(dynamic func);
  external dynamic msIDBKeyRange(dynamic func);
  external HTMLURL get webkitURL;
  external set webkitURL(HTMLURL v);
  external dynamic webkitRequestAnimationFrame(dynamic func);
  external dynamic mozRequestAnimationFrame(dynamic func);
  external dynamic oRequestAnimationFrame(dynamic func);
  external WebGLRenderingContext get WebGLRenderingContext;
  external set WebGLRenderingContext(WebGLRenderingContext v);
  external MSGesture get MSGesture;
  external set MSGesture(MSGesture v);
  external dynamic get CANNON;
  external set CANNON(dynamic v);
  external dynamic get SIMD;
  external set SIMD(dynamic v);
  external AudioContext get AudioContext;
  external set AudioContext(AudioContext v);
  external AudioContext get webkitAudioContext;
  external set webkitAudioContext(AudioContext v);
  external dynamic get PointerEvent;
  external set PointerEvent(dynamic v);
}

@JS()
class HTMLURL {
  external factory HTMLURL();

  external dynamic createObjectURL(dynamic param1, dynamic param2);
}

@JS()
class Document {
  external factory Document();

  external void exitFullscreen();
  external void webkitCancelFullScreen();
  external void mozCancelFullScreen();
  external void msCancelFullScreen();
  external bool get mozFullScreen;
  external set mozFullScreen(bool v);
  external bool get msIsFullScreen;
  external set msIsFullScreen(bool v);
  external bool get fullscreen;
  external set fullscreen(bool v);
  external Element get mozPointerLockElement;
  external set mozPointerLockElement(Element v);
  external Element get msPointerLockElement;
  external set msPointerLockElement(Element v);
  external Element get webkitPointerLockElement;
  external set webkitPointerLockElement(Element v);
}

@JS()
class CanvasElement {
  external factory CanvasElement();

  external void requestPointerLock();
  external void msRequestPointerLock();
  external void mozRequestPointerLock();
  external void webkitRequestPointerLock();
}

@JS()
class CanvasRenderingContext2D {
  external factory CanvasRenderingContext2D();

  external bool get imageSmoothingEnabled;
  external set imageSmoothingEnabled(bool v);
  external bool get mozImageSmoothingEnabled;
  external set mozImageSmoothingEnabled(bool v);
  external bool get oImageSmoothingEnabled;
  external set oImageSmoothingEnabled(bool v);
  external bool get webkitImageSmoothingEnabled;
  external set webkitImageSmoothingEnabled(bool v);
}

@JS()
class WebGLTexture {
  external factory WebGLTexture();

  external bool get isReady;
  external set isReady(bool v);
  external bool get isCube;
  external set isCube(bool v);
  external String get url;
  external set url(String v);
  external bool get noMipmap;
  external set noMipmap(bool v);
  external num get samplingMode;
  external set samplingMode(num v);
  external num get references;
  external set references(num v);
  external bool get generateMipMaps;
  external set generateMipMaps(bool v);
  external num get _size;
  external set _size(num v);
  external num get _baseWidth;
  external set _baseWidth(num v);
  external num get _baseHeight;
  external set _baseHeight(num v);
  external num get _width;
  external set _width(num v);
  external num get _height;
  external set _height(num v);
  external CanvasElement get _workingCanvas;
  external set _workingCanvas(CanvasElement v);
  external CanvasRenderingContext2D get _workingContext;
  external set _workingContext(CanvasRenderingContext2D v);
  external WebGLFramebuffer get _framebuffer;
  external set _framebuffer(WebGLFramebuffer v);
  external WebGLRenderbuffer get _depthBuffer;
  external set _depthBuffer(WebGLRenderbuffer v);
  external num get _cachedCoordinatesMode;
  external set _cachedCoordinatesMode(num v);
  external num get _cachedWrapU;
  external set _cachedWrapU(num v);
  external num get _cachedWrapV;
  external set _cachedWrapV(num v);
  external bool get _isDisabled;
  external set _isDisabled(bool v);
}

@JS()
class WebGLBuffer {
  external factory WebGLBuffer();

  external num get references;
  external set references(num v);
  external num get capacity;
  external set capacity(num v);
  external bool get is32Bits;
  external set is32Bits(bool v);
}

@JS()
class MouseEvent {
  external factory MouseEvent();

  external num get mozMovementX;
  external set mozMovementX(num v);
  external num get mozMovementY;
  external set mozMovementY(num v);
  external num get webkitMovementX;
  external set webkitMovementX(num v);
  external num get webkitMovementY;
  external set webkitMovementY(num v);
  external num get msMovementX;
  external set msMovementX(num v);
  external num get msMovementY;
  external set msMovementY(num v);
}

@JS()
class MSStyleCSSProperties {
  external factory MSStyleCSSProperties();

  external String get webkitTransform;
  external set webkitTransform(String v);
  external String get webkitTransition;
  external set webkitTransition(String v);
}

@JS()
class Screen {
  external factory Screen();

  external String get orientation;
  external set orientation(String v);
  external String get mozOrientation;
  external set mozOrientation(String v);
}

@JS()
class HTMLMediaElement {
  external factory HTMLMediaElement();

  external String get crossOrigin;
  external set crossOrigin(String v);
}

@JS()
class Node {
  external factory Node([String name, Scene scene]);

  external Node get parent;
  external set parent(Node v);
  external String get name;
  external set name(String v);
  external String get id;
  external set id(String v);
  external num get uniqueId;
  external set uniqueId(num v);
  external String get state;
  external set state(String v);
  external List<Animation> get animations;
  external set animations(List<Animation> v);
  external void onReady(Node node);

  external num get _currentRenderId;
  external set _currentRenderId(num v);

  external String get _waitingParentId;
  external set _waitingParentId(String v);

  external dynamic get _cache;
  external set _cache(dynamic v);
  external Scene getScene();
  external Engine getEngine();
  external Matrix getWorldMatrix();
  external void _initCache();
  external void updateCache(bool force);
  external void _updateCache(bool ignoreParentClass);
  external bool _isSynchronized();
  external void _markSyncedWithParent();
  external bool isSynchronizedWithParent();
  external bool isSynchronized(bool updateCache);
  external bool hasNewParent(bool update);
  external bool isReady();
  external bool isEnabled();
  external void setEnabled(bool value);
  external bool isDescendantOf(Node ancestor);
  external void _getDescendants(List<Node> list, List<Node> results);
  external List<Node> getDescendants();
  external void _setReady(bool state);
  external Animation getAnimationByName(String name);
  external void createAnimationRange(String name, num from, num to);
  external void deleteAnimationRange(String name, bool deleteFrames);
  external AnimationRange getAnimationRange(String name);
  external void beginAnimation(
      String name, bool loop, num speedRatio, VoidFunc0 onAnimationEnd);
  external dynamic serializeAnimationRanges();
  external static void ParseAnimationRanges(
      Node node, dynamic parsedNode, Scene scene);
}

@JS()
class IDisposable {
  external factory IDisposable();

  external void dispose();
}

@JS()
class Scene {
  external factory Scene([Engine engine]);

  external static num get MinDeltaTime;
  external static num get MaxDeltaTime;
  external static num get FOGMODE_NONE;
  external static num get FOGMODE_EXP;
  external static num get FOGMODE_EXP2;
  external static num get FOGMODE_LINEAR;
  external bool get autoClear;
  external set autoClear(bool v);
  external dynamic get clearColor;
  external set clearColor(dynamic v);
  external Color3 get ambientColor;
  external set ambientColor(Color3 v);
  external void beforeRender();
  external void afterRender();
  external void onDispose();
  external void beforeCameraRender(Camera camera);
  external void afterCameraRender(Camera camera);
  external bool get forceWireframe;
  external set forceWireframe(bool v);
  external bool get forcePointsCloud;
  external set forcePointsCloud(bool v);
  external bool get forceShowBoundingBoxes;
  external set forceShowBoundingBoxes(bool v);
  external Plane get clipPlane;
  external set clipPlane(Plane v);
  external bool get animationsEnabled;
  external set animationsEnabled(bool v);
  external bool get constantlyUpdateMeshUnderPointer;
  external set constantlyUpdateMeshUnderPointer(bool v);
  external void onPointerMove(PointerEvent evt, PickingInfo pickInfo);
  external void onPointerDown(PointerEvent evt, PickingInfo pickInfo);
  external void onPointerUp(PointerEvent evt, PickingInfo pickInfo);
  external void onPointerPick(PointerEvent evt, PickingInfo pickInfo);
  external Camera get cameraToUseForPointers;
  external set cameraToUseForPointers(Camera v);

  external Vector3 get _mirroredCameraPosition;
  external set _mirroredCameraPosition(Vector3 v);

  external bool get fogEnabled;
  external set fogEnabled(bool v);
  external num get fogMode;
  external set fogMode(num v);
  external Color3 get fogColor;
  external set fogColor(Color3 v);
  external num get fogDensity;
  external set fogDensity(num v);
  external num get fogStart;
  external set fogStart(num v);
  external num get fogEnd;
  external set fogEnd(num v);

  external bool get shadowsEnabled;
  external set shadowsEnabled(bool v);

  external bool get lightsEnabled;
  external set lightsEnabled(bool v);

  external List<Light> get lights;
  external set lights(List<Light> v);
  external void onNewLightAdded(
      Light newLight, num positionInArray, Scene scene);
  external void onLightRemoved(Light removedLight);

  external List<Camera> get cameras;
  external set cameras(List<Camera> v);
  external void onNewCameraAdded(
      Camera newCamera, num positionInArray, Scene scene);
  external void onCameraRemoved(Camera removedCamera);
  external List<Camera> get activeCameras;
  external set activeCameras(List<Camera> v);
  external Camera get activeCamera;
  external set activeCamera(Camera v);

  external List<AbstractMesh> get meshes;
  external set meshes(List<AbstractMesh> v);
  external void onNewMeshAdded(
      AbstractMesh newMesh, num positionInArray, Scene scene);
  external void onMeshRemoved(AbstractMesh removedMesh);
  external void onGeometryAdded(Geometry newGeometry);
  external void onGeometryRemoved(Geometry removedGeometry);
  external List<Material> get materials;
  external set materials(List<Material> v);
  external List<MultiMaterial> get multiMaterials;
  external set multiMaterials(List<MultiMaterial> v);
  external StandardMaterial get defaultMaterial;
  external set defaultMaterial(StandardMaterial v);
  external bool get texturesEnabled;
  external set texturesEnabled(bool v);
  external List<BaseTexture> get textures;
  external set textures(List<BaseTexture> v);
  external bool get particlesEnabled;
  external set particlesEnabled(bool v);
  external List<ParticleSystem> get particleSystems;
  external set particleSystems(List<ParticleSystem> v);
  external bool get spritesEnabled;
  external set spritesEnabled(bool v);
  external List<SpriteManager> get spriteManagers;
  external set spriteManagers(List<SpriteManager> v);
  external List<Layer> get layers;
  external set layers(List<Layer> v);
  external bool get skeletonsEnabled;
  external set skeletonsEnabled(bool v);
  external List<Skeleton> get skeletons;
  external set skeletons(List<Skeleton> v);
  external bool get lensFlaresEnabled;
  external set lensFlaresEnabled(bool v);
  external List<LensFlareSystem> get lensFlareSystems;
  external set lensFlareSystems(List<LensFlareSystem> v);
  external bool get collisionsEnabled;
  external set collisionsEnabled(bool v);

  external ICollisionCoordinator get collisionCoordinator;
  external set collisionCoordinator(ICollisionCoordinator v);
  external Vector3 get gravity;
  external set gravity(Vector3 v);
  external bool get postProcessesEnabled;
  external set postProcessesEnabled(bool v);
  external PostProcessManager get postProcessManager;
  external set postProcessManager(PostProcessManager v);
  external PostProcessRenderPipelineManager
  get postProcessRenderPipelineManager;
  external set postProcessRenderPipelineManager(
      PostProcessRenderPipelineManager v);
  external bool get renderTargetsEnabled;
  external set renderTargetsEnabled(bool v);
  external bool get dumpNextRenderTargets;
  external set dumpNextRenderTargets(bool v);
  external List<RenderTargetTexture> get customRenderTargets;
  external set customRenderTargets(List<RenderTargetTexture> v);
  external bool get useDelayedTextureLoading;
  external set useDelayedTextureLoading(bool v);
  external List<String> get importedMeshesFiles;
  external set importedMeshesFiles(List<String> v);
  external bool get probesEnabled;
  external set probesEnabled(bool v);
  external List<ReflectionProbe> get reflectionProbes;
  external set reflectionProbes(List<ReflectionProbe> v);
  external dynamic get database;
  external set database(dynamic v);

  external ActionManager get actionManager;
  external set actionManager(ActionManager v);
  external List<ActionManager> get _actionManagers;
  external set _actionManagers(List<ActionManager> v);

  external bool get proceduralTexturesEnabled;
  external set proceduralTexturesEnabled(bool v);
  external List<ProceduralTexture> get _proceduralTextures;
  external set _proceduralTextures(List<ProceduralTexture> v);
  external SoundTrack get mainSoundTrack;
  external set mainSoundTrack(SoundTrack v);
  external List<SoundTrack> get soundTracks;
  external set soundTracks(List<SoundTrack> v);

  external SimplificationQueue get simplificationQueue;
  external set simplificationQueue(SimplificationQueue v);

  external num get _activeIndices;
  external set _activeIndices(num v);
  external num get _activeParticles;
  external set _activeParticles(num v);

  external num get _particlesDuration;
  external set _particlesDuration(num v);

  external num get _spritesDuration;
  external set _spritesDuration(num v);

  external Material get _cachedMaterial;
  external set _cachedMaterial(Material v);

  external SmartList<IDisposable> get _toBeDisposed;
  external set _toBeDisposed(SmartList<IDisposable> v);

  external SmartList<ParticleSystem> get _activeParticleSystems;
  external set _activeParticleSystems(SmartList<ParticleSystem> v);

  external num get _activeBones;
  external set _activeBones(num v);

  external List<Animatable> get _activeAnimatables;
  external set _activeAnimatables(List<Animatable> v);

  external DebugLayer get debugLayer;
  external set debugLayer(DebugLayer v);
  external bool get workerCollisions;
  external set workerCollisions(bool v);
  external Octree<AbstractMesh> get SelectionOctree;
  external set SelectionOctree(Octree<AbstractMesh> v);

  external AbstractMesh get meshUnderPointer;
  external set meshUnderPointer(AbstractMesh v);

  external num get pointerX;
  external set pointerX(num v);

  external num get pointerY;
  external set pointerY(num v);
  external Material getCachedMaterial();
  external BoundingBoxRenderer getBoundingBoxRenderer();
  external OutlineRenderer getOutlineRenderer();
  external Engine getEngine();
  external num getTotalVertices();
  external num getActiveIndices();
  external num getActiveParticles();
  external num getActiveBones();
  external num getLastFrameDuration();
  external num getEvaluateActiveMeshesDuration();
  external SmartList<Mesh> getActiveMeshes();
  external num getRenderTargetsDuration();
  external num getRenderDuration();
  external num getParticlesDuration();
  external num getSpritesDuration();
  external num getAnimationRatio();
  external num getRenderId();
  external void incrementRenderId();
  external void attachControl();
  external void detachControl();
  external bool isReady();
  external void resetCachedMaterial();
  external void registerBeforeRender(VoidFunc0 func);
  external void unregisterBeforeRender(VoidFunc0 func);
  external void registerAfterRender(VoidFunc0 func);
  external void unregisterAfterRender(VoidFunc0 func);
  external void _addPendingData(dynamic data);
  external void _removePendingData(dynamic data);
  external num getWaitingItemsCount();
  external void executeWhenReady(VoidFunc0 func);
  external void _checkIsReady();
  external Animatable beginAnimation(
      dynamic target,
      num from,
      num to,
      bool loop,
      num speedRatio,
      VoidFunc0 onAnimationEnd,
      Animatable animatable);
  external Animatable beginDirectAnimation(
      dynamic target,
      List<Animation> animations,
      num from,
      num to,
      bool loop,
      num speedRatio,
      VoidFunc0 onAnimationEnd);
  external Animatable getAnimatableByTarget(dynamic target);
  external List<Animatable> get Animatables;
  external set Animatables(List<Animatable> v);
  external void stopAnimation(dynamic target);
  external Matrix getViewMatrix();
  external Matrix getProjectionMatrix();
  external Matrix getTransformMatrix();
  external void setTransformMatrix(Matrix view, Matrix projection);
  external void addMesh(AbstractMesh newMesh);
  external num removeMesh(AbstractMesh toRemove);
  external num removeSkeleton(Skeleton toRemove);
  external num removeLight(Light toRemove);
  external num removeCamera(Camera toRemove);
  external void addLight(Light newLight);
  external void addCamera(Camera newCamera);
  external void swithActiveCamera(Camera newCamera, bool attachControl);
  external Camera setActiveCameraByID(String id);
  external Camera setActiveCameraByName(String name);
  external Material getMaterialByID(String id);
  external Material getMaterialByName(String name);
  external LensFlareSystem getLensFlareSystemByName(String name);
  external Camera getCameraByID(String id);
  external Camera getCameraByUniqueID(num uniqueId);
  external Camera getCameraByName(String name);
  external Bone getBoneByID(String id);
  external Bone getBoneByName(String name);
  external Light getLightByName(String name);
  external Light getLightByID(String id);
  external Light getLightByUniqueID(num uniqueId);
  external ParticleSystem getParticleSystemByID(String id);
  external Geometry getGeometryByID(String id);
  external bool pushGeometry(Geometry geometry, bool force);
  external bool removeGeometry(Geometry geometry);
  external List<Geometry> getGeometries();
  external AbstractMesh getMeshByID(String id);
  external AbstractMesh getMeshByUniqueID(num uniqueId);
  external AbstractMesh getLastMeshByID(String id);
  external Node getLastEntryByID(String id);
  external Node getNodeByID(String id);
  external Node getNodeByName(String name);
  external AbstractMesh getMeshByName(String name);
  external Sound getSoundByName(String name);
  external Skeleton getLastSkeletonByID(String id);
  external Skeleton getSkeletonById(String id);
  external Skeleton getSkeletonByName(String name);
  external bool isActiveMesh(Mesh mesh);
  external void updateTransformMatrix(bool force);
  external void render();

  external bool get audioEnabled;
  external set audioEnabled(bool v);

  external bool get headphone;
  external set headphone(bool v);
  external DepthRenderer enableDepthRenderer();
  external void disableDepthRenderer();
  external void freezeMaterials();
  external void unfreezeMaterials();
  external void dispose();
  external void disposeSounds();
  external dynamic getWorldExtends();
  external Octree<AbstractMesh> createOrUpdateSelectionOctree(
      num maxCapacity, num maxDepth);
  external Ray createPickingRay(
      num x, num y, Matrix world, Camera camera, bool cameraViewSpace);
  external Ray createPickingRayInCameraSpace(num x, num y, Camera camera);
  external PickingInfo pick(num x, num y, Func1<AbstractMesh, bool> predicate,
                            bool fastCheck, Camera camera);
  external PickingInfo pickSprite(num x, num y, Func1<Sprite, bool> predicate,
                                  bool fastCheck, Camera camera);
  external PickingInfo pickWithRay(
      Ray ray, Func1<Mesh, bool> predicate, bool fastCheck);
  external void setPointerOverMesh(AbstractMesh mesh);
  external AbstractMesh getPointerOverMesh();
  external PhysicsEngine getPhysicsEngine();
  external bool enablePhysics(Vector3 gravity, IPhysicsEnginePlugin plugin);
  external void disablePhysicsEngine();
  external bool isPhysicsEnabled();
  external void setGravity(Vector3 gravity);
  external dynamic createCompoundImpostor(
      dynamic parts, PhysicsBodyCreationOptions options);
  external void deleteCompoundImpostor(dynamic compound);
  external void createDefaultCameraOrLight();
  external List<Mesh> getMeshesByTags(
      String tagsQuery, VoidFunc1<AbstractMesh> forEach);
  external List<Camera> getCamerasByTags(
      String tagsQuery, VoidFunc1<Camera> forEach);
  external List<Light> getLightsByTags(
      String tagsQuery, VoidFunc1<Light> forEach);
  external List<Material> getMaterialByTags(
      String tagsQuery, VoidFunc1<Material> forEach);
}

@JS()
class Action {
  external factory Action([dynamic triggerOptions, Condition condition]);

  external dynamic get triggerOptions;
  external set triggerOptions(dynamic v);
  external num get trigger;
  external set trigger(num v);
  external ActionManager get _actionManager;
  external set _actionManager(ActionManager v);
  external void _prepare();
  external dynamic getTriggerParameter();
  external void _executeCurrent(ActionEvent evt);
  external void execute(ActionEvent evt);
  external void skipToNextActiveAction();
  external Action then(Action action);
  external String _getProperty(String propertyPath);
  external dynamic _getEffectiveTarget(dynamic target, String propertyPath);
}

@JS()
class ActionEvent {
  external factory ActionEvent(
      [dynamic source,
      num pointerX,
      num pointerY,
      AbstractMesh meshUnderPointer,
      dynamic sourceEvent,
      dynamic additionalData]);

  external dynamic get source;
  external set source(dynamic v);
  external num get pointerX;
  external set pointerX(num v);
  external num get pointerY;
  external set pointerY(num v);
  external AbstractMesh get meshUnderPointer;
  external set meshUnderPointer(AbstractMesh v);
  external dynamic get sourceEvent;
  external set sourceEvent(dynamic v);
  external dynamic get additionalData;
  external set additionalData(dynamic v);

  external static ActionEvent CreateNew(
      AbstractMesh source, Event evt, dynamic additionalData);

  external static ActionEvent CreateNewFromSprite(
      Sprite source, Scene scene, Event evt, dynamic additionalData);

  external static ActionEvent CreateNewFromScene(Scene scene, Event evt);
}

@JS()
class ActionManager {
  external factory ActionManager([Scene scene]);

  external static num get NothingTrigger;
  external static num get OnPickTrigger;
  external static num get OnLeftPickTrigger;
  external static num get OnRightPickTrigger;
  external static num get OnCenterPickTrigger;
  external static num get OnPickDownTrigger;
  external static num get OnPickUpTrigger;
  external static num get OnLongPressTrigger;
  external static num get OnPointerOverTrigger;
  external static num get OnPointerOutTrigger;
  external static num get OnEveryFrameTrigger;
  external static num get OnIntersectionEnterTrigger;
  external static num get OnIntersectionExitTrigger;
  external static num get OnKeyDownTrigger;
  external static num get OnKeyUpTrigger;
  external static num get DragMovementThreshold;
  external static num get LongPressDelay;
  external List<Action> get actions;
  external set actions(List<Action> v);
  external void dispose();
  external Scene getScene();
  external bool hasSpecificTriggers(List<num> triggers);
  external bool hasSpecificTrigger(num trigger);

  external bool get hasPointerTriggers;
  external set hasPointerTriggers(bool v);

  external bool get hasPickTriggers;
  external set hasPickTriggers(bool v);
  external Action registerAction(Action action);
  external void processTrigger(num trigger, ActionEvent evt);
  external dynamic _getEffectiveTarget(dynamic target, String propertyPath);
  external String _getProperty(String propertyPath);
  external static void Parse(
      dynamic parsedActions, AbstractMesh object, Scene scene);
}

@JS()
class Condition {
  external factory Condition([ActionManager actionManager]);

  external ActionManager get _actionManager;
  external set _actionManager(ActionManager v);
  external num get _evaluationId;
  external set _evaluationId(num v);
  external bool get _currentResult;
  external set _currentResult(bool v);
  external bool isValid();
  external String _getProperty(String propertyPath);
  external dynamic _getEffectiveTarget(dynamic target, String propertyPath);
}

@JS()
class ValueCondition extends Condition {
  external factory ValueCondition(
      [ActionManager actionManager,
      dynamic target,
      String propertyPath,
      dynamic value,
      num operator]);

  external String get propertyPath;
  external set propertyPath(String v);
  external dynamic get value;
  external set value(dynamic v);
  external num get operator;
  external set operator(num v);

  external static num get IsEqual;
  external static num get IsDifferent;
  external static num get IsGreater;
  external static num get IsLesser;
  external ActionManager get _actionManager;
  external set _actionManager(ActionManager v);
  external bool isValid();
}

@JS()
class PredicateCondition extends Condition {
  external factory PredicateCondition(
      [ActionManager actionManager, Func0<bool> predicate]);

  external bool predicate();
  external ActionManager get _actionManager;
  external set _actionManager(ActionManager v);
  external bool isValid();
}

@JS()
class StateCondition extends Condition {
  external factory StateCondition(
      [ActionManager actionManager, dynamic target, String value]);

  external String get value;
  external set value(String v);
  external ActionManager get _actionManager;
  external set _actionManager(ActionManager v);
  external bool isValid();
}

@JS()
class SwitchBooleanAction extends Action {
  external factory SwitchBooleanAction(
      [dynamic triggerOptions,
      dynamic target,
      String propertyPath,
      Condition condition]);

  external String get propertyPath;
  external set propertyPath(String v);
  external void _prepare();
  external void execute();
}

@JS()
class SetStateAction extends Action {
  external factory SetStateAction(
      [dynamic triggerOptions,
      dynamic target,
      String value,
      Condition condition]);

  external String get value;
  external set value(String v);
  external void execute();
}

@JS()
class SetValueAction extends Action {
  external factory SetValueAction(
      [dynamic triggerOptions,
      dynamic target,
      String propertyPath,
      dynamic value,
      Condition condition]);

  external String get propertyPath;
  external set propertyPath(String v);
  external dynamic get value;
  external set value(dynamic v);
  external void _prepare();
  external void execute();
}

@JS()
class IncrementValueAction extends Action {
  external factory IncrementValueAction(
      [dynamic triggerOptions,
      dynamic target,
      String propertyPath,
      dynamic value,
      Condition condition]);

  external String get propertyPath;
  external set propertyPath(String v);
  external dynamic get value;
  external set value(dynamic v);
  external void _prepare();
  external void execute();
}

@JS()
class PlayAnimationAction extends Action {
  external factory PlayAnimationAction(
      [dynamic triggerOptions,
      dynamic target,
      num from,
      num to,
      bool loop,
      Condition condition]);

  external num get from;
  external set from(num v);
  external num get to;
  external set to(num v);
  external bool get loop;
  external set loop(bool v);
  external void _prepare();
  external void execute();
}

@JS()
class StopAnimationAction extends Action {
  external factory StopAnimationAction(
      [dynamic triggerOptions, dynamic target, Condition condition]);

  external void _prepare();
  external void execute();
}

@JS()
class DoNothingAction extends Action {
  external factory DoNothingAction(
      [dynamic triggerOptions, Condition condition]);

  external void execute();
}

@JS()
class CombineAction extends Action {
  external factory CombineAction(
      [dynamic triggerOptions, List<Action> children, Condition condition]);

  external List<Action> get children;
  external set children(List<Action> v);
  external void _prepare();
  external void execute(ActionEvent evt);
}

@JS()
class ExecuteCodeAction extends Action {
  external factory ExecuteCodeAction(
      [dynamic triggerOptions,
      VoidFunc1<ActionEvent> func,
      Condition condition]);

  external void func(ActionEvent evt);
  external void execute(ActionEvent evt);
}

@JS()
class SetParentAction extends Action {
  external factory SetParentAction(
      [dynamic triggerOptions,
      dynamic target,
      dynamic parent,
      Condition condition]);

  external void _prepare();
  external void execute();
}

@JS()
class PlaySoundAction extends Action {
  external factory PlaySoundAction(
      [dynamic triggerOptions, Sound sound, Condition condition]);

  external void _prepare();
  external void execute();
}

@JS()
class StopSoundAction extends Action {
  external factory StopSoundAction(
      [dynamic triggerOptions, Sound sound, Condition condition]);

  external void _prepare();
  external void execute();
}

@JS()
class InterpolateValueAction extends Action {
  external factory InterpolateValueAction(
      [dynamic triggerOptions,
      dynamic target,
      String propertyPath,
      dynamic value,
      num duration,
      Condition condition,
      bool stopOtherAnimations,
      VoidFunc0 onInterpolationDone]);

  external String get propertyPath;
  external set propertyPath(String v);
  external dynamic get value;
  external set value(dynamic v);
  external num get duration;
  external set duration(num v);
  external bool get stopOtherAnimations;
  external set stopOtherAnimations(bool v);
  external void onInterpolationDone();
  external void _prepare();
  external void execute();
}

@JS()
class Animatable {
  external factory Animatable(
      [Scene scene,
      dynamic target,
      num fromFrame,
      num toFrame,
      bool loopAnimation,
      num speedRatio,
      dynamic onAnimationEnd,
      dynamic animations]);

  external dynamic get target;
  external set target(dynamic v);
  external num get fromFrame;
  external set fromFrame(num v);
  external num get toFrame;
  external set toFrame(num v);
  external bool get loopAnimation;
  external set loopAnimation(bool v);
  external num get speedRatio;
  external set speedRatio(num v);
  external dynamic get onAnimationEnd;
  external set onAnimationEnd(dynamic v);

  external bool get animationStarted;
  external set animationStarted(bool v);
  external List<Animation> getAnimations();
  external void appendAnimations(dynamic target, List<Animation> animations);
  external Animation getAnimationByTargetProperty(String property);
  external void reset();
  external void goToFrame(num frame);
  external void pause();
  external void restart();
  external void stop();
  external bool _animate(num delay);
}

@JS()
class AnimationRange {
  external factory AnimationRange([String name, num from, num to]);

  external String get name;
  external set name(String v);
  external num get from;
  external set from(num v);
  external num get to;
  external set to(num v);
}

@JS()
class AnimationEvent {
  external factory AnimationEvent([num frame, VoidFunc0 action, bool onlyOnce]);

  external num get frame;
  external set frame(num v);
  external void action();
  external bool get onlyOnce;
  external set onlyOnce(bool v);
  external bool get isDone;
  external set isDone(bool v);
}

@JS()
class Animation {
  external factory Animation(
      [String name,
      String targetProperty,
      num framePerSecond,
      num dataType,
      num loopMode]);

  external String get name;
  external set name(String v);
  external String get targetProperty;
  external set targetProperty(String v);
  external num get framePerSecond;
  external set framePerSecond(num v);
  external num get dataType;
  external set dataType(num v);
  external num get loopMode;
  external set loopMode(num v);

  external dynamic get _target;
  external set _target(dynamic v);

  external List<String> get targetPropertyPath;
  external set targetPropertyPath(List<String> v);
  external num get currentFrame;
  external set currentFrame(num v);
  external bool get allowMatricesInterpolation;
  external set allowMatricesInterpolation(bool v);

  external static Animation _PrepareAnimation(
      String name,
      String targetProperty,
      num framePerSecond,
      num totalFrame,
      dynamic from,
      dynamic to,
      num loopMode,
      EasingFunction easingFunction);
  external static Animatable CreateAndStartAnimation(
      String name,
      Node node,
      String targetProperty,
      num framePerSecond,
      num totalFrame,
      dynamic from,
      dynamic to,
      num loopMode,
      EasingFunction easingFunction,
      VoidFunc0 onAnimationEnd);
  external static Animatable CreateMergeAndStartAnimation(
      String name,
      Node node,
      String targetProperty,
      num framePerSecond,
      num totalFrame,
      dynamic from,
      dynamic to,
      num loopMode,
      EasingFunction easingFunction,
      VoidFunc0 onAnimationEnd);
  external void addEvent(AnimationEvent event);
  external void removeEvents(num frame);
  external void createRange(String name, num from, num to);
  external void deleteRange(String name, bool deleteFrames);
  external AnimationRange getRange(String name);
  external void reset();
  external bool isStopped();
  external List<dynamic> getKeys();
  external num getHighestFrame();
  external IEasingFunction getEasingFunction();
  external void setEasingFunction(EasingFunction easingFunction);
  external num floatInterpolateFunction(
      num startValue, num endValue, num gradient);
  external Quaternion quaternionInterpolateFunction(
      Quaternion startValue, Quaternion endValue, num gradient);
  external Vector3 vector3InterpolateFunction(
      Vector3 startValue, Vector3 endValue, num gradient);
  external Vector2 vector2InterpolateFunction(
      Vector2 startValue, Vector2 endValue, num gradient);
  external Color3 color3InterpolateFunction(
      Color3 startValue, Color3 endValue, num gradient);
  external Matrix matrixInterpolateFunction(
      Matrix startValue, Matrix endValue, num gradient);
  external Animation clone();
  external void setKeys(List<dynamic> values);
  external void setValue(dynamic currentValue);
  external void goToFrame(num frame);
  external bool animate(num delay, num from, num to, bool loop, num speedRatio);
  external dynamic serialize();

  external static num get ANIMATIONTYPE_FLOAT;
  external static num get ANIMATIONTYPE_VECTOR3;
  external static num get ANIMATIONTYPE_VECTOR2;
  external static num get ANIMATIONTYPE_QUATERNION;
  external static num get ANIMATIONTYPE_MATRIX;
  external static num get ANIMATIONTYPE_COLOR3;
  external static num get ANIMATIONLOOPMODE_RELATIVE;
  external static num get ANIMATIONLOOPMODE_CYCLE;
  external static num get ANIMATIONLOOPMODE_CONSTANT;
  external static Animation Parse(dynamic parsedAnimation);
  external static dynamic AppendSerializedAnimations(
      IAnimatable source, dynamic destination);
}

@JS()
class IEasingFunction {
  external factory IEasingFunction();

  external num ease(num gradient);
}

@JS()
class EasingFunction {
  external factory EasingFunction();

  external static num get EASINGMODE_EASEIN;
  external static num get EASINGMODE_EASEOUT;
  external static num get EASINGMODE_EASEINOUT;
  external void setEasingMode(num easingMode);
  external num getEasingMode();
  external num easeInCore(num gradient);
  external num ease(num gradient);
}

@JS()
class CircleEase extends EasingFunction {
  external factory CircleEase();

  external num easeInCore(num gradient);
}

@JS()
class BackEase extends EasingFunction {
  external factory BackEase([num amplitude]);

  external num get amplitude;
  external set amplitude(num v);
  external num easeInCore(num gradient);
}

@JS()
class BounceEase extends EasingFunction {
  external factory BounceEase([num bounces, num bounciness]);

  external num get bounces;
  external set bounces(num v);
  external num get bounciness;
  external set bounciness(num v);
  external num easeInCore(num gradient);
}

@JS()
class CubicEase extends EasingFunction {
  external factory CubicEase();

  external num easeInCore(num gradient);
}

@JS()
class ElasticEase extends EasingFunction {
  external factory ElasticEase([num oscillations, num springiness]);

  external num get oscillations;
  external set oscillations(num v);
  external num get springiness;
  external set springiness(num v);
  external num easeInCore(num gradient);
}

@JS()
class ExponentialEase extends EasingFunction {
  external factory ExponentialEase([num exponent]);

  external num get exponent;
  external set exponent(num v);
  external num easeInCore(num gradient);
}

@JS()
class PowerEase extends EasingFunction {
  external factory PowerEase([num power]);

  external num get power;
  external set power(num v);
  external num easeInCore(num gradient);
}

@JS()
class QuadraticEase extends EasingFunction {
  external factory QuadraticEase();

  external num easeInCore(num gradient);
}

@JS()
class QuarticEase extends EasingFunction {
  external factory QuarticEase();

  external num easeInCore(num gradient);
}

@JS()
class QuinticEase extends EasingFunction {
  external factory QuinticEase();

  external num easeInCore(num gradient);
}

@JS()
class SineEase extends EasingFunction {
  external factory SineEase();

  external num easeInCore(num gradient);
}

@JS()
class BezierCurveEase extends EasingFunction {
  external factory BezierCurveEase([num x1, num y1, num x2, num y2]);

  external num get x1;
  external set x1(num v);
  external num get y1;
  external set y1(num v);
  external num get x2;
  external set x2(num v);
  external num get y2;
  external set y2(num v);
  external num easeInCore(num gradient);
}

@JS()
class Analyser {
  external factory Analyser([Scene scene]);

  external num get SMOOTHING;
  external set SMOOTHING(num v);
  external num get FFT_SIZE;
  external set FFT_SIZE(num v);
  external num get BARGRAPHAMPLITUDE;
  external set BARGRAPHAMPLITUDE(num v);
  external dynamic get DEBUGCANVASPOS;
  external set DEBUGCANVASPOS(dynamic v);
  external dynamic get DEBUGCANVASSIZE;
  external set DEBUGCANVASSIZE(dynamic v);
  external num getFrequencyBinCount();
  external Uint8List getByteFrequencyData();
  external Uint8List getByteTimeDomainData();
  external Uint8List getFloatFrequencyData();
  external void drawDebugCanvas();
  external void stopDebugCanvas();
  external void connectAudioNodes(
      AudioNode inputAudioNode, AudioNode outputAudioNode);
  external void dispose();
}

@JS()
class AudioEngine {
  external factory AudioEngine();

  external bool get canUseWebAudio;
  external set canUseWebAudio(bool v);
  external GainNode get masterGain;
  external set masterGain(GainNode v);

  external bool get WarnedWebAudioUnsupported;
  external set WarnedWebAudioUnsupported(bool v);
  external bool get unlocked;
  external set unlocked(bool v);
  external dynamic onAudioUnlocked();
  external AudioContext get audioContext;
  external set audioContext(AudioContext v);
  external void dispose();
  external num getGlobalVolume();
  external void setGlobalVolume(num newVolume);
  external void connectToAnalyser(Analyser analyser);
}

@JS()
class Sound {
  external factory Sound(
      [String name,
      dynamic urlOrArrayBuffer,
      Scene scene,
      VoidFunc0 readyToPlayCallback,
      dynamic options]);

  external String get name;
  external set name(String v);
  external bool get autoplay;
  external set autoplay(bool v);
  external bool get loop;
  external set loop(bool v);
  external bool get useCustomAttenuation;
  external set useCustomAttenuation(bool v);
  external num get soundTrackId;
  external set soundTrackId(num v);
  external bool get spatialSound;
  external set spatialSound(bool v);
  external num get refDistance;
  external set refDistance(num v);
  external num get rolloffFactor;
  external set rolloffFactor(num v);
  external num get maxDistance;
  external set maxDistance(num v);
  external String get distanceModel;
  external set distanceModel(String v);
  external dynamic onended();

  external bool get isPlaying;
  external set isPlaying(bool v);
  external bool get isPaused;
  external set isPaused(bool v);
  external void dispose();
  external void setAudioBuffer(AudioBuffer audioBuffer);
  external void updateOptions(dynamic options);
  external void switchPanningModelToHRTF();
  external void switchPanningModelToEqualPower();
  external void connectToSoundTrackAudioNode(AudioNode soundTrackAudioNode);
  external void setDirectionalCone(
      num coneInnerAngle, num coneOuterAngle, num coneOuterGain);
  external void setPosition(Vector3 newPosition);
  external void setLocalDirectionToMesh(Vector3 newLocalDirection);
  external void updateDistanceFromListener();
  external void play(num time);
  external void stop(num time);
  external void pause();
  external void setVolume(num newVolume, num time);
  external void setPlaybackRate(num newPlaybackRate);
  external num getVolume();
  external void attachToMesh(AbstractMesh meshToConnectTo);
  external Sound clone();
  external AudioBuffer getAudioBuffer();
  external static Sound Parse(
      dynamic parsedSound, Scene scene, String rootUrl, Sound sourceSound);
}

@JS()
class SoundTrack {
  external factory SoundTrack([Scene scene, dynamic options]);

  external num get id;
  external set id(num v);
  external List<Sound> get soundCollection;
  external set soundCollection(List<Sound> v);
  external void dispose();
  external void AddSound(Sound sound);
  external void RemoveSound(Sound sound);
  external void setVolume(num newVolume);
  external void switchPanningModelToHRTF();
  external void switchPanningModelToEqualPower();
  external void connectToAnalyser(Analyser analyser);
}

@JS()
class Bone extends Node {
  external factory Bone(
      [String name,
      Skeleton skeleton,
      Bone parentBone,
      Matrix matrix,
      Matrix restPose]);

  external String get name;
  external set name(String v);
  external List<Bone> get children;
  external set children(List<Bone> v);
  external List<Animation> get animations;
  external set animations(List<Animation> v);
  external num get length;
  external set length(num v);

  external Matrix get _matrix;
  external set _matrix(Matrix v);
  external Bone getParent();
  external Matrix getLocalMatrix();
  external Matrix getBaseMatrix();
  external Matrix getRestPose();
  external void returnToRest();
  external Matrix getWorldMatrix();
  external Matrix getInvertedAbsoluteTransform();
  external Matrix getAbsoluteTransform();
  external void updateMatrix(Matrix matrix);
  external void _updateDifferenceMatrix(Matrix rootMatrix);
  external void markAsDirty();
  external bool copyAnimationRange(
      Bone source, String rangeName, num frameOffset, bool rescaleAsRequired);
}

@JS()
class Skeleton {
  external factory Skeleton([String name, String id, Scene scene]);

  external String get name;
  external set name(String v);
  external String get id;
  external set id(String v);
  external List<Bone> get bones;
  external set bones(List<Bone> v);
  external bool get needInitialSkinMatrix;
  external set needInitialSkinMatrix(bool v);
  external List getTransformMatrices(AbstractMesh mesh);
  external Scene getScene();
  external void createAnimationRange(String name, num from, num to);
  external void deleteAnimationRange(String name, bool deleteFrames);
  external AnimationRange getAnimationRange(String name);
  external bool copyAnimationRange(
      Skeleton source, String name, bool rescaleAsRequired);
  external void returnToRest();
  external void beginAnimation(
      String name, bool loop, num speedRatio, VoidFunc0 onAnimationEnd);
  external void _markAsDirty();
  external void _registerMeshWithPoseMatrix(AbstractMesh mesh);
  external void _unregisterMeshWithPoseMatrix(AbstractMesh mesh);
  external void _computeTransformMatrices(
      List targetMatrix, Matrix initialSkinMatrix);
  external void prepare();
  external List<IAnimatable> getAnimatables();
  external Skeleton clone(String name, String id);
  external void dispose();
  external dynamic serialize();
  external static Skeleton Parse(dynamic parsedSkeleton, Scene scene);
}

@JS()
class ArcRotateCamera extends TargetCamera {
  external factory ArcRotateCamera(
      [String name,
      num alpha,
      num beta,
      num radius,
      dynamic target,
      Scene scene]);

  external num get alpha;
  external set alpha(num v);
  external num get beta;
  external set beta(num v);
  external num get radius;
  external set radius(num v);
  external dynamic get target;
  external set target(dynamic v);
  external num get inertialAlphaOffset;
  external set inertialAlphaOffset(num v);
  external num get inertialBetaOffset;
  external set inertialBetaOffset(num v);
  external num get inertialRadiusOffset;
  external set inertialRadiusOffset(num v);
  external dynamic get lowerAlphaLimit;
  external set lowerAlphaLimit(dynamic v);
  external dynamic get upperAlphaLimit;
  external set upperAlphaLimit(dynamic v);
  external num get lowerBetaLimit;
  external set lowerBetaLimit(num v);
  external num get upperBetaLimit;
  external set upperBetaLimit(num v);
  external dynamic get lowerRadiusLimit;
  external set lowerRadiusLimit(dynamic v);
  external dynamic get upperRadiusLimit;
  external set upperRadiusLimit(dynamic v);
  external num get angularSensibilityX;
  external set angularSensibilityX(num v);
  external num get angularSensibilityY;
  external set angularSensibilityY(num v);
  external num get wheelPrecision;
  external set wheelPrecision(num v);
  external num get pinchPrecision;
  external set pinchPrecision(num v);
  external num get panningSensibility;
  external set panningSensibility(num v);
  external num get inertialPanningX;
  external set inertialPanningX(num v);
  external num get inertialPanningY;
  external set inertialPanningY(num v);
  external List<num> get keysUp;
  external set keysUp(List<num> v);
  external List<num> get keysDown;
  external set keysDown(List<num> v);
  external List<num> get keysLeft;
  external set keysLeft(List<num> v);
  external List<num> get keysRight;
  external set keysRight(List<num> v);
  external num get zoomOnFactor;
  external set zoomOnFactor(num v);
  external Vector2 get targetScreenOffset;
  external set targetScreenOffset(Vector2 v);
  external bool get pinchInwards;
  external set pinchInwards(bool v);
  external bool get allowUpsideDown;
  external set allowUpsideDown(bool v);

  external Matrix get _viewMatrix;
  external set _viewMatrix(Matrix v);
  external void _reset();

  external Vector3 get panningAxis;
  external set panningAxis(Vector3 v);
  external void onCollide(AbstractMesh collidedMesh);
  external bool get checkCollisions;
  external set checkCollisions(bool v);
  external Vector3 get collisionRadius;
  external set collisionRadius(Vector3 v);

  external num get angularSensibility;
  external set angularSensibility(num v);
  external Vector3 _getTargetPosition();
  external void _initCache();
  external void _updateCache(bool ignoreParentClass);
  external bool _isSynchronizedViewMatrix();
  external void attachControl(
      Element element, bool noPreventDefault, bool useCtrlForPanning);
  external void detachControl(Element element);
  external void _checkInputs();
  external void setPosition(Vector3 position);
  external void setTarget(Vector3 target);
  external Matrix _getViewMatrix();
  external void zoomOn(List<AbstractMesh> meshes, bool doNotUpdateMaxZ);
  external void focusOn(
      dynamic meshesOrMinMaxVectorAndDistance, bool doNotUpdateMaxZ);
  external Camera createRigCamera(String name, num cameraIndex);
  external void _updateRigCameras();
  external dynamic serialize();
}

@JS()
class VRCameraMetrics {
  external factory VRCameraMetrics();

  external num get hResolution;
  external set hResolution(num v);
  external num get vResolution;
  external set vResolution(num v);
  external num get hScreenSize;
  external set hScreenSize(num v);
  external num get vScreenSize;
  external set vScreenSize(num v);
  external num get vScreenCenter;
  external set vScreenCenter(num v);
  external num get eyeToScreenDistance;
  external set eyeToScreenDistance(num v);
  external num get lensSeparationDistance;
  external set lensSeparationDistance(num v);
  external num get interpupillaryDistance;
  external set interpupillaryDistance(num v);
  external List<num> get distortionK;
  external set distortionK(List<num> v);
  external List<num> get chromaAbCorrection;
  external set chromaAbCorrection(List<num> v);
  external num get postProcessScaleFactor;
  external set postProcessScaleFactor(num v);
  external num get lensCenterOffset;
  external set lensCenterOffset(num v);
  external bool get compensateDistortion;
  external set compensateDistortion(bool v);
  external num get aspectRatio;
  external set aspectRatio(num v);
  external num get aspectRatioFov;
  external set aspectRatioFov(num v);
  external Matrix get leftHMatrix;
  external set leftHMatrix(Matrix v);
  external Matrix get rightHMatrix;
  external set rightHMatrix(Matrix v);
  external Matrix get leftPreViewMatrix;
  external set leftPreViewMatrix(Matrix v);
  external Matrix get rightPreViewMatrix;
  external set rightPreViewMatrix(Matrix v);
  external static VRCameraMetrics GetDefault();
}

@JS()
class Camera extends Node {
  external factory Camera([String name, Vector3 position, Scene scene]);

  external Vector3 get position;
  external set position(Vector3 v);

  external static num get PERSPECTIVE_CAMERA;
  external static num get ORTHOGRAPHIC_CAMERA;
  external static num get FOVMODE_VERTICAL_FIXED;
  external static num get FOVMODE_HORIZONTAL_FIXED;
  external static num get RIG_MODE_NONE;
  external static num get RIG_MODE_STEREOSCOPIC_ANAGLYPH;
  external static num get RIG_MODE_STEREOSCOPIC_SIDEBYSIDE_PARALLEL;
  external static num get RIG_MODE_STEREOSCOPIC_SIDEBYSIDE_CROSSEYED;
  external static num get RIG_MODE_STEREOSCOPIC_OVERUNDER;
  external static num get RIG_MODE_VR;
  external Vector3 get upVector;
  external set upVector(Vector3 v);
  external dynamic get orthoLeft;
  external set orthoLeft(dynamic v);
  external dynamic get orthoRight;
  external set orthoRight(dynamic v);
  external dynamic get orthoBottom;
  external set orthoBottom(dynamic v);
  external dynamic get orthoTop;
  external set orthoTop(dynamic v);
  external num get fov;
  external set fov(num v);
  external num get minZ;
  external set minZ(num v);
  external num get maxZ;
  external set maxZ(num v);
  external num get inertia;
  external set inertia(num v);
  external num get mode;
  external set mode(num v);
  external bool get isIntermediate;
  external set isIntermediate(bool v);
  external Viewport get viewport;
  external set viewport(Viewport v);
  external num get layerMask;
  external set layerMask(num v);
  external num get fovMode;
  external set fovMode(num v);
  external num get cameraRigMode;
  external set cameraRigMode(num v);
  external dynamic get _cameraRigParams;
  external set _cameraRigParams(dynamic v);
  external List<Camera> get _rigCameras;
  external set _rigCameras(List<Camera> v);

  external Matrix get _projectionMatrix;
  external set _projectionMatrix(Matrix v);

  external List<PostProcess> get _postProcesses;
  external set _postProcesses(List<PostProcess> v);
  external List<dynamic> get _postProcessesTakenIndices;
  external set _postProcessesTakenIndices(List<dynamic> v);
  external SmartList<Mesh> get _activeMeshes;
  external set _activeMeshes(SmartList<Mesh> v);

  external Vector3 get globalPosition;
  external set globalPosition(Vector3 v);
  external SmartList<Mesh> getActiveMeshes();
  external bool isActiveMesh(Mesh mesh);
  external void _initCache();
  external void _updateCache(bool ignoreParentClass);
  external void _updateFromScene();
  external bool _isSynchronized();
  external bool _isSynchronizedViewMatrix();
  external bool _isSynchronizedProjectionMatrix();
  external void attachControl(Element element);
  external void detachControl(Element element);
  external void _update();
  external void _checkInputs();
  external num attachPostProcess(PostProcess postProcess, num insertAt);
  external List<num> detachPostProcess(
      PostProcess postProcess, dynamic atIndices);
  external Matrix getWorldMatrix();
  external Matrix _getViewMatrix();
  external Matrix getViewMatrix(bool force);
  external Matrix _computeViewMatrix(bool force);
  external Matrix getProjectionMatrix(bool force);
  external void dispose();
  external void setCameraRigMode(num mode, dynamic rigParams);
  external void setCameraRigParameter(String name, dynamic value);
  external Camera createRigCamera(String name, num cameraIndex);
  external void _updateRigCameras();
  external dynamic serialize();
  external static Camera Parse(dynamic parsedCamera, Scene scene);
}

@JS()
class DeviceOrientationCamera extends FreeCamera {
  external factory DeviceOrientationCamera(
      [String name, Vector3 position, Scene scene]);

  external num get angularSensibility;
  external set angularSensibility(num v);
  external num get moveSensibility;
  external set moveSensibility(num v);
  external void attachControl(CanvasElement canvas, bool noPreventDefault);
  external void detachControl(CanvasElement canvas);
  external void _checkInputs();
}

@JS()
class FollowCamera extends TargetCamera {
  external factory FollowCamera([String name, Vector3 position, Scene scene]);

  external num get radius;
  external set radius(num v);
  external num get rotationOffset;
  external set rotationOffset(num v);
  external num get heightOffset;
  external set heightOffset(num v);
  external num get cameraAcceleration;
  external set cameraAcceleration(num v);
  external num get maxCameraSpeed;
  external set maxCameraSpeed(num v);
  external AbstractMesh get target;
  external set target(AbstractMesh v);
  external void _checkInputs();
  external dynamic serialize();
}

@JS()
class ArcFollowCamera extends TargetCamera {
  external factory ArcFollowCamera(
      [String name,
      num alpha,
      num beta,
      num radius,
      AbstractMesh target,
      Scene scene]);

  external num get alpha;
  external set alpha(num v);
  external num get beta;
  external set beta(num v);
  external num get radius;
  external set radius(num v);
  external AbstractMesh get target;
  external set target(AbstractMesh v);
  external void _checkInputs();
  external dynamic serialize();
}

@JS()
class FreeCamera extends TargetCamera {
  external factory FreeCamera([String name, Vector3 position, Scene scene]);

  external Vector3 get ellipsoid;
  external set ellipsoid(Vector3 v);
  external List<num> get keysUp;
  external set keysUp(List<num> v);
  external List<num> get keysDown;
  external set keysDown(List<num> v);
  external List<num> get keysLeft;
  external set keysLeft(List<num> v);
  external List<num> get keysRight;
  external set keysRight(List<num> v);
  external bool get checkCollisions;
  external set checkCollisions(bool v);
  external bool get applyGravity;
  external set applyGravity(bool v);
  external num get angularSensibility;
  external set angularSensibility(num v);
  external void onCollide(AbstractMesh collidedMesh);

  external String get _waitingLockedTargetId;
  external set _waitingLockedTargetId(String v);
  external void _onLostFocus(FocusEvent e);
  external void attachControl(Element element, bool noPreventDefault);
  external void detachControl(Element element);
  external void _collideWithWorld(Vector3 velocity);
  external void _checkInputs();
  external bool _decideIfNeedsToMove();
  external void _updatePosition();
  external dynamic serialize();
}

@JS()
class GamepadCamera extends UniversalCamera {
  external factory GamepadCamera([String name, Vector3 position, Scene scene]);
}

@JS()
class AnaglyphFreeCamera extends FreeCamera {
  external factory AnaglyphFreeCamera(
      [String name, Vector3 position, num interaxialDistance, Scene scene]);

  external num get interaxialDistance;
  external set interaxialDistance(num v);
}

@JS()
class AnaglyphArcRotateCamera extends ArcRotateCamera {
  external factory AnaglyphArcRotateCamera(
      [String name,
      num alpha,
      num beta,
      num radius,
      dynamic target,
      num interaxialDistance,
      Scene scene]);
}

@JS()
class AnaglyphGamepadCamera extends GamepadCamera {
  external factory AnaglyphGamepadCamera(
      [String name, Vector3 position, num interaxialDistance, Scene scene]);
}

@JS()
class StereoscopicFreeCamera extends FreeCamera {
  external factory StereoscopicFreeCamera(
      [String name,
      Vector3 position,
      num interaxialDistance,
      bool isSideBySide,
      Scene scene]);
}

@JS()
class StereoscopicArcRotateCamera extends ArcRotateCamera {
  external factory StereoscopicArcRotateCamera(
      [String name,
      num alpha,
      num beta,
      num radius,
      dynamic target,
      num interaxialDistance,
      bool isSideBySide,
      Scene scene]);
}

@JS()
class StereoscopicGamepadCamera extends GamepadCamera {
  external factory StereoscopicGamepadCamera(
      [String name,
      Vector3 position,
      num interaxialDistance,
      bool isSideBySide,
      Scene scene]);
}

@JS()
class TargetCamera extends Camera {
  external factory TargetCamera([String name, Vector3 position, Scene scene]);

  external Vector3 get cameraDirection;
  external set cameraDirection(Vector3 v);
  external Vector2 get cameraRotation;
  external set cameraRotation(Vector2 v);
  external Vector3 get rotation;
  external set rotation(Vector3 v);
  external num get speed;
  external set speed(num v);
  external bool get noRotationConstraint;
  external set noRotationConstraint(bool v);
  external dynamic get lockedTarget;
  external set lockedTarget(dynamic v);
  external Vector3 get _currentTarget;
  external set _currentTarget(Vector3 v);
  external Matrix get _viewMatrix;
  external set _viewMatrix(Matrix v);
  external Matrix get _camMatrix;
  external set _camMatrix(Matrix v);
  external Matrix get _cameraTransformMatrix;
  external set _cameraTransformMatrix(Matrix v);
  external Matrix get _cameraRotationMatrix;
  external set _cameraRotationMatrix(Matrix v);

  external Vector3 get _referencePoint;
  external set _referencePoint(Vector3 v);
  external Vector3 get _transformedReferencePoint;
  external set _transformedReferencePoint(Vector3 v);
  external Matrix get _lookAtTemp;
  external set _lookAtTemp(Matrix v);
  external Matrix get _tempMatrix;
  external set _tempMatrix(Matrix v);
  external void _reset();
  external String get _waitingLockedTargetId;
  external set _waitingLockedTargetId(String v);
  external Vector3 getFrontPosition(num distance);
  external Vector3 _getLockedTargetPosition();
  external void _initCache();
  external void _updateCache(bool ignoreParentClass);
  external bool _isSynchronizedViewMatrix();
  external num _computeLocalCameraSpeed();
  external void setTarget(Vector3 target);
  external Vector3 getTarget();
  external bool _decideIfNeedsToMove();
  external void _updatePosition();
  external void _checkInputs();
  external Matrix _getViewMatrix();
  external Matrix _getVRViewMatrix();
  external Camera createRigCamera(String name, num cameraIndex);
  external void _updateRigCameras();
  external dynamic serialize();
}

@JS()
class TouchCamera extends FreeCamera {
  external factory TouchCamera([String name, Vector3 position, Scene scene]);

  external num get touchAngularSensibility;
  external set touchAngularSensibility(num v);
  external num get touchMoveSensibility;
  external set touchMoveSensibility(num v);
  external void _onLostFocus(FocusEvent e);
  external void attachControl(CanvasElement canvas, bool noPreventDefault);
  external void detachControl(CanvasElement canvas);
  external void _checkInputs();
}

@JS()
class UniversalCamera extends TouchCamera {
  external factory UniversalCamera(
      [String name, Vector3 position, Scene scene]);

  external Gamepad get gamepad;
  external set gamepad(Gamepad v);

  external num get gamepadAngularSensibility;
  external set gamepadAngularSensibility(num v);
  external num get gamepadMoveSensibility;
  external set gamepadMoveSensibility(num v);
  external void attachControl(CanvasElement canvas, bool noPreventDefault);
  external void detachControl(CanvasElement canvas);
  external void _checkInputs();
  external void dispose();
}

@JS()
class VirtualJoysticksCamera extends FreeCamera {
  external factory VirtualJoysticksCamera(
      [String name, Vector3 position, Scene scene]);

  external VirtualJoystick getLeftJoystick();
  external VirtualJoystick getRightJoystick();
  external void _checkInputs();
  external void dispose();
}

@JS()
class Collider {
  external factory Collider();

  external Vector3 get radius;
  external set radius(Vector3 v);
  external num get retry;
  external set retry(num v);
  external Vector3 get velocity;
  external set velocity(Vector3 v);
  external Vector3 get basePoint;
  external set basePoint(Vector3 v);
  external num get epsilon;
  external set epsilon(num v);
  external bool get collisionFound;
  external set collisionFound(bool v);
  external num get velocityWorldLength;
  external set velocityWorldLength(num v);
  external Vector3 get basePointWorld;
  external set basePointWorld(Vector3 v);
  external Vector3 get velocityWorld;
  external set velocityWorld(Vector3 v);
  external Vector3 get normalizedVelocity;
  external set normalizedVelocity(Vector3 v);
  external Vector3 get initialVelocity;
  external set initialVelocity(Vector3 v);
  external Vector3 get initialPosition;
  external set initialPosition(Vector3 v);
  external num get nearestDistance;
  external set nearestDistance(num v);
  external Vector3 get intersectionPoint;
  external set intersectionPoint(Vector3 v);
  external AbstractMesh get collidedMesh;
  external set collidedMesh(AbstractMesh v);
  external void _initialize(Vector3 source, Vector3 dir, num e);
  external bool _checkPointInTriangle(
      Vector3 point, Vector3 pa, Vector3 pb, Vector3 pc, Vector3 n);
  external bool _canDoCollision(
      Vector3 sphereCenter, num sphereRadius, Vector3 vecMin, Vector3 vecMax);
  external void _testTriangle(num faceIndex, List<Plane> trianglePlaneArray,
                              Vector3 p1, Vector3 p2, Vector3 p3, bool hasMaterial);
  external void _collide(
      List<Plane> trianglePlaneArray,
      List<Vector3> pts,
      dynamic indices,
      num indexStart,
      num indexEnd,
      num decal,
      bool hasMaterial);
  external void _getResponse(Vector3 pos, Vector3 vel);
}

@JS()
class ICollisionCoordinator {
  external factory ICollisionCoordinator();

  external void getNewPosition(
      Vector3 position,
      Vector3 velocity,
      Collider collider,
      num maximumRetry,
      AbstractMesh excludedMesh,
      VoidFunc3<num, Vector3, AbstractMesh> onNewPosition,
      num collisionIndex);
  external void init(Scene scene);
  external void destroy();
  external dynamic onMeshAdded(AbstractMesh mesh);
  external dynamic onMeshUpdated(AbstractMesh mesh);
  external dynamic onMeshRemoved(AbstractMesh mesh);
  external dynamic onGeometryAdded(Geometry geometry);
  external dynamic onGeometryUpdated(Geometry geometry);
  external dynamic onGeometryDeleted(Geometry geometry);
}

@JS()
class SerializedMesh {
  external factory SerializedMesh();

  external String get id;
  external set id(String v);
  external String get name;
  external set name(String v);
  external num get uniqueId;
  external set uniqueId(num v);
  external String get geometryId;
  external set geometryId(String v);
  external List<num> get sphereCenter;
  external set sphereCenter(List<num> v);
  external num get sphereRadius;
  external set sphereRadius(num v);
  external List<num> get boxMinimum;
  external set boxMinimum(List<num> v);
  external List<num> get boxMaximum;
  external set boxMaximum(List<num> v);
  external dynamic get worldMatrixFromCache;
  external set worldMatrixFromCache(dynamic v);
  external List<SerializedSubMesh> get subMeshes;
  external set subMeshes(List<SerializedSubMesh> v);
  external bool get checkCollisions;
  external set checkCollisions(bool v);
}

@JS()
class SerializedSubMesh {
  external factory SerializedSubMesh();

  external num get position;
  external set position(num v);
  external num get verticesStart;
  external set verticesStart(num v);
  external num get verticesCount;
  external set verticesCount(num v);
  external num get indexStart;
  external set indexStart(num v);
  external num get indexCount;
  external set indexCount(num v);
  external bool get hasMaterial;
  external set hasMaterial(bool v);
  external List<num> get sphereCenter;
  external set sphereCenter(List<num> v);
  external num get sphereRadius;
  external set sphereRadius(num v);
  external List<num> get boxMinimum;
  external set boxMinimum(List<num> v);
  external List<num> get boxMaximum;
  external set boxMaximum(List<num> v);
}

@JS()
class SerializedGeometry {
  external factory SerializedGeometry();

  external String get id;
  external set id(String v);
  external List get positions;
  external set positions(List v);
  external Int32Array get indices;
  external set indices(Int32Array v);
  external List get normals;
  external set normals(List v);
}

@JS()
class BabylonMessage {
  external factory BabylonMessage();

  external WorkerTaskType get taskType;
  external set taskType(WorkerTaskType v);
  external dynamic get payload;
  external set payload(dynamic v);
}

@JS()
class SerializedColliderToWorker {
  external factory SerializedColliderToWorker();

  external List<num> get position;
  external set position(List<num> v);
  external List<num> get velocity;
  external set velocity(List<num> v);
  external List<num> get radius;
  external set radius(List<num> v);
}

enum WorkerTaskType { INIT, UPDATE, COLLIDE, }

@JS()
class WorkerReply {
  external factory WorkerReply();

  external WorkerReplyType get error;
  external set error(WorkerReplyType v);
  external WorkerTaskType get taskType;
  external set taskType(WorkerTaskType v);
  external dynamic get payload;
  external set payload(dynamic v);
}

@JS()
class CollisionReplyPayload {
  external factory CollisionReplyPayload();

  external List<num> get newPosition;
  external set newPosition(List<num> v);
  external num get collisionId;
  external set collisionId(num v);
  external num get collidedMeshUniqueId;
  external set collidedMeshUniqueId(num v);
}

@JS()
class InitPayload {
  external factory InitPayload();
}

@JS()
class CollidePayload {
  external factory CollidePayload();

  external num get collisionId;
  external set collisionId(num v);
  external SerializedColliderToWorker get collider;
  external set collider(SerializedColliderToWorker v);
  external num get maximumRetry;
  external set maximumRetry(num v);
  external num get excludedMeshUniqueId;
  external set excludedMeshUniqueId(num v);
}

@JS()
class UpdatePayload {
  external factory UpdatePayload();

  external dynamic get updatedMeshes;
  external set updatedMeshes(dynamic v);
  external dynamic get updatedGeometries;
  external set updatedGeometries(dynamic v);
  external List<num> get removedMeshes;
  external set removedMeshes(List<num> v);
  external List<String> get removedGeometries;
  external set removedGeometries(List<String> v);
}

enum WorkerReplyType { SUCCESS, UNKNOWN_ERROR, }

@JS()
class CollisionCoordinatorWorker {
  external factory CollisionCoordinatorWorker();

  external static SerializedMesh SerializeMesh(AbstractMesh mesh);
  external static SerializedGeometry SerializeGeometry(Geometry geometry);
  external void getNewPosition(
      Vector3 position,
      Vector3 velocity,
      Collider collider,
      num maximumRetry,
      AbstractMesh excludedMesh,
      VoidFunc3<num, Vector3, AbstractMesh> onNewPosition,
      num collisionIndex);
  external void init(Scene scene);
  external void destroy();
  external void onMeshAdded(AbstractMesh mesh);
  external void onMeshUpdated(AbstractMesh mesh);
  external void onMeshRemoved(AbstractMesh mesh);
  external void onGeometryAdded(Geometry geometry);
  external void onGeometryUpdated(Geometry geometry);
  external void onGeometryDeleted(Geometry geometry);
}

@JS()
class CollisionCoordinatorLegacy {
  external factory CollisionCoordinatorLegacy();

  external void getNewPosition(
      Vector3 position,
      Vector3 velocity,
      Collider collider,
      num maximumRetry,
      AbstractMesh excludedMesh,
      VoidFunc3<num, Vector3, AbstractMesh> onNewPosition,
      num collisionIndex);
  external void init(Scene scene);
  external void destroy();
  external void onMeshAdded(AbstractMesh mesh);
  external void onMeshUpdated(AbstractMesh mesh);
  external void onMeshRemoved(AbstractMesh mesh);
  external void onGeometryAdded(Geometry geometry);
  external void onGeometryUpdated(Geometry geometry);
  external void onGeometryDeleted(Geometry geometry);
}

@JS()
class CollisionCache {
  external factory CollisionCache();

  external Func0<dynamic> get getMeshes;
  external set getMeshes(Func0<dynamic> v);
  external dynamic getGeometries();
  external SerializedMesh getMesh(dynamic id);
  external void addMesh(SerializedMesh mesh);
  external void removeMesh(num uniqueId);
  external SerializedGeometry getGeometry(String id);
  external void addGeometry(SerializedGeometry geometry);
  external void removeGeometry(String id);
}

@JS()
class CollideWorker {
  external factory CollideWorker(
      [Collider collider,
      CollisionCache _collisionCache,
      Vector3 finalPosition]);

  external Collider get collider;
  external set collider(Collider v);
  external void collideWithWorld(Vector3 position, Vector3 velocity,
                                 num maximumRetry, num excludedMeshUniqueId);
}

@JS()
class ICollisionDetector {
  external factory ICollisionDetector();

  external void onInit(InitPayload payload);
  external void onUpdate(UpdatePayload payload);
  external void onCollision(CollidePayload payload);
}

@JS()
class CollisionDetectorTransferable {
  external factory CollisionDetectorTransferable();

  external void onInit(InitPayload payload);
  external void onUpdate(UpdatePayload payload);
  external void onCollision(CollidePayload payload);
}

@JS()
class IntersectionInfo {
  external factory IntersectionInfo([num bu, num bv, num distance]);

  external num get bu;
  external set bu(num v);
  external num get bv;
  external set bv(num v);
  external num get distance;
  external set distance(num v);
  external num get faceId;
  external set faceId(num v);
  external num get subMeshId;
  external set subMeshId(num v);
}

@JS()
class PickingInfo {
  external factory PickingInfo();

  external bool get hit;
  external set hit(bool v);
  external num get distance;
  external set distance(num v);
  external Vector3 get pickedPoint;
  external set pickedPoint(Vector3 v);
  external AbstractMesh get pickedMesh;
  external set pickedMesh(AbstractMesh v);
  external num get bu;
  external set bu(num v);
  external num get bv;
  external set bv(num v);
  external num get faceId;
  external set faceId(num v);
  external num get subMeshId;
  external set subMeshId(num v);
  external Sprite get pickedSprite;
  external set pickedSprite(Sprite v);
  external Vector3 getNormal(bool useWorldCoordinates, bool useVerticesNormals);
  external Vector2 getTextureCoordinates();
}

@JS()
class DebugLayer {
  external factory DebugLayer([Scene scene]);

  external void _syncPositions();
  external bool shouldDisplayLabel(Node node);
  external bool shouldDisplayAxis(Mesh mesh);
  external num get axisRatio;
  external set axisRatio(num v);
  external String get accentColor;
  external set accentColor(String v);
  external String customStatsFunction();
  external bool isVisible();
  external void hide();
  external void show(bool showUI, Camera camera, Element rootElement);
}

@JS()
class BoundingBox {
  external factory BoundingBox([Vector3 minimum, Vector3 maximum]);

  external Vector3 get minimum;
  external set minimum(Vector3 v);
  external Vector3 get maximum;
  external set maximum(Vector3 v);
  external List<Vector3> get vectors;
  external set vectors(List<Vector3> v);
  external Vector3 get center;
  external set center(Vector3 v);
  external Vector3 get extendSize;
  external set extendSize(Vector3 v);
  external List<Vector3> get directions;
  external set directions(List<Vector3> v);
  external List<Vector3> get vectorsWorld;
  external set vectorsWorld(List<Vector3> v);
  external Vector3 get minimumWorld;
  external set minimumWorld(Vector3 v);
  external Vector3 get maximumWorld;
  external set maximumWorld(Vector3 v);
  external Matrix getWorldMatrix();
  external void _update(Matrix world);
  external bool isInFrustum(List<Plane> frustumPlanes);
  external bool isCompletelyInFrustum(List<Plane> frustumPlanes);
  external bool intersectsPoint(Vector3 point);
  external bool intersectsSphere(BoundingSphere sphere);
  external bool intersectsMinMax(Vector3 min, Vector3 max);
  external static bool Intersects(BoundingBox box0, BoundingBox box1);
  external static bool IntersectsSphere(Vector3 minPoint, Vector3 maxPoint,
                                        Vector3 sphereCenter, num sphereRadius);
  external static bool IsCompletelyInFrustum(
      List<Vector3> boundingVectors, List<Plane> frustumPlanes);
  external static bool IsInFrustum(
      List<Vector3> boundingVectors, List<Plane> frustumPlanes);
}

@JS()
class BoundingInfo {
  external factory BoundingInfo([Vector3 minimum, Vector3 maximum]);

  external Vector3 get minimum;
  external set minimum(Vector3 v);
  external Vector3 get maximum;
  external set maximum(Vector3 v);
  external BoundingBox get boundingBox;
  external set boundingBox(BoundingBox v);
  external BoundingSphere get boundingSphere;
  external set boundingSphere(BoundingSphere v);

  external bool get isLocked;
  external set isLocked(bool v);
  external void update(Matrix world);
  external bool isInFrustum(List<Plane> frustumPlanes);
  external bool isCompletelyInFrustum(List<Plane> frustumPlanes);
  external bool _checkCollision(Collider collider);
  external bool intersectsPoint(Vector3 point);
  external bool intersects(BoundingInfo boundingInfo, bool precise);
}

@JS()
class BoundingSphere {
  external factory BoundingSphere([Vector3 minimum, Vector3 maximum]);

  external Vector3 get minimum;
  external set minimum(Vector3 v);
  external Vector3 get maximum;
  external set maximum(Vector3 v);
  external Vector3 get center;
  external set center(Vector3 v);
  external num get radius;
  external set radius(num v);
  external Vector3 get centerWorld;
  external set centerWorld(Vector3 v);
  external num get radiusWorld;
  external set radiusWorld(num v);
  external void _update(Matrix world);
  external bool isInFrustum(List<Plane> frustumPlanes);
  external bool intersectsPoint(Vector3 point);
  external static bool Intersects(
      BoundingSphere sphere0, BoundingSphere sphere1);
}

@JS()
class Layer {
  external factory Layer(
      [String name,
      String imgUrl,
      Scene scene,
      bool isBackground,
      Color4 color]);

  external String get name;
  external set name(String v);
  external Texture get texture;
  external set texture(Texture v);
  external bool get isBackground;
  external set isBackground(bool v);
  external Color4 get color;
  external set color(Color4 v);
  external Vector2 get scale;
  external set scale(Vector2 v);
  external Vector2 get offset;
  external set offset(Vector2 v);
  external void onDispose();
  external num get alphaBlendingMode;
  external set alphaBlendingMode(num v);
  external void render();
  external void dispose();
}

@JS()
class LensFlare {
  external factory LensFlare(
      [num size,
      num position,
      dynamic color,
      String imgUrl,
      LensFlareSystem system]);

  external num get size;
  external set size(num v);
  external num get position;
  external set position(num v);
  external Color3 get color;
  external set color(Color3 v);
  external Texture get texture;
  external set texture(Texture v);
  external void dispose();
}

@JS()
class LensFlareSystem {
  external factory LensFlareSystem([String name, dynamic emitter, Scene scene]);

  external String get name;
  external set name(String v);
  external List<LensFlare> get lensFlares;
  external set lensFlares(List<LensFlare> v);
  external num get borderLimit;
  external set borderLimit(num v);
  external bool meshesSelectionPredicate(Mesh mesh);
  external num get layerMask;
  external set layerMask(num v);

  external bool get isEnabled;
  external set isEnabled(bool v);
  external Scene getScene();
  external dynamic getEmitter();
  external void setEmitter(dynamic newEmitter);
  external Vector3 getEmitterPosition();
  external bool computeEffectivePosition(Viewport globalViewport);
  external bool _isVisible();
  external bool render();
  external void dispose();
  external static LensFlareSystem Parse(
      dynamic parsedLensFlareSystem, Scene scene, String rootUrl);
  external dynamic serialize();
}

@JS()
class DirectionalLight extends Light {
  external factory DirectionalLight(
      [String name, Vector3 direction, Scene scene]);

  external Vector3 get direction;
  external set direction(Vector3 v);
  external Vector3 get position;
  external set position(Vector3 v);

  external Vector3 get transformedPosition;
  external set transformedPosition(Vector3 v);

  external num get shadowOrthoScale;
  external set shadowOrthoScale(num v);
  external bool get autoUpdateExtends;
  external set autoUpdateExtends(bool v);
  external Vector3 getAbsolutePosition();
  external Vector3 setDirectionToTarget(Vector3 target);
  external void setShadowProjectionMatrix(
      Matrix matrix, Matrix viewMatrix, List<AbstractMesh> renderList);
  external bool supportsVSM();
  external bool needRefreshPerFrame();
  external bool needCube();
  external Vector3 getShadowDirection(num faceIndex);
  external bool computeTransformedPosition();
  external void transferToEffect(Effect effect, String directionUniformName);
  external Matrix _getWorldMatrix();
  external dynamic serialize();
}

@JS()
class HemisphericLight extends Light {
  external factory HemisphericLight(
      [String name, Vector3 direction, Scene scene]);

  external Vector3 get direction;
  external set direction(Vector3 v);
  external Color3 get groundColor;
  external set groundColor(Color3 v);
  external Vector3 setDirectionToTarget(Vector3 target);
  external ShadowGenerator getShadowGenerator();
  external void transferToEffect(Effect effect, String directionUniformName,
                                 String groundColorUniformName);
  external Matrix _getWorldMatrix();
  external dynamic serialize();
}

@JS()
class IShadowLight {
  external factory IShadowLight();

  external String get id;
  external set id(String v);
  external Vector3 get position;
  external set position(Vector3 v);
  external Vector3 get transformedPosition;
  external set transformedPosition(Vector3 v);
  external String get name;
  external set name(String v);
  external bool computeTransformedPosition();
  external Scene getScene();
  external void setShadowProjectionMatrix(
      Matrix matrix, Matrix viewMatrix, List<AbstractMesh> renderList);
  external bool supportsVSM();
  external bool needRefreshPerFrame();
  external bool needCube();
  external Vector3 getShadowDirection(num faceIndex);
  external ShadowGenerator get _shadowGenerator;
  external set _shadowGenerator(ShadowGenerator v);
}

@JS()
class Light extends Node {
  external factory Light([String name, Scene scene]);

  external Color3 get diffuse;
  external set diffuse(Color3 v);
  external Color3 get specular;
  external set specular(Color3 v);
  external num get intensity;
  external set intensity(num v);
  external num get range;
  external set range(num v);
  external num get includeOnlyWithLayerMask;
  external set includeOnlyWithLayerMask(num v);
  external List<AbstractMesh> get includedOnlyMeshes;
  external set includedOnlyMeshes(List<AbstractMesh> v);
  external List<AbstractMesh> get excludedMeshes;
  external set excludedMeshes(List<AbstractMesh> v);
  external num get excludeWithLayerMask;
  external set excludeWithLayerMask(num v);
  external ShadowGenerator get _shadowGenerator;
  external set _shadowGenerator(ShadowGenerator v);

  external List<String> get _excludedMeshesIds;
  external set _excludedMeshesIds(List<String> v);
  external List<String> get _includedOnlyMeshesIds;
  external set _includedOnlyMeshesIds(List<String> v);
  external ShadowGenerator getShadowGenerator();
  external Vector3 getAbsolutePosition();
  external void transferToEffect(
      Effect effect, String uniformName0, String uniformName1);
  external Matrix _getWorldMatrix();
  external bool canAffectMesh(AbstractMesh mesh);
  external Matrix getWorldMatrix();
  external void dispose();
  external dynamic serialize();
  external static Light Parse(dynamic parsedLight, Scene scene);
}

@JS()
class PointLight extends Light {
  external factory PointLight([String name, Vector3 position, Scene scene]);

  external Vector3 get position;
  external set position(Vector3 v);

  external Vector3 get transformedPosition;
  external set transformedPosition(Vector3 v);
  external Vector3 getAbsolutePosition();
  external bool computeTransformedPosition();
  external void transferToEffect(Effect effect, String positionUniformName);
  external bool needCube();
  external bool supportsVSM();
  external bool needRefreshPerFrame();
  external Vector3 getShadowDirection(num faceIndex);
  external void setShadowProjectionMatrix(
      Matrix matrix, Matrix viewMatrix, List<AbstractMesh> renderList);
  external Matrix _getWorldMatrix();
  external dynamic serialize();
}

@JS()
class SpotLight extends Light {
  external factory SpotLight(
      [String name,
      Vector3 position,
      Vector3 direction,
      num angle,
      num exponent,
      Scene scene]);

  external Vector3 get position;
  external set position(Vector3 v);
  external Vector3 get direction;
  external set direction(Vector3 v);
  external num get angle;
  external set angle(num v);
  external num get exponent;
  external set exponent(num v);
  external Vector3 get transformedPosition;
  external set transformedPosition(Vector3 v);
  external Vector3 getAbsolutePosition();
  external void setShadowProjectionMatrix(
      Matrix matrix, Matrix viewMatrix, List<AbstractMesh> renderList);
  external bool needCube();
  external bool supportsVSM();
  external bool needRefreshPerFrame();
  external Vector3 getShadowDirection(num faceIndex);
  external Vector3 setDirectionToTarget(Vector3 target);
  external bool computeTransformedPosition();
  external void transferToEffect(
      Effect effect, String positionUniformName, String directionUniformName);
  external Matrix _getWorldMatrix();
  external dynamic serialize();
}

@JS()
class ISceneLoaderPlugin {
  external factory ISceneLoaderPlugin();

  external String get extensions;
  external set extensions(String v);
  external bool importMesh(
      dynamic meshesNames,
      Scene scene,
      dynamic data,
      String rootUrl,
      List<AbstractMesh> meshes,
      List<ParticleSystem> particleSystems,
      List<Skeleton> skeletons);
  external bool load(Scene scene, String data, String rootUrl);
}

@JS()
class SceneLoader {
  external factory SceneLoader();

  external static bool get ForceFullSceneLoadingForIncremental;
  external static bool get ShowLoadingScreen;

  external static void RegisterPlugin(ISceneLoaderPlugin plugin);
  external static void ImportMesh(
      dynamic meshesNames,
      String rootUrl,
      String sceneFilename,
      Scene scene,
      VoidFunc3<List<AbstractMesh>, List<ParticleSystem>,
          List<Skeleton>> onsuccess,
      VoidFunc0 progressCallBack,
      VoidFunc2<Scene, dynamic> onerror);

  external static void Load(
      String rootUrl,
      dynamic sceneFilename,
      Engine engine,
      VoidFunc1<Scene> onsuccess,
      dynamic progressCallBack,
      VoidFunc1<Scene> onerror);

  external static void Append(
      String rootUrl,
      dynamic sceneFilename,
      Scene scene,
      VoidFunc1<Scene> onsuccess,
      dynamic progressCallBack,
      VoidFunc1<Scene> onerror);
}

@JS()
class SIMDVector3 {
  external factory SIMDVector3();

  external static void TransformCoordinatesToRefSIMD(
      Vector3 vector, Matrix transformation, Vector3 result);
  external static void TransformCoordinatesFromFloatsToRefSIMD(
      num x, num y, num z, Matrix transformation, Vector3 result);
}

@JS()
class SIMDMatrix {
  external factory SIMDMatrix();

  external void multiplyToArraySIMD(Matrix other, Matrix result, num offset);
  external Matrix invertToRefSIMD(Matrix other);
  external static void LookAtLHToRefSIMD(
      Vector3 eyeRef, Vector3 targetRef, Vector3 upRef, Matrix result);
}

@JS()
class SIMDHelper {
  external factory SIMDHelper();

  external static bool get IsEnabled;
  external static void DisableSIMD();
  external static void EnableSIMD();
}

@JS()
class Color3 {
  external factory Color3([num r, num g, num b]);

  external num get r;
  external set r(num v);
  external num get g;
  external set g(num v);
  external num get b;
  external set b(num v);
  external String toString();
  external Color3 toArray(List<num> array, num index);
  external Color4 toColor4(num alpha);
  external List<num> asArray();
  external num toLuminance();
  external Color3 multiply(Color3 otherColor);
  external Color3 multiplyToRef(Color3 otherColor, Color3 result);
  external bool equals(Color3 otherColor);
  external bool equalsFloats(num r, num g, num b);
  external Color3 scale(num scale);
  external Color3 scaleToRef(num scale, Color3 result);
  external Color3 add(Color3 otherColor);
  external Color3 addToRef(Color3 otherColor, Color3 result);
  external Color3 subtract(Color3 otherColor);
  external Color3 subtractToRef(Color3 otherColor, Color3 result);
  external Color3 clone();
  external Color3 copyFrom(Color3 source);
  external Color3 copyFromFloats(num r, num g, num b);
  external String toHexString();
  external Color3 toLinearSpace();
  external Color3 toLinearSpaceToRef(Color3 convertedColor);
  external Color3 toGammaSpace();
  external Color3 toGammaSpaceToRef(Color3 convertedColor);
  external static Color3 FromHexString(String hex);
  external static Color3 FromArray(List<num> array, num offset);
  external static Color3 FromInts(num r, num g, num b);
  external static Color3 Lerp(Color3 start, Color3 end, num amount);
  external static Color3 Red();
  external static Color3 Green();
  external static Color3 Blue();
  external static Color3 Black();
  external static Color3 White();
  external static Color3 Purple();
  external static Color3 Magenta();
  external static Color3 Yellow();
  external static Color3 Gray();
}

@JS()
class Color4 {
  external factory Color4([num r, num g, num b, num a]);

  external num get r;
  external set r(num v);
  external num get g;
  external set g(num v);
  external num get b;
  external set b(num v);
  external num get a;
  external set a(num v);
  external Color4 addInPlace(dynamic right);
  external List<num> asArray();
  external Color4 toArray(List<num> array, num index);
  external Color4 add(Color4 right);
  external Color4 subtract(Color4 right);
  external Color4 subtractToRef(Color4 right, Color4 result);
  external Color4 scale(num scale);
  external Color4 scaleToRef(num scale, Color4 result);
  external String toString();
  external Color4 clone();
  external Color4 copyFrom(Color4 source);
  external String toHexString();
  external static Color4 FromHexString(String hex);
  external static Color4 Lerp(Color4 left, Color4 right, num amount);
  external static void LerpToRef(
      Color4 left, Color4 right, num amount, Color4 result);
  external static Color4 FromArray(List<num> array, num offset);
  external static Color4 FromInts(num r, num g, num b, num a);
  external static List<num> CheckColors4(List<num> colors, num count);
}

@JS()
class Vector2 {
  external factory Vector2([num x, num y]);

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external String toString();
  external Vector2 toArray(List<num> array, num index);
  external List<num> asArray();
  external Vector2 copyFrom(Vector2 source);
  external Vector2 copyFromFloats(num x, num y);
  external Vector2 add(Vector2 otherVector);
  external Vector2 addVector3(Vector3 otherVector);
  external Vector2 subtract(Vector2 otherVector);
  external Vector2 subtractInPlace(Vector2 otherVector);
  external Vector2 multiplyInPlace(Vector2 otherVector);
  external Vector2 multiply(Vector2 otherVector);
  external Vector2 multiplyToRef(Vector2 otherVector, Vector2 result);
  external Vector2 multiplyByFloats(num x, num y);
  external Vector2 divide(Vector2 otherVector);
  external Vector2 divideToRef(Vector2 otherVector, Vector2 result);
  external Vector2 negate();
  external Vector2 scaleInPlace(num scale);
  external Vector2 scale(num scale);
  external bool equals(Vector2 otherVector);
  external bool equalsWithEpsilon(Vector2 otherVector, num epsilon);
  external num length();
  external num lengthSquared();
  external Vector2 normalize();
  external Vector2 clone();
  external static Vector2 Zero();
  external static Vector2 FromArray(dynamic array, num offset);
  external static void FromArrayToRef(
      dynamic array, num offset, Vector2 result);
  external static Vector2 CatmullRom(Vector2 value1, Vector2 value2,
                                     Vector2 value3, Vector2 value4, num amount);
  external static Vector2 Clamp(Vector2 value, Vector2 min, Vector2 max);
  external static Vector2 Hermite(Vector2 value1, Vector2 tangent1,
                                  Vector2 value2, Vector2 tangent2, num amount);
  external static Vector2 Lerp(Vector2 start, Vector2 end, num amount);
  external static num Dot(Vector2 left, Vector2 right);
  external static Vector2 Normalize(Vector2 vector);
  external static Vector2 Minimize(Vector2 left, Vector2 right);
  external static Vector2 Maximize(Vector2 left, Vector2 right);
  external static Vector2 Transform(Vector2 vector, Matrix transformation);
  external static num Distance(Vector2 value1, Vector2 value2);
  external static num DistanceSquared(Vector2 value1, Vector2 value2);
}

@JS()
class Vector3 {
  external factory Vector3([num x, num y, num z]);

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
  external String toString();
  external List<num> asArray();
  external Vector3 toArray(dynamic array, num index);
  external Quaternion toQuaternion();
  external Vector3 addInPlace(Vector3 otherVector);
  external Vector3 add(Vector3 otherVector);
  external Vector3 addToRef(Vector3 otherVector, Vector3 result);
  external Vector3 subtractInPlace(Vector3 otherVector);
  external Vector3 subtract(Vector3 otherVector);
  external Vector3 subtractToRef(Vector3 otherVector, Vector3 result);
  external Vector3 subtractFromFloats(num x, num y, num z);
  external Vector3 subtractFromFloatsToRef(num x, num y, num z, Vector3 result);
  external Vector3 negate();
  external Vector3 scaleInPlace(num scale);
  external Vector3 scale(num scale);
  external void scaleToRef(num scale, Vector3 result);
  external bool equals(Vector3 otherVector);
  external bool equalsWithEpsilon(Vector3 otherVector, num epsilon);
  external bool equalsToFloats(num x, num y, num z);
  external Vector3 multiplyInPlace(Vector3 otherVector);
  external Vector3 multiply(Vector3 otherVector);
  external Vector3 multiplyToRef(Vector3 otherVector, Vector3 result);
  external Vector3 multiplyByFloats(num x, num y, num z);
  external Vector3 divide(Vector3 otherVector);
  external Vector3 divideToRef(Vector3 otherVector, Vector3 result);
  external Vector3 MinimizeInPlace(Vector3 other);
  external Vector3 MaximizeInPlace(Vector3 other);
  external num length();
  external num lengthSquared();
  external Vector3 normalize();
  external Vector3 clone();
  external Vector3 copyFrom(Vector3 source);
  external Vector3 copyFromFloats(num x, num y, num z);
  external static num GetClipFactor(
      Vector3 vector0, Vector3 vector1, Vector3 axis, dynamic size);
  external static Vector3 FromArray(dynamic array, num offset);
  external static Vector3 FromFloatArray(List array, num offset);
  external static void FromArrayToRef(
      dynamic array, num offset, Vector3 result);
  external static void FromFloatArrayToRef(
      List array, num offset, Vector3 result);
  external static void FromFloatsToRef(num x, num y, num z, Vector3 result);
  external static Vector3 Zero();
  external static Vector3 Up();
  external static Vector3 TransformCoordinates(
      Vector3 vector, Matrix transformation);
  external static void TransformCoordinatesToRef(
      Vector3 vector, Matrix transformation, Vector3 result);
  external static void TransformCoordinatesFromFloatsToRef(
      num x, num y, num z, Matrix transformation, Vector3 result);
  external static Vector3 TransformNormal(
      Vector3 vector, Matrix transformation);
  external static void TransformNormalToRef(
      Vector3 vector, Matrix transformation, Vector3 result);
  external static void TransformNormalFromFloatsToRef(
      num x, num y, num z, Matrix transformation, Vector3 result);
  external static Vector3 CatmullRom(Vector3 value1, Vector3 value2,
                                     Vector3 value3, Vector3 value4, num amount);
  external static Vector3 Clamp(Vector3 value, Vector3 min, Vector3 max);
  external static Vector3 Hermite(Vector3 value1, Vector3 tangent1,
                                  Vector3 value2, Vector3 tangent2, num amount);
  external static Vector3 Lerp(Vector3 start, Vector3 end, num amount);
  external static num Dot(Vector3 left, Vector3 right);
  external static Vector3 Cross(Vector3 left, Vector3 right);
  external static void CrossToRef(Vector3 left, Vector3 right, Vector3 result);
  external static Vector3 Normalize(Vector3 vector);
  external static void NormalizeToRef(Vector3 vector, Vector3 result);
  external static Vector3 Project(
      Vector3 vector, Matrix world, Matrix transform, Viewport viewport);
  external static Vector3 UnprojectFromTransform(Vector3 source,
                                                 num viewportWidth, num viewportHeight, Matrix world, Matrix transform);
  external static Vector3 Unproject(Vector3 source, num viewportWidth,
                                    num viewportHeight, Matrix world, Matrix view, Matrix projection);
  external static Vector3 Minimize(Vector3 left, Vector3 right);
  external static Vector3 Maximize(Vector3 left, Vector3 right);
  external static num Distance(Vector3 value1, Vector3 value2);
  external static num DistanceSquared(Vector3 value1, Vector3 value2);
  external static Vector3 Center(Vector3 value1, Vector3 value2);

  external static Vector3 RotationFromAxis(
      Vector3 axis1, Vector3 axis2, Vector3 axis3);

  external static void RotationFromAxisToRef(
      Vector3 axis1, Vector3 axis2, Vector3 axis3, Vector3 ref);
}

@JS()
class Vector4 {
  external factory Vector4([num x, num y, num z, num w]);

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
  external num get w;
  external set w(num v);
  external String toString();
  external List<num> asArray();
  external Vector4 toArray(List<num> array, num index);
  external Vector4 addInPlace(Vector4 otherVector);
  external Vector4 add(Vector4 otherVector);
  external Vector4 addToRef(Vector4 otherVector, Vector4 result);
  external Vector4 subtractInPlace(Vector4 otherVector);
  external Vector4 subtract(Vector4 otherVector);
  external Vector4 subtractToRef(Vector4 otherVector, Vector4 result);
  external Vector4 subtractFromFloats(num x, num y, num z, num w);
  external Vector4 subtractFromFloatsToRef(
      num x, num y, num z, num w, Vector4 result);
  external Vector4 negate();
  external Vector4 scaleInPlace(num scale);
  external Vector4 scale(num scale);
  external void scaleToRef(num scale, Vector4 result);
  external bool equals(Vector4 otherVector);
  external bool equalsWithEpsilon(Vector4 otherVector, num epsilon);
  external bool equalsToFloats(num x, num y, num z, num w);
  external Vector4 multiplyInPlace(Vector4 otherVector);
  external Vector4 multiply(Vector4 otherVector);
  external Vector4 multiplyToRef(Vector4 otherVector, Vector4 result);
  external Vector4 multiplyByFloats(num x, num y, num z, num w);
  external Vector4 divide(Vector4 otherVector);
  external Vector4 divideToRef(Vector4 otherVector, Vector4 result);
  external Vector4 MinimizeInPlace(Vector4 other);
  external Vector4 MaximizeInPlace(Vector4 other);
  external num length();
  external num lengthSquared();
  external Vector4 normalize();
  external Vector4 clone();
  external Vector4 copyFrom(Vector4 source);
  external Vector4 copyFromFloats(num x, num y, num z, num w);
  external static Vector4 FromArray(List<num> array, num offset);
  external static void FromArrayToRef(
      List<num> array, num offset, Vector4 result);
  external static void FromFloatArrayToRef(
      List array, num offset, Vector4 result);
  external static void FromFloatsToRef(
      num x, num y, num z, num w, Vector4 result);
  external static Vector4 Zero();
  external static Vector4 Normalize(Vector4 vector);
  external static void NormalizeToRef(Vector4 vector, Vector4 result);
  external static Vector4 Minimize(Vector4 left, Vector4 right);
  external static Vector4 Maximize(Vector4 left, Vector4 right);
  external static num Distance(Vector4 value1, Vector4 value2);
  external static num DistanceSquared(Vector4 value1, Vector4 value2);
  external static Vector4 Center(Vector4 value1, Vector4 value2);
}

@JS()
class Quaternion {
  external factory Quaternion([num x, num y, num z, num w]);

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get z;
  external set z(num v);
  external num get w;
  external set w(num v);
  external String toString();
  external List<num> asArray();
  external bool equals(Quaternion otherQuaternion);
  external Quaternion clone();
  external Quaternion copyFrom(Quaternion other);
  external Quaternion copyFromFloats(num x, num y, num z, num w);
  external Quaternion add(Quaternion other);
  external Quaternion subtract(Quaternion other);
  external Quaternion scale(num value);
  external Quaternion multiply(Quaternion q1);
  external Quaternion multiplyToRef(Quaternion q1, Quaternion result);
  external Quaternion multiplyInPlace(Quaternion q1);
  external num length();
  external Quaternion normalize();
  external Vector3 toEulerAngles(String order);
  external Quaternion toEulerAnglesToRef(Vector3 result, String order);
  external Quaternion toRotationMatrix(Matrix result);
  external Quaternion fromRotationMatrix(Matrix matrix);
  external static Quaternion FromRotationMatrix(Matrix matrix);
  external static void FromRotationMatrixToRef(
      Matrix matrix, Quaternion result);
  external static Quaternion Inverse(Quaternion q);
  external static Quaternion Identity();
  external static Quaternion RotationAxis(Vector3 axis, num angle);
  external static Quaternion FromArray(List<num> array, num offset);
  external static Quaternion RotationYawPitchRoll(num yaw, num pitch, num roll);
  external static void RotationYawPitchRollToRef(
      num yaw, num pitch, num roll, Quaternion result);
  external static Quaternion RotationAlphaBetaGamma(
      num alpha, num beta, num gamma);
  external static void RotationAlphaBetaGammaToRef(
      num alpha, num beta, num gamma, Quaternion result);
  external static Quaternion Slerp(
      Quaternion left, Quaternion right, num amount);
}

@JS()
class Matrix {
  external factory Matrix();

  external List get m;
  external set m(List v);
  external bool isIdentity();
  external num determinant();
  external List toArray();
  external List asArray();
  external Matrix invert();
  external Matrix reset();
  external Matrix add(Matrix other);
  external Matrix addToRef(Matrix other, Matrix result);
  external Matrix addToSelf(Matrix other);
  external Matrix invertToRef(Matrix other);
  external Matrix setTranslation(Vector3 vector3);
  external Matrix multiply(Matrix other);
  external Matrix copyFrom(Matrix other);
  external Matrix copyToArray(List array, num offset);
  external Matrix multiplyToRef(Matrix other, Matrix result);
  external Matrix multiplyToArray(Matrix other, List result, num offset);
  external bool equals(Matrix value);
  external Matrix clone();
  external bool decompose(
      Vector3 scale, Quaternion rotation, Vector3 translation);
  external static Matrix FromArray(List<num> array, num offset);
  external static void FromArrayToRef(
      List<num> array, num offset, Matrix result);
  external static void FromListToRefScaled(
      List array, num offset, num scale, Matrix result);
  external static void FromValuesToRef(
      num initialM11,
      num initialM12,
      num initialM13,
      num initialM14,
      num initialM21,
      num initialM22,
      num initialM23,
      num initialM24,
      num initialM31,
      num initialM32,
      num initialM33,
      num initialM34,
      num initialM41,
      num initialM42,
      num initialM43,
      num initialM44,
      Matrix result);
  external static Matrix FromValues(
      num initialM11,
      num initialM12,
      num initialM13,
      num initialM14,
      num initialM21,
      num initialM22,
      num initialM23,
      num initialM24,
      num initialM31,
      num initialM32,
      num initialM33,
      num initialM34,
      num initialM41,
      num initialM42,
      num initialM43,
      num initialM44);
  external static Matrix Compose(
      Vector3 scale, Quaternion rotation, Vector3 translation);
  external static Matrix Identity();
  external static void IdentityToRef(Matrix result);
  external static Matrix Zero();
  external static Matrix RotationX(num angle);
  external static Matrix Invert(Matrix source);
  external static void RotationXToRef(num angle, Matrix result);
  external static Matrix RotationY(num angle);
  external static void RotationYToRef(num angle, Matrix result);
  external static Matrix RotationZ(num angle);
  external static void RotationZToRef(num angle, Matrix result);
  external static Matrix RotationAxis(Vector3 axis, num angle);
  external static void RotationAxisToRef(
      Vector3 axis, num angle, Matrix result);
  external static Matrix RotationYawPitchRoll(num yaw, num pitch, num roll);
  external static void RotationYawPitchRollToRef(
      num yaw, num pitch, num roll, Matrix result);
  external static Matrix Scaling(num x, num y, num z);
  external static void ScalingToRef(num x, num y, num z, Matrix result);
  external static Matrix Translation(num x, num y, num z);
  external static void TranslationToRef(num x, num y, num z, Matrix result);
  external static Matrix Lerp(Matrix startValue, Matrix endValue, num gradient);
  external static Matrix LookAtLH(Vector3 eye, Vector3 target, Vector3 up);
  external static void LookAtLHToRef(
      Vector3 eye, Vector3 target, Vector3 up, Matrix result);
  external static Matrix OrthoLH(num width, num height, num znear, num zfar);
  external static void OrthoLHToRef(
      num width, num height, num znear, num zfar, Matrix result);
  external static Matrix OrthoOffCenterLH(
      num left, num right, num bottom, num top, num znear, num zfar);
  external static void OrthoOffCenterLHToRef(num left, dynamic right,
                                             num bottom, num top, num znear, num zfar, Matrix result);
  external static Matrix PerspectiveLH(
      num width, num height, num znear, num zfar);
  external static Matrix PerspectiveFovLH(
      num fov, num aspect, num znear, num zfar);
  external static void PerspectiveFovLHToRef(
      num fov, num aspect, num znear, num zfar, Matrix result, num fovMode);
  external static Matrix GetFinalMatrix(Viewport viewport, Matrix world,
                                        Matrix view, Matrix projection, num zmin, num zmax);
  external static List GetAsMatrix2x2(Matrix matrix);
  external static List GetAsMatrix3x3(Matrix matrix);
  external static Matrix Transpose(Matrix matrix);
  external static Matrix Reflection(Plane plane);
  external static void ReflectionToRef(Plane plane, Matrix result);
}

@JS()
class Plane {
  external factory Plane([num a, num b, num c, num d]);

  external Vector3 get normal;
  external set normal(Vector3 v);
  external num get d;
  external set d(num v);
  external List<num> asArray();
  external Plane clone();
  external Plane normalize();
  external Plane transform(Matrix transformation);
  external num dotCoordinate(dynamic point);
  external Plane copyFromPoints(Vector3 point1, Vector3 point2, Vector3 point3);
  external bool isFrontFacingTo(Vector3 direction, num epsilon);
  external num signedDistanceTo(Vector3 point);
  external static Plane FromArray(List<num> array);
  external static Plane FromPoints(
      dynamic point1, dynamic point2, dynamic point3);
  external static Plane FromPositionAndNormal(Vector3 origin, Vector3 normal);
  external static num SignedDistanceToPlaneFromPositionAndNormal(
      Vector3 origin, Vector3 normal, Vector3 point);
}

@JS()
class Viewport {
  external factory Viewport([num x, num y, num width, num height]);

  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
  external Viewport toGlobal(Engine engine);
  external Viewport toScreenGlobal(Engine engine);
}

@JS()
class Frustum {
  external factory Frustum();

  external static List<Plane> GetPlanes(Matrix transform);
  external static void GetPlanesToRef(
      Matrix transform, List<Plane> frustumPlanes);
}

@JS()
class Ray {
  external factory Ray([Vector3 origin, Vector3 direction, num length]);

  external Vector3 get origin;
  external set origin(Vector3 v);
  external Vector3 get direction;
  external set direction(Vector3 v);
  external num get length;
  external set length(num v);
  external bool intersectsBoxMinMax(Vector3 minimum, Vector3 maximum);
  external bool intersectsBox(BoundingBox box);
  external bool intersectsSphere(dynamic sphere);
  external IntersectionInfo intersectsTriangle(
      Vector3 vertex0, Vector3 vertex1, Vector3 vertex2);
  external static Ray CreateNew(num x, num y, num viewportWidth,
                                num viewportHeight, Matrix world, Matrix view, Matrix projection);

  external static Ray CreateNewFromTo(
      Vector3 origin, Vector3 end, Matrix world);
  external static Ray Transform(Ray ray, Matrix matrix);
}

enum Space { LOCAL, WORLD, }

@JS()
class Axis {
  external factory Axis();

  external static Vector3 get X;
  external static Vector3 get Y;
  external static Vector3 get Z;
}

@JS()
class BezierCurve {
  external factory BezierCurve();

  external static num interpolate(num t, num x1, num y1, num x2, num y2);
}

enum Orientation { CW, CCW, }

@JS()
class Angle {
  external factory Angle([num radians]);

  external num degrees();
  external num radians();
  external static Angle BetweenTwoPoints(Vector2 a, Vector2 b);
  external static Angle FromRadians(num radians);
  external static Angle FromDegrees(num degrees);
}

@JS()
class Arc2 {
  external factory Arc2(
      [Vector2 startPoint, Vector2 midPoint, Vector2 endPoint]);

  external Vector2 get startPoint;
  external set startPoint(Vector2 v);
  external Vector2 get midPoint;
  external set midPoint(Vector2 v);
  external Vector2 get endPoint;
  external set endPoint(Vector2 v);
  external Vector2 get centerPoint;
  external set centerPoint(Vector2 v);
  external num get radius;
  external set radius(num v);
  external Angle get angle;
  external set angle(Angle v);
  external Angle get startAngle;
  external set startAngle(Angle v);
  external Orientation get orientation;
  external set orientation(Orientation v);
}

@JS()
class PathCursor {
  external factory PathCursor([Path2 path]);

  external num get value;
  external set value(num v);
  external List<Animation> get animations;
  external set animations(List<Animation> v);
  external Vector3 getPoint();
  external PathCursor moveAhead(num step);
  external PathCursor moveBack(num step);
  external PathCursor move(num step);
  external PathCursor onchange(VoidFunc1<PathCursor> f);
}

@JS()
class Path2 {
  external factory Path2([num x, num y]);

  external bool get closed;
  external set closed(bool v);
  external Path2 addLineTo(num x, num y);
  external Path2 addArcTo(
      num midX, num midY, num endX, num endY, num numOfSegments);
  external Path2 close();
  external num length();
  external List<Vector2> getPoints();
  external Vector2 getPointAtLengthPosition(num normalizedLengthPosition);
  external static Path2 StartingAt(num x, num y);
}

@JS()
class Path3D {
  external factory Path3D([List<Vector3> path, Vector3 firstNormal, bool raw]);

  external List<Vector3> get path;
  external set path(List<Vector3> v);
  external List<Vector3> getCurve();
  external List<Vector3> getTangents();
  external List<Vector3> getNormals();
  external List<Vector3> getBinormals();
  external List<num> getDistances();
  external Path3D update(List<Vector3> path, Vector3 firstNormal);
}

@JS()
class Curve3 {
  external factory Curve3([List<Vector3> points]);

  external static Curve3 CreateQuadraticBezier(
      Vector3 v0, Vector3 v1, Vector3 v2, num nbPoints);
  external static Curve3 CreateCubicBezier(
      Vector3 v0, Vector3 v1, Vector3 v2, Vector3 v3, num nbPoints);
  external static Curve3 CreateHermiteSpline(
      Vector3 p1, Vector3 t1, Vector3 p2, Vector3 t2, num nbPoints);
  external List<Vector3> getPoints();
  external num length();
}

@JS()
class PositionNormalVertex {
  external factory PositionNormalVertex([Vector3 position, Vector3 normal]);

  external Vector3 get position;
  external set position(Vector3 v);
  external Vector3 get normal;
  external set normal(Vector3 v);
  external PositionNormalVertex clone();
}

@JS()
class PositionNormalTextureVertex {
  external factory PositionNormalTextureVertex(
      [Vector3 position, Vector3 normal, Vector2 uv]);

  external Vector3 get position;
  external set position(Vector3 v);
  external Vector3 get normal;
  external set normal(Vector3 v);
  external Vector2 get uv;
  external set uv(Vector2 v);
  external PositionNormalTextureVertex clone();
}

@JS()
class Tmp {
  external factory Tmp();

  external static List<Vector2> get Vector2;
  external static List<Vector3> get Vector3;
  external static List<Vector4> get Vector4;
  external static List<Quaternion> get Quaternion;
  external static List<Matrix> get Matrix;
}

@JS()
class EffectFallbacks {
  external factory EffectFallbacks();

  external void addFallback(num rank, String define);
  external void addCPUSkinningFallback(num rank, AbstractMesh mesh);
  external bool get isMoreFallbacks;
  external set isMoreFallbacks(bool v);
  external String reduce(String currentDefines);
}

@JS()
class Effect {
  external factory Effect(
      [dynamic baseName,
      List<String> attributesNames,
      List<String> uniformsNames,
      List<String> samplers,
      dynamic engine,
      String defines,
      EffectFallbacks fallbacks,
      VoidFunc1<Effect> onCompiled,
      VoidFunc2<Effect, String> onError]);

  external dynamic get name;
  external set name(dynamic v);
  external String get defines;
  external set defines(String v);
  external void onCompiled(Effect effect);
  external void onError(Effect effect, String errors);
  external void onBind(Effect effect);

  external String get _key;
  external set _key(String v);
  external bool isReady();
  external WebGLProgram getProgram();
  external List<String> getAttributesNames();
  external num getAttributeLocation(num index);
  external num getAttributeLocationByName(String name);
  external num getAttributesCount();
  external num getUniformIndex(String uniformName);
  external WebGLUniformLocation getUniform(String uniformName);
  external List<String> getSamplers();
  external String getCompilationError();
  external void _loadVertexShader(dynamic vertex, VoidFunc1<dynamic> callback);
  external void _loadFragmentShader(
      dynamic fragment, VoidFunc1<dynamic> callback);

  external bool get isSupported;
  external set isSupported(bool v);
  external void _bindTexture(String channel, WebGLTexture texture);
  external void setTexture(String channel, BaseTexture texture);
  external void setTextureFromPostProcess(
      String channel, PostProcess postProcess);
  external void _cacheMatrix(dynamic uniformName, dynamic matrix);
  external void _cacheFloat2(String uniformName, num x, num y);
  external void _cacheFloat3(String uniformName, num x, num y, num z);
  external void _cacheFloat4(String uniformName, num x, num y, num z, num w);
  external Effect setArray(String uniformName, List<num> array);
  external Effect setArray2(String uniformName, List<num> array);
  external Effect setArray3(String uniformName, List<num> array);
  external Effect setArray4(String uniformName, List<num> array);
  external Effect setMatrices(String uniformName, List matrices);
  external Effect setMatrix(String uniformName, Matrix matrix);
  external Effect setMatrix3x3(String uniformName, List matrix);
  external Effect setMatrix2x2(String uniformname, List matrix);
  external Effect setFloat(String uniformName, num value);
  external Effect setBool(String uniformName, bool bool);
  external Effect setVector2(String uniformName, Vector2 vector2);
  external Effect setFloat2(String uniformName, num x, num y);
  external Effect setVector3(String uniformName, Vector3 vector3);
  external Effect setFloat3(String uniformName, num x, num y, num z);
  external Effect setVector4(String uniformName, Vector4 vector4);
  external Effect setFloat4(String uniformName, num x, num y, num z, num w);
  external Effect setColor3(String uniformName, Color3 color3);
  external Effect setColor4(String uniformName, Color3 color3, num alpha);
/*static  ShadersStore ## ; */

}

@JS()
class MaterialDefines {
  external factory MaterialDefines();

  external List<String> get _keys;
  external set _keys(List<String> v);
  external bool isEqual(MaterialDefines other);
  external void cloneTo(MaterialDefines other);
  external void reset();
  external String toString();
}

@JS()
class Material {
  external factory Material([String name, Scene scene, bool doNotAdd]);

  external String get name;
  external set name(String v);

  external static num get TriangleFillMode;
  external static num get WireFrameFillMode;
  external static num get PointFillMode;

  external static num get ClockWiseSideOrientation;
  external static num get CounterClockWiseSideOrientation;
  external String get id;
  external set id(String v);
  external bool get checkReadyOnEveryCall;
  external set checkReadyOnEveryCall(bool v);
  external bool get checkReadyOnlyOnce;
  external set checkReadyOnlyOnce(bool v);
  external String get state;
  external set state(String v);
  external num get alpha;
  external set alpha(num v);
  external bool get backFaceCulling;
  external set backFaceCulling(bool v);
  external num get sideOrientation;
  external set sideOrientation(num v);
  external void onCompiled(Effect effect);
  external void onError(Effect effect, String errors);
  external void onDispose();
  external void onBind(Material material, Mesh mesh);
  external SmartList<RenderTargetTexture> getRenderTargetTextures();
  external num get alphaMode;
  external set alphaMode(num v);
  external bool get disableDepthWrite;
  external set disableDepthWrite(bool v);
  external bool get fogEnabled;
  external set fogEnabled(bool v);
  external Effect get _effect;
  external set _effect(Effect v);
  external bool get _wasPreviouslyReady;
  external set _wasPreviouslyReady(bool v);

  external num get pointSize;
  external set pointSize(num v);
  external num get zOffset;
  external set zOffset(num v);
  external bool get wireframe;
  external set wireframe(bool v);
  external bool get pointsCloud;
  external set pointsCloud(bool v);
  external num get fillMode;
  external set fillMode(num v);

  external bool get isFrozen;
  external set isFrozen(bool v);
  external void freeze();
  external void unfreeze();
  external bool isReady(AbstractMesh mesh, bool useInstances);
  external Effect getEffect();
  external Scene getScene();
  external bool needAlphaBlending();
  external bool needAlphaTesting();
  external BaseTexture getAlphaTestTexture();
  external void trackCreation(
      VoidFunc1<Effect> onCompiled, VoidFunc2<Effect, String> onError);
  external void markDirty();
  external void _preBind();
  external void bind(Matrix world, Mesh mesh);
  external void bindOnlyWorldMatrix(Matrix world);
  external void unbind();
  external Material clone(String name);
  external List<AbstractMesh> getBindedMeshes();
  external void dispose(bool forceDisposeEffect);
  external void copyTo(Material other);
  external dynamic serialize();
  external static MultiMaterial ParseMultiMaterial(
      dynamic parsedMultiMaterial, Scene scene);
  external static dynamic Parse(
      dynamic parsedMaterial, Scene scene, String rootUrl);
}

@JS()
class MultiMaterial extends Material {
  external factory MultiMaterial([String name, Scene scene]);

  external List<Material> get subMaterials;
  external set subMaterials(List<Material> v);
  external Material getSubMaterial(dynamic index);
  external bool isReady(AbstractMesh mesh);
  external MultiMaterial clone(String name, bool cloneChildren);
  external dynamic serialize();
}

@JS()
class ShaderMaterial extends Material {
  external factory ShaderMaterial(
      [String name, Scene scene, dynamic shaderPath, dynamic options]);

  external bool needAlphaBlending();
  external bool needAlphaTesting();
  external ShaderMaterial setTexture(String name, Texture texture);
  external ShaderMaterial setFloat(String name, num value);
  external ShaderMaterial setFloats(String name, List<num> value);
  external ShaderMaterial setColor3(String name, Color3 value);
  external ShaderMaterial setColor4(String name, Color4 value);
  external ShaderMaterial setVector2(String name, Vector2 value);
  external ShaderMaterial setVector3(String name, Vector3 value);
  external ShaderMaterial setVector4(String name, Vector4 value);
  external ShaderMaterial setMatrix(String name, Matrix value);
  external ShaderMaterial setMatrix3x3(String name, List value);
  external ShaderMaterial setMatrix2x2(String name, List value);
  external bool isReady(AbstractMesh mesh, bool useInstances);
  external void bindOnlyWorldMatrix(Matrix world);
  external void bind(Matrix world, Mesh mesh);
  external ShaderMaterial clone(String name);
  external void dispose(bool forceDisposeEffect);
  external dynamic serialize();
  external static ShaderMaterial Parse(
      dynamic source, Scene scene, String rootUrl);
}

@JS()
class FresnelParameters {
  external factory FresnelParameters();

  external bool get isEnabled;
  external set isEnabled(bool v);
  external Color3 get leftColor;
  external set leftColor(Color3 v);
  external Color3 get rightColor;
  external set rightColor(Color3 v);
  external num get bias;
  external set bias(num v);
  external num get power;
  external set power(num v);
  external FresnelParameters clone();
  external dynamic serialize();
  external static FresnelParameters Parse(dynamic parsedFresnelParameters);
}

@JS()
class StandardMaterial extends Material {
  external factory StandardMaterial([String name, Scene scene]);

  external BaseTexture get diffuseTexture;
  external set diffuseTexture(BaseTexture v);
  external BaseTexture get ambientTexture;
  external set ambientTexture(BaseTexture v);
  external BaseTexture get opacityTexture;
  external set opacityTexture(BaseTexture v);
  external BaseTexture get reflectionTexture;
  external set reflectionTexture(BaseTexture v);
  external BaseTexture get emissiveTexture;
  external set emissiveTexture(BaseTexture v);
  external BaseTexture get specularTexture;
  external set specularTexture(BaseTexture v);
  external BaseTexture get bumpTexture;
  external set bumpTexture(BaseTexture v);
  external BaseTexture get lightmapTexture;
  external set lightmapTexture(BaseTexture v);
  external Color3 get ambientColor;
  external set ambientColor(Color3 v);
  external Color3 get diffuseColor;
  external set diffuseColor(Color3 v);
  external Color3 get specularColor;
  external set specularColor(Color3 v);
  external num get specularPower;
  external set specularPower(num v);
  external Color3 get emissiveColor;
  external set emissiveColor(Color3 v);
  external bool get useAlphaFromDiffuseTexture;
  external set useAlphaFromDiffuseTexture(bool v);
  external bool get useEmissiveAsIllumination;
  external set useEmissiveAsIllumination(bool v);
  external bool get linkEmissiveWithDiffuse;
  external set linkEmissiveWithDiffuse(bool v);
  external bool get useReflectionFresnelFromSpecular;
  external set useReflectionFresnelFromSpecular(bool v);
  external bool get useSpecularOverAlpha;
  external set useSpecularOverAlpha(bool v);
  external bool get disableLighting;
  external set disableLighting(bool v);
  external num get roughness;
  external set roughness(num v);
  external bool get useLightmapAsShadowmap;
  external set useLightmapAsShadowmap(bool v);
  external FresnelParameters get diffuseFresnelParameters;
  external set diffuseFresnelParameters(FresnelParameters v);
  external FresnelParameters get opacityFresnelParameters;
  external set opacityFresnelParameters(FresnelParameters v);
  external FresnelParameters get reflectionFresnelParameters;
  external set reflectionFresnelParameters(FresnelParameters v);
  external FresnelParameters get emissiveFresnelParameters;
  external set emissiveFresnelParameters(FresnelParameters v);
  external bool get useGlossinessFromSpecularMapAlpha;
  external set useGlossinessFromSpecularMapAlpha(bool v);

  external bool get useLogarithmicDepth;
  external set useLogarithmicDepth(bool v);
  external bool needAlphaBlending();
  external bool needAlphaTesting();
  external BaseTexture getAlphaTestTexture();

  external static bool PrepareDefinesForLights(
      Scene scene, AbstractMesh mesh, MaterialDefines defines);

  external static void BindLights(
      Scene scene, AbstractMesh mesh, Effect effect, MaterialDefines defines);
  external bool isReady(AbstractMesh mesh, bool useInstances);
  external void unbind();
  external void bindOnlyWorldMatrix(Matrix world);
  external void bind(Matrix world, Mesh mesh);
  external List<IAnimatable> getAnimatables();
  external void dispose(bool forceDisposeEffect);
  external StandardMaterial clone(String name);
  external dynamic serialize();
  external static bool get DiffuseTextureEnabled;
  external static bool get AmbientTextureEnabled;
  external static bool get OpacityTextureEnabled;
  external static bool get ReflectionTextureEnabled;
  external static bool get EmissiveTextureEnabled;
  external static bool get SpecularTextureEnabled;
  external static bool get BumpTextureEnabled;
  external static bool get FresnelEnabled;
  external static bool get LightmapEnabled;
  external static StandardMaterial Parse(
      dynamic source, Scene scene, String rootUrl);
}

@JS()
class AbstractMesh extends Node {
  external factory AbstractMesh([String name, Scene scene]);

  external static num get BILLBOARDMODE_NONE;
  external static num get BILLBOARDMODE_X;
  external static num get BILLBOARDMODE_Y;
  external static num get BILLBOARDMODE_Z;
  external static num get BILLBOARDMODE_ALL;
  external bool get definedFacingForward;
  external set definedFacingForward(bool v);
  external Vector3 get position;
  external set position(Vector3 v);
  external Vector3 get rotation;
  external set rotation(Vector3 v);
  external Quaternion get rotationQuaternion;
  external set rotationQuaternion(Quaternion v);
  external Vector3 get scaling;
  external set scaling(Vector3 v);
  external num get billboardMode;
  external set billboardMode(num v);
  external num get visibility;
  external set visibility(num v);
  external num get alphaIndex;
  external set alphaIndex(num v);
  external bool get infiniteDistance;
  external set infiniteDistance(bool v);
  external bool get isVisible;
  external set isVisible(bool v);
  external bool get isPickable;
  external set isPickable(bool v);
  external bool get showBoundingBox;
  external set showBoundingBox(bool v);
  external bool get showSubMeshesBoundingBox;
  external set showSubMeshesBoundingBox(bool v);
  external dynamic get onDispose;
  external set onDispose(dynamic v);
  external bool get isBlocker;
  external set isBlocker(bool v);
  external num get renderingGroupId;
  external set renderingGroupId(num v);
  external Material get material;
  external set material(Material v);
  external bool get receiveShadows;
  external set receiveShadows(bool v);
  external ActionManager get actionManager;
  external set actionManager(ActionManager v);
  external bool get renderOutline;
  external set renderOutline(bool v);
  external Color3 get outlineColor;
  external set outlineColor(Color3 v);
  external num get outlineWidth;
  external set outlineWidth(num v);
  external bool get renderOverlay;
  external set renderOverlay(bool v);
  external Color3 get overlayColor;
  external set overlayColor(Color3 v);
  external num get overlayAlpha;
  external set overlayAlpha(num v);
  external bool get hasVertexAlpha;
  external set hasVertexAlpha(bool v);
  external bool get useVertexColors;
  external set useVertexColors(bool v);
  external bool get applyFog;
  external set applyFog(bool v);
  external bool get computeBonesUsingShaders;
  external set computeBonesUsingShaders(bool v);
  external num get scalingDeterminant;
  external set scalingDeterminant(num v);
  external num get numBoneInfluencers;
  external set numBoneInfluencers(num v);
  external bool get useOctreeForRenderingSelection;
  external set useOctreeForRenderingSelection(bool v);
  external bool get useOctreeForPicking;
  external set useOctreeForPicking(bool v);
  external bool get useOctreeForCollisions;
  external set useOctreeForCollisions(bool v);
  external num get layerMask;
  external set layerMask(num v);
  external bool get alwaysSelectAsActiveMesh;
  external set alwaysSelectAsActiveMesh(bool v);
  external num get _physicImpostor;
  external set _physicImpostor(num v);
  external num get _physicsMass;
  external set _physicsMass(num v);
  external num get _physicsFriction;
  external set _physicsFriction(num v);
  external num get _physicRestitution;
  external set _physicRestitution(num v);
  external void onPhysicsCollide(AbstractMesh collidedMesh, dynamic contact);

  external Vector3 get ellipsoid;
  external set ellipsoid(Vector3 v);
  external Vector3 get ellipsoidOffset;
  external set ellipsoidOffset(Vector3 v);
  external void onCollide(AbstractMesh collidedMesh);
  external void onCollisionPositionChange(Vector3 newPosition);

  external num get edgesWidth;
  external set edgesWidth(num v);
  external Color4 get edgesColor;
  external set edgesColor(Color4 v);
  external EdgesRenderer get _edgesRenderer;
  external set _edgesRenderer(EdgesRenderer v);

  external Matrix get _worldMatrix;
  external set _worldMatrix(Matrix v);

  external List<Vector3> get _positions;
  external set _positions(List<Vector3> v);

  external AbstractMesh get _masterMesh;
  external set _masterMesh(AbstractMesh v);
  external MaterialDefines get _materialDefines;
  external set _materialDefines(MaterialDefines v);
  external BoundingInfo get _boundingInfo;
  external set _boundingInfo(BoundingInfo v);

  external bool get _isDisposed;
  external set _isDisposed(bool v);
  external num get _renderId;
  external set _renderId(num v);
  external List<SubMesh> get subMeshes;
  external set subMeshes(List<SubMesh> v);
  external Octree<SubMesh> get _submeshesOctree;
  external set _submeshesOctree(Octree<SubMesh> v);
  external List<AbstractMesh> get _intersectionsInProgress;
  external set _intersectionsInProgress(List<AbstractMesh> v);

  external bool get _unIndexed;
  external set _unIndexed(bool v);
  external Matrix get _poseMatrix;
  external set _poseMatrix(Matrix v);
  external dynamic get _waitingActions;
  external set _waitingActions(dynamic v);
  external bool get _waitingFreezeWorldMatrix;
  external set _waitingFreezeWorldMatrix(bool v);

  external List get _bonesTransformMatrices;
  external set _bonesTransformMatrices(List v);
  external Skeleton get skeleton;
  external set skeleton(Skeleton v);
  external void updatePoseMatrix(Matrix matrix);
  external Matrix getPoseMatrix();
  external void disableEdgesRendering();
  external void enableEdgesRendering(
      num epsilon, bool checkVerticesInsteadOfIndices);
  external bool get isBlocked;
  external set isBlocked(bool v);
  external AbstractMesh getLOD(Camera camera);
  external num getTotalVertices();
  external dynamic getIndices();
  external dynamic getVerticesData(String kind);
  external bool isVerticesDataPresent(String kind);
  external BoundingInfo getBoundingInfo();
  external bool get useBones;
  external set useBones(bool v);
  external void _preActivate();
  external void _activate(num renderId);
  external Matrix getWorldMatrix();
  external Matrix get worldMatrixFromCache;
  external set worldMatrixFromCache(Matrix v);
  external Vector3 get absolutePosition;
  external set absolutePosition(Vector3 v);
  external void freezeWorldMatrix();
  external void unfreezeWorldMatrix();
  external bool get isWorldMatrixFrozen;
  external set isWorldMatrixFrozen(bool v);
  external void rotate(Vector3 axis, num amount, Space space);
  external void translate(Vector3 axis, num distance, Space space);
  external Vector3 getAbsolutePosition();
  external void setAbsolutePosition(Vector3 absolutePosition);
  external void movePOV(num amountRight, num amountUp, num amountForward);
  external Vector3 calcMovePOV(
      num amountRight, num amountUp, num amountForward);
  external void rotatePOV(num flipBack, num twirlClockwise, num tiltRight);
  external Vector3 calcRotatePOV(
      num flipBack, num twirlClockwise, num tiltRight);
  external void setPivotMatrix(Matrix matrix);
  external Matrix getPivotMatrix();
  external bool _isSynchronized();
  external void _initCache();
  external void markAsDirty(String property);
  external void _updateBoundingInfo();
  external void _updateSubMeshesBoundingInfo(Matrix matrix);
  external Matrix computeWorldMatrix(bool force);
  external void registerAfterWorldMatrixUpdate(VoidFunc1<AbstractMesh> func);
  external void unregisterAfterWorldMatrixUpdate(VoidFunc1<AbstractMesh> func);
  external void setPositionWithLocalVector(Vector3 vector3);
  external Vector3 getPositionExpressedInLocalSpace();
  external void locallyTranslate(Vector3 vector3);
  external void lookAt(
      Vector3 targetPoint, num yawCor, num pitchCor, num rollCor);
  external void attachToBone(Bone bone, AbstractMesh affectedMesh);
  external void detachFromBone();
  external bool isInFrustum(List<Plane> frustumPlanes);
  external bool isCompletelyInFrustum(Camera camera);
  external bool intersectsMesh(AbstractMesh mesh, bool precise);
  external bool intersectsPoint(Vector3 point);
  external dynamic setPhysicsState(
      dynamic impostor, PhysicsBodyCreationOptions options);
  external num getPhysicsImpostor();
  external num getPhysicsMass();
  external num getPhysicsFriction();
  external num getPhysicsRestitution();
  external Vector3 getPositionInCameraSpace(Camera camera);
  external num getDistanceToCamera(Camera camera);
  external void applyImpulse(Vector3 force, Vector3 contactPoint);
  external void setPhysicsLinkWith(
      Mesh otherMesh, Vector3 pivot1, Vector3 pivot2, dynamic options);
  external void updatePhysicsBodyPosition();
  external bool get checkCollisions;
  external set checkCollisions(bool v);
  external void moveWithCollisions(Vector3 velocity);
  external Octree<SubMesh> createOrUpdateSubmeshesOctree(
      num maxCapacity, num maxDepth);
  external void _collideForSubMesh(
      SubMesh subMesh, Matrix transformMatrix, Collider collider);
  external void _processCollisionsForSubMeshes(
      Collider collider, Matrix transformMatrix);
  external void _checkCollision(Collider collider);
  external bool _generatePointsArray();
  external PickingInfo intersects(Ray ray, bool fastCheck);
  external AbstractMesh clone(
      String name, Node newParent, bool doNotCloneChildren);
  external void releaseSubMeshes();
  external void dispose(bool doNotRecurse);
}

@JS()
class CSG {
  external factory CSG();

  external Matrix get matrix;
  external set matrix(Matrix v);
  external Vector3 get position;
  external set position(Vector3 v);
  external Vector3 get rotation;
  external set rotation(Vector3 v);
  external Quaternion get rotationQuaternion;
  external set rotationQuaternion(Quaternion v);
  external Vector3 get scaling;
  external set scaling(Vector3 v);
  external static CSG FromMesh(Mesh mesh);
  external CSG clone();
  external CSG union(CSG csg);
  external void unionInPlace(CSG csg);
  external CSG subtract(CSG csg);
  external void subtractInPlace(CSG csg);
  external CSG intersect(CSG csg);
  external void intersectInPlace(CSG csg);
  external CSG inverse();
  external void inverseInPlace();
  external CSG copyTransformAttributes(CSG csg);
  external Mesh buildMeshGeometry(String name, Scene scene, bool keepSubMeshes);
  external Mesh toMesh(
      String name, Material material, Scene scene, bool keepSubMeshes);
}

@JS()
class Geometry {
  external factory Geometry(
      [String id,
      Scene scene,
      VertexData vertexData,
      bool updatable,
      Mesh mesh]);

  external String get id;
  external set id(String v);
  external num get delayLoadState;
  external set delayLoadState(num v);
  external String get delayLoadingFile;
  external set delayLoadingFile(String v);
  external void onGeometryUpdated(Geometry geometry, String kind);

  external dynamic get _delayInfo;
  external set _delayInfo(dynamic v);

  external BoundingInfo get _boundingInfo;
  external set _boundingInfo(BoundingInfo v);
  external void _delayLoadingFunction(dynamic dynamic, Geometry geometry);
  external num get _softwareSkinningRenderId;
  external set _softwareSkinningRenderId(num v);

  external dynamic get extend;
  external set extend(dynamic v);
  external Scene getScene();
  external Engine getEngine();
  external bool isReady();
  external void setAllVerticesData(VertexData vertexData, bool updatable);
  external void setVerticesData(
      String kind, dynamic data, bool updatable, num stride);
  external void updateVerticesDataDirectly(String kind, List data, num offset);
  external void updateVerticesData(
      String kind, dynamic data, bool updateExtends);
  external num getTotalVertices();
  external dynamic getVerticesData(String kind, bool copyWhenShared);
  external VertexBuffer getVertexBuffer(String kind);
  external List<VertexBuffer> getVertexBuffers();
  external bool isVerticesDataPresent(String kind);
  external List<String> getVerticesDataKinds();
  external void setIndices(dynamic indices, num totalVertices);
  external num getTotalIndices();
  external dynamic getIndices(bool copyWhenShared);
  external dynamic getIndexBuffer();
  external void releaseForMesh(Mesh mesh, bool shouldDispose);
  external void applyToMesh(Mesh mesh);
  external void load(Scene scene, VoidFunc0 onLoaded);
  external bool isDisposed();
  external void dispose();
  external Geometry copy(String id);
  external dynamic serialize();
  external dynamic serializeVerticeData();
  external static Geometry ExtractFromMesh(Mesh mesh, String id);
  external static String RandomId();
  external static void ImportGeometry(dynamic parsedGeometry, Mesh mesh);
  external static Geometry Parse(
      dynamic parsedVertexData, Scene scene, String rootUrl);
}

@JS()
class _Primitive extends Geometry {
  external factory _Primitive(
      [String id,
      Scene scene,
      VertexData vertexData,
      bool canBeRegenerated,
      Mesh mesh]);

  external bool canBeRegenerated();
  external void regenerate();
  external Geometry asNewGeometry(String id);
  external void setAllVerticesData(VertexData vertexData, bool updatable);
  external void setVerticesData(String kind, dynamic data, bool updatable);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
  external dynamic serialize();
}

@JS()
class Ribbon extends _Primitive {
  external factory Ribbon(
      [String id,
      Scene scene,
      List<List<Vector3>> pathArray,
      bool closeArray,
      bool closePath,
      num offset,
      bool canBeRegenerated,
      Mesh mesh,
      num side]);

  external List<List<Vector3>> get pathArray;
  external set pathArray(List<List<Vector3>> v);
  external bool get closeArray;
  external set closeArray(bool v);
  external bool get closePath;
  external set closePath(bool v);
  external num get offset;
  external set offset(num v);
  external num get side;
  external set side(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
}

@JS()
class Box extends _Primitive {
  external factory Box(
      [String id,
      Scene scene,
      num size,
      bool canBeRegenerated,
      Mesh mesh,
      num side]);

  external num get size;
  external set size(num v);
  external num get side;
  external set side(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
  external dynamic serialize();
  external static Box Parse(dynamic parsedBox, Scene scene);
}

@JS()
class Sphere extends _Primitive {
  external factory Sphere(
      [String id,
      Scene scene,
      num segments,
      num diameter,
      bool canBeRegenerated,
      Mesh mesh,
      num side]);

  external num get segments;
  external set segments(num v);
  external num get diameter;
  external set diameter(num v);
  external num get side;
  external set side(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
  external dynamic serialize();
  external static Sphere Parse(dynamic parsedSphere, Scene scene);
}

@JS()
class Disc extends _Primitive {
  external factory Disc(
      [String id,
      Scene scene,
      num radius,
      num tessellation,
      bool canBeRegenerated,
      Mesh mesh,
      num side]);

  external num get radius;
  external set radius(num v);
  external num get tessellation;
  external set tessellation(num v);
  external num get side;
  external set side(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
}

@JS()
class Cylinder extends _Primitive {
  external factory Cylinder(
      [String id,
      Scene scene,
      num height,
      num diameterTop,
      num diameterBottom,
      num tessellation,
      num subdivisions,
      bool canBeRegenerated,
      Mesh mesh,
      num side]);

  external num get height;
  external set height(num v);
  external num get diameterTop;
  external set diameterTop(num v);
  external num get diameterBottom;
  external set diameterBottom(num v);
  external num get tessellation;
  external set tessellation(num v);
  external num get subdivisions;
  external set subdivisions(num v);
  external num get side;
  external set side(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
  external dynamic serialize();
  external static Cylinder Parse(dynamic parsedCylinder, Scene scene);
}

@JS()
class Torus extends _Primitive {
  external factory Torus(
      [String id,
      Scene scene,
      num diameter,
      num thickness,
      num tessellation,
      bool canBeRegenerated,
      Mesh mesh,
      num side]);

  external num get diameter;
  external set diameter(num v);
  external num get thickness;
  external set thickness(num v);
  external num get tessellation;
  external set tessellation(num v);
  external num get side;
  external set side(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
  external dynamic serialize();
  external static Torus Parse(dynamic parsedTorus, Scene scene);
}

@JS()
class Ground extends _Primitive {
  external factory Ground(
      [String id,
      Scene scene,
      num width,
      num height,
      num subdivisions,
      bool canBeRegenerated,
      Mesh mesh]);

  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
  external num get subdivisions;
  external set subdivisions(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
  external dynamic serialize();
  external static Ground Parse(dynamic parsedGround, Scene scene);
}

@JS()
class TiledGround extends _Primitive {
  external factory TiledGround(
      [String id,
      Scene scene,
      num xmin,
      num zmin,
      num xmax,
      num zmax,
      dynamic subdivisions,
      dynamic precision,
      bool canBeRegenerated,
      Mesh mesh]);

  external num get xmin;
  external set xmin(num v);
  external num get zmin;
  external set zmin(num v);
  external num get xmax;
  external set xmax(num v);
  external num get zmax;
  external set zmax(num v);
  external dynamic get subdivisions;
  external set subdivisions(dynamic v);
  external dynamic get precision;
  external set precision(dynamic v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
}

@JS()
class PlanePrimitive extends _Primitive {
  external factory PlanePrimitive(
      [String id,
      Scene scene,
      num size,
      bool canBeRegenerated,
      Mesh mesh,
      num side]);

  external num get size;
  external set size(num v);
  external num get side;
  external set side(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
  external dynamic serialize();
  external static Plane Parse(dynamic parsedPlane, Scene scene);
}

@JS()
class TorusKnot extends _Primitive {
  external factory TorusKnot(
      [String id,
      Scene scene,
      num radius,
      num tube,
      num radialSegments,
      num tubularSegments,
      num p,
      num q,
      bool canBeRegenerated,
      Mesh mesh,
      num side]);

  external num get radius;
  external set radius(num v);
  external num get tube;
  external set tube(num v);
  external num get radialSegments;
  external set radialSegments(num v);
  external num get tubularSegments;
  external set tubularSegments(num v);
  external num get p;
  external set p(num v);
  external num get q;
  external set q(num v);
  external num get side;
  external set side(num v);
  external VertexData _regenerateVertexData();
  external Geometry copy(String id);
  external dynamic serialize();
  external static TorusKnot Parse(dynamic parsedTorusKnot, Scene scene);
}

@JS()
class GroundMesh extends Mesh {
  external factory GroundMesh([String name, Scene scene]);

  external bool get generateOctree;
  external set generateOctree(bool v);

  external num get _subdivisions;
  external set _subdivisions(num v);
  external num get _width;
  external set _width(num v);
  external num get _height;
  external set _height(num v);
  external num get _minX;
  external set _minX(num v);
  external num get _maxX;
  external set _maxX(num v);
  external num get _minZ;
  external set _minZ(num v);
  external num get _maxZ;
  external set _maxZ(num v);

  external num get subdivisions;
  external set subdivisions(num v);
  external void optimize(num chunksCount, num octreeBlocksSize);
  external num getHeightAtCoordinates(num x, num z);
  external Vector3 getNormalAtCoordinates(num x, num z);
  external void getNormalAtCoordinatesToRef(num x, num z, Vector3 ref);
}

@JS()
class InstancedMesh extends AbstractMesh {
  external factory InstancedMesh([String name, Mesh source]);

  external bool get receiveShadows;
  external set receiveShadows(bool v);
  external Material get material;
  external set material(Material v);
  external num get visibility;
  external set visibility(num v);
  external Skeleton get skeleton;
  external set skeleton(Skeleton v);
  external num get renderingGroupId;
  external set renderingGroupId(num v);
  external num getTotalVertices();
  external Mesh get sourceMesh;
  external set sourceMesh(Mesh v);
  external dynamic getVerticesData(String kind, bool copyWhenShared);
  external bool isVerticesDataPresent(String kind);
  external dynamic getIndices();
  external List<Vector3> get _positions;
  external set _positions(List<Vector3> v);
  external void refreshBoundingInfo();
  external void _preActivate();
  external void _activate(num renderId);
  external AbstractMesh getLOD(Camera camera);
  external void _syncSubMeshes();
  external bool _generatePointsArray();
  external InstancedMesh clone(
      String name, Node newParent, bool doNotCloneChildren);
  external void dispose(bool doNotRecurse);
}

@JS()
class LinesMesh extends Mesh {
  external factory LinesMesh(
      [String name,
      Scene scene,
      Node parent,
      Mesh source,
      bool doNotCloneChildren]);

  external Color3 get color;
  external set color(Color3 v);
  external num get alpha;
  external set alpha(num v);

  external Material get material;
  external set material(Material v);
  external bool get isPickable;
  external set isPickable(bool v);
  external bool get checkCollisions;
  external set checkCollisions(bool v);
  external void _bind(SubMesh subMesh, Effect effect, num fillMode);
  external void _draw(SubMesh subMesh, num fillMode, num instancesCount);
  external dynamic intersects(Ray ray, bool fastCheck);
  external void dispose(bool doNotRecurse);
  external LinesMesh clone(
      String name, Node newParent, bool doNotCloneChildren);
}

@JS()
class _InstancesBatch {
  external factory _InstancesBatch();

  external bool get mustReturn;
  external set mustReturn(bool v);
  external List<List<InstancedMesh>> get visibleInstances;
  external set visibleInstances(List<List<InstancedMesh>> v);
  external List<bool> get renderSelf;
  external set renderSelf(List<bool> v);
}

@JS()
class Mesh extends AbstractMesh {
  external factory Mesh(
      [String name,
      Scene scene,
      Node parent,
      Mesh source,
      bool doNotCloneChildren]);

  external static num get _FRONTSIDE;
  external static num get _BACKSIDE;
  external static num get _DOUBLESIDE;
  external static num get _DEFAULTSIDE;
  external static num get _NO_CAP;
  external static num get _CAP_START;
  external static num get _CAP_END;
  external static num get _CAP_ALL;
  external static num get FRONTSIDE;
  external static num get BACKSIDE;
  external static num get DOUBLESIDE;
  external static num get DEFAULTSIDE;
  external static num get NO_CAP;
  external static num get CAP_START;
  external static num get CAP_END;
  external static num get CAP_ALL;
  external num get delayLoadState;
  external set delayLoadState(num v);
  external List<InstancedMesh> get instances;
  external set instances(List<InstancedMesh> v);
  external String get delayLoadingFile;
  external set delayLoadingFile(String v);
  external dynamic get _binaryInfo;
  external set _binaryInfo(dynamic v);
  external void onLODLevelSelection(
      num distance, Mesh mesh, Mesh selectedLevel);
  external void onBeforeDraw();
  external Geometry get _geometry;
  external set _geometry(Geometry v);

  external dynamic get _delayInfo;
  external set _delayInfo(dynamic v);
  external void _delayLoadingFunction(dynamic dynamic, Mesh mesh);
  external dynamic get _visibleInstances;
  external set _visibleInstances(dynamic v);

  external bool get _shouldGenerateFlatShading;
  external set _shouldGenerateFlatShading(bool v);

  external bool get hasLODLevels;
  external set hasLODLevels(bool v);
  external Mesh addLODLevel(num distance, Mesh mesh);
  external Mesh getLODLevelAtDistance(num distance);
  external Mesh removeLODLevel(Mesh mesh);
  external AbstractMesh getLOD(Camera camera, BoundingSphere boundingSphere);
  external Geometry get geometry;
  external set geometry(Geometry v);
  external num getTotalVertices();
  external dynamic getVerticesData(String kind, bool copyWhenShared);
  external VertexBuffer getVertexBuffer(dynamic kind);
  external bool isVerticesDataPresent(String kind);
  external List<String> getVerticesDataKinds();
  external num getTotalIndices();
  external dynamic getIndices(bool copyWhenShared);
  external bool get isBlocked;
  external set isBlocked(bool v);
  external bool isReady();
  external bool isDisposed();
  external num get sideOrientation;
  external set sideOrientation(num v);
  external bool get areNormalsFrozen;
  external set areNormalsFrozen(bool v);
  /**  This function affects parametric shapes on update ribbons only , tubes, etc. It has no effect at all on other shapes */ external void
  freezeNormals();
  /**  This function affects parametric shapes on update ribbons only , tubes, etc. It has no effect at all on other shapes */ external void
  unfreezeNormals();
  external void _preActivate();
  external void _registerInstanceForRenderId(
      InstancedMesh instance, num renderId);
  external void refreshBoundingInfo();
  external SubMesh _createGlobalSubMesh();
  external void subdivide(num count);
  external void setVerticesData(
      String kind, dynamic data, bool updatable, num stride);
  external void updateVerticesData(
      String kind, dynamic data, bool updateExtends, bool makeItUnique);
  external void updateVerticesDataDirectly(
      String kind, List data, num offset, bool makeItUnique);
  external void updateMeshPositions(
      dynamic positionFunction, bool computeNormals);
  external void makeGeometryUnique();
  external void setIndices(dynamic indices, num totalVertices);
  external void _bind(SubMesh subMesh, Effect effect, num fillMode);
  external void _draw(SubMesh subMesh, num fillMode, num instancesCount);
  external void registerBeforeRender(VoidFunc1<AbstractMesh> func);
  external void unregisterBeforeRender(VoidFunc1<AbstractMesh> func);
  external void registerAfterRender(VoidFunc1<AbstractMesh> func);
  external void unregisterAfterRender(VoidFunc1<AbstractMesh> func);
  external _InstancesBatch _getInstancesRenderList(num subMeshId);
  external void _renderWithInstances(SubMesh subMesh, num fillMode,
                                     _InstancesBatch batch, Effect effect, Engine engine);
  external void _processRendering(
      SubMesh subMesh,
      Effect effect,
      num fillMode,
      _InstancesBatch batch,
      bool hardwareInstancedRendering,
      VoidFunc2<bool, Matrix> onBeforeDraw);
  external void render(SubMesh subMesh, bool enableAlphaMode);
  external List<ParticleSystem> getEmittedParticleSystems();
  external List<ParticleSystem> getHierarchyEmittedParticleSystems();
  external List<Node> getChildren();
  external void _checkDelayState();
  external bool isInFrustum(List<Plane> frustumPlanes);
  external void setMaterialByID(String id);
  external List<IAnimatable> getAnimatables();
  external void bakeTransformIntoVertices(Matrix transform);
  external void bakeCurrentTransformIntoVertices();
  external void _resetPointsArrayCache();
  external bool _generatePointsArray();
  external Mesh clone(String name, Node newParent, bool doNotCloneChildren);
  external void dispose(bool doNotRecurse);
  external void applyDisplacementMap(
      String url, num minHeight, num maxHeight, VoidFunc1<Mesh> onSuccess);
  external void applyDisplacementMapFromBuffer(Uint8List buffer,
                                               num heightMapWidth, num heightMapHeight, num minHeight, num maxHeight);
  external void convertToFlatShadedMesh();
  external void convertToUnIndexedMesh();
  external void flipFaces(bool flipNormals);
  external InstancedMesh createInstance(String name);
  external void synchronizeInstances();
  external void simplify(
      List<ISimplificationSettings> settings,
      bool parallelProcessing,
      SimplificationType simplificationType,
      VoidFunc2<Mesh, num> successCallback);
  external void optimizeIndices(VoidFunc1<Mesh> successCallback);
  external static Mesh Parse(dynamic parsedMesh, Scene scene, String rootUrl);
  external static Mesh CreateRibbon(
      String name,
      List<List<Vector3>> pathArray,
      bool closeArray,
      bool closePath,
      num offset,
      Scene scene,
      bool updatable,
      num sideOrientation,
      Mesh instance);
  external static Mesh CreateDisc(String name, num radius, num tessellation,
                                  Scene scene, bool updatable, num sideOrientation);
  external static Mesh CreateBox(
      String name, num size, Scene scene, bool updatable, num sideOrientation);
  external static Mesh CreateSphere(String name, num segments, num diameter,
                                    Scene scene, bool updatable, num sideOrientation);
  external static Mesh CreateCylinder(
      String name,
      num height,
      num diameterTop,
      num diameterBottom,
      num tessellation,
      dynamic subdivisions,
      Scene scene,
      dynamic updatable,
      num sideOrientation);
  external static Mesh CreateTorus(String name, num diameter, num thickness,
                                   num tessellation, Scene scene, bool updatable, num sideOrientation);
  external static Mesh CreateTorusKnot(
      String name,
      num radius,
      num tube,
      num radialSegments,
      num tubularSegments,
      num p,
      num q,
      Scene scene,
      bool updatable,
      num sideOrientation);
  external static LinesMesh CreateLines(String name, List<Vector3> points,
                                        Scene scene, bool updatable, LinesMesh instance);
  external static LinesMesh CreateDashedLines(
      String name,
      List<Vector3> points,
      num dashSize,
      num gapSize,
      num dashNb,
      Scene scene,
      bool updatable,
      LinesMesh instance);
  external static Mesh ExtrudeShape(
      String name,
      List<Vector3> shape,
      List<Vector3> path,
      num scale,
      num rotation,
      num cap,
      Scene scene,
      bool updatable,
      num sideOrientation,
      Mesh instance);
  external static Mesh ExtrudeShapeCustom(
      String name,
      List<Vector3> shape,
      List<Vector3> path,
      dynamic scaleFunction,
      dynamic rotationFunction,
      bool ribbonCloseArray,
      bool ribbonClosePath,
      num cap,
      Scene scene,
      bool updatable,
      num sideOrientation,
      Mesh instance);
  external static Mesh CreateLathe(String name, List<Vector3> shape, num radius,
                                   num tessellation, Scene scene, bool updatable, num sideOrientation);
  external static Mesh CreatePlane(
      String name, num size, Scene scene, bool updatable, num sideOrientation);
  external static Mesh CreateGround(String name, num width, num height,
                                    num subdivisions, Scene scene, bool updatable);
  external static Mesh CreateTiledGround(
      String name,
      num xmin,
      num zmin,
      num xmax,
      num zmax,
      dynamic subdivisions,
      dynamic precision,
      Scene scene,
      bool updatable);
  external static GroundMesh CreateGroundFromHeightMap(
      String name,
      String url,
      num width,
      num height,
      num subdivisions,
      num minHeight,
      num maxHeight,
      Scene scene,
      bool updatable,
      VoidFunc1<GroundMesh> onReady);
  external static Mesh CreateTube(
      String name,
      List<Vector3> path,
      num radius,
      num tessellation,
      dynamic radiusFunction,
      num cap,
      Scene scene,
      bool updatable,
      num sideOrientation,
      Mesh instance);
  external static Mesh CreatePolyhedron(
      String name, dynamic options, Scene scene);
  external static Mesh CreateIcoSphere(
      String name, dynamic options, Scene scene);
  external static Mesh CreateDecal(String name, AbstractMesh sourceMesh,
                                   Vector3 position, Vector3 normal, Vector3 size, num angle);
  external List setPositionsForCPUSkinning();
  external List setNormalsForCPUSkinning();
  external Mesh applySkeleton(Skeleton skeleton);
  external static dynamic MinMax(List<AbstractMesh> meshes);
  external static Vector3 Center(dynamic meshesOrMinMaxVector);

  external static Mesh MergeMeshes(List<Mesh> meshes, bool disposeSource,
                                   bool allow32BitsIndices, Mesh meshSubclass);
}

@JS()
class IGetSetVerticesData {
  external factory IGetSetVerticesData();

  external bool isVerticesDataPresent(String kind);
  external dynamic getVerticesData(String kind, bool copyWhenShared);
  external dynamic getIndices(bool copyWhenShared);
  external void setVerticesData(String kind, dynamic data, bool updatable);
  external void updateVerticesData(
      String kind, dynamic data, bool updateExtends, bool makeItUnique);
  external void setIndices(dynamic indices);
}

@JS()
class VertexData {
  external factory VertexData();

  external dynamic get positions;
  external set positions(dynamic v);
  external dynamic get normals;
  external set normals(dynamic v);
  external dynamic get uvs;
  external set uvs(dynamic v);
  external dynamic get uvs2;
  external set uvs2(dynamic v);
  external dynamic get uvs3;
  external set uvs3(dynamic v);
  external dynamic get uvs4;
  external set uvs4(dynamic v);
  external dynamic get uvs5;
  external set uvs5(dynamic v);
  external dynamic get uvs6;
  external set uvs6(dynamic v);
  external dynamic get colors;
  external set colors(dynamic v);
  external dynamic get matricesIndices;
  external set matricesIndices(dynamic v);
  external dynamic get matricesWeights;
  external set matricesWeights(dynamic v);
  external dynamic get matricesIndicesExtra;
  external set matricesIndicesExtra(dynamic v);
  external dynamic get matricesWeightsExtra;
  external set matricesWeightsExtra(dynamic v);
  external dynamic get indices;
  external set indices(dynamic v);
  external void set(dynamic data, String kind);
  external void applyToMesh(Mesh mesh, bool updatable);
  external void applyToGeometry(Geometry geometry, bool updatable);
  external void updateMesh(Mesh mesh, bool updateExtends, bool makeItUnique);
  external void updateGeometry(
      Geometry geometry, bool updateExtends, bool makeItUnique);
  external void transform(Matrix matrix);
  external void merge(VertexData other);
  external dynamic serialize();
  external static VertexData ExtractFromMesh(Mesh mesh, bool copyWhenShared);
  external static VertexData ExtractFromGeometry(
      Geometry geometry, bool copyWhenShared);

  external static VertexData CreateRibbon(dynamic options);
  external static VertexData CreateBox(dynamic options);
  external static VertexData CreateSphere(dynamic options);
  external static VertexData CreateCylinder(dynamic options);
  external static VertexData CreateTorus(dynamic options);
  external static VertexData CreateLines(dynamic options);
  external static VertexData CreateDashedLines(dynamic options);
  external static VertexData CreateGround(dynamic options);
  external static VertexData CreateTiledGround(dynamic options);
  external static VertexData CreateGroundFromHeightMap(dynamic options);
  external static VertexData CreatePlane(dynamic options);
  external static VertexData CreateDisc(dynamic options);
  external static VertexData CreateIcoSphere(dynamic options);
  external static VertexData CreatePolyhedron(dynamic options);
  external static VertexData CreateTorusKnot(dynamic options);

  external static void ComputeNormals(
      dynamic positions, dynamic indices, dynamic normals);

  external static void ImportVertexData(
      dynamic parsedVertexData, Geometry geometry);
}

@JS()
class MeshBuilder {
  external factory MeshBuilder();

  external static Mesh CreateBox(String name, dynamic options, Scene scene);
  external static Mesh CreateSphere(
      String name, dynamic options, dynamic scene);
  external static Mesh CreateDisc(String name, dynamic options, Scene scene);
  external static Mesh CreateIcoSphere(
      String name, dynamic options, Scene scene);
  external static Mesh CreateRibbon(String name, dynamic options, Scene scene);
  external static Mesh CreateCylinder(
      String name, dynamic options, dynamic scene);
  external static Mesh CreateTorus(String name, dynamic options, dynamic scene);
  external static Mesh CreateTorusKnot(
      String name, dynamic options, dynamic scene);
  external static LinesMesh CreateLines(
      String name, dynamic options, Scene scene);
  external static LinesMesh CreateDashedLines(
      String name, dynamic options, Scene scene);
  external static Mesh ExtrudeShape(String name, dynamic options, Scene scene);
  external static Mesh ExtrudeShapeCustom(
      String name, dynamic options, Scene scene);
  external static Mesh CreateLathe(String name, dynamic options, Scene scene);
  external static Mesh CreatePlane(String name, dynamic options, Scene scene);
  external static Mesh CreateGround(
      String name, dynamic options, dynamic scene);
  external static Mesh CreateTiledGround(
      String name, dynamic options, Scene scene);
  external static GroundMesh CreateGroundFromHeightMap(
      String name, String url, dynamic options, Scene scene);
  external static Mesh CreateTube(String name, dynamic options, Scene scene);
  external static Mesh CreatePolyhedron(
      String name, dynamic options, Scene scene);
  external static Mesh CreateDecal(
      String name, AbstractMesh sourceMesh, dynamic options);
}

@JS()
class MeshLODLevel {
  external factory MeshLODLevel([num distance, Mesh mesh]);

  external num get distance;
  external set distance(num v);
  external Mesh get mesh;
  external set mesh(Mesh v);
}

@JS()
class ISimplifier {
  external factory ISimplifier();

  external void simplify(ISimplificationSettings settings,
                         VoidFunc1<Mesh> successCallback, VoidFunc0 errorCallback);
}

@JS()
class ISimplificationSettings {
  external factory ISimplificationSettings();

  external num get quality;
  external set quality(num v);
  external num get distance;
  external set distance(num v);
  external bool get optimizeMesh;
  external set optimizeMesh(bool v);
}

@JS()
class SimplificationSettings {
  external factory SimplificationSettings(
      [num quality, num distance, bool optimizeMesh]);

  external num get quality;
  external set quality(num v);
  external num get distance;
  external set distance(num v);
  external bool get optimizeMesh;
  external set optimizeMesh(bool v);
}

@JS()
class ISimplificationTask {
  external factory ISimplificationTask();

  external List<ISimplificationSettings> get settings;
  external set settings(List<ISimplificationSettings> v);
  external SimplificationType get simplificationType;
  external set simplificationType(SimplificationType v);
  external Mesh get mesh;
  external set mesh(Mesh v);
  external void successCallback();
  external bool get parallelProcessing;
  external set parallelProcessing(bool v);
}

@JS()
class SimplificationQueue {
  external factory SimplificationQueue();

  external dynamic get running;
  external set running(dynamic v);
  external void addTask(ISimplificationTask task);
  external void executeNext();
  external void runSimplification(ISimplificationTask task);
}

enum SimplificationType { QUADRATIC, }

@JS()
class DecimationTriangle {
  external factory DecimationTriangle([List<DecimationVertex> vertices]);

  external List<DecimationVertex> get vertices;
  external set vertices(List<DecimationVertex> v);
  external Vector3 get normal;
  external set normal(Vector3 v);
  external List<num> get error;
  external set error(List<num> v);
  external bool get deleted;
  external set deleted(bool v);
  external bool get isDirty;
  external set isDirty(bool v);
  external num get borderFactor;
  external set borderFactor(num v);
  external bool get deletePending;
  external set deletePending(bool v);
  external num get originalOffset;
  external set originalOffset(num v);
}

@JS()
class DecimationVertex {
  external factory DecimationVertex([Vector3 position, dynamic id]);

  external Vector3 get position;
  external set position(Vector3 v);
  external dynamic get id;
  external set id(dynamic v);
  external QuadraticMatrix get q;
  external set q(QuadraticMatrix v);
  external bool get isBorder;
  external set isBorder(bool v);
  external num get triangleStart;
  external set triangleStart(num v);
  external num get triangleCount;
  external set triangleCount(num v);
  external List<num> get originalOffsets;
  external set originalOffsets(List<num> v);
  external void updatePosition(Vector3 newPosition);
}

@JS()
class QuadraticMatrix {
  external factory QuadraticMatrix([List<num> data]);

  external List<num> get data;
  external set data(List<num> v);
  external num det(dynamic a11, dynamic a12, dynamic a13, dynamic a21,
                   dynamic a22, dynamic a23, dynamic a31, dynamic a32, dynamic a33);
  external void addInPlace(QuadraticMatrix matrix);
  external void addArrayInPlace(List<num> data);
  external QuadraticMatrix add(QuadraticMatrix matrix);
  external static QuadraticMatrix FromData(num a, num b, num c, num d);
  external static List<num> DataFromNumbers(num a, num b, num c, num d);
}

@JS()
class Reference {
  external factory Reference([num vertexId, num triangleId]);

  external num get vertexId;
  external set vertexId(num v);
  external num get triangleId;
  external set triangleId(num v);
}

@JS()
class QuadraticErrorSimplification {
  external factory QuadraticErrorSimplification([Mesh _mesh]);

  external num get syncIterations;
  external set syncIterations(num v);
  external num get aggressiveness;
  external set aggressiveness(num v);
  external num get decimationIterations;
  external set decimationIterations(num v);
  external num get boundingBoxEpsilon;
  external set boundingBoxEpsilon(num v);
  external void simplify(
      ISimplificationSettings settings, VoidFunc1<Mesh> successCallback);
}

@JS()
class Polygon {
  external factory Polygon();

  external static List<Vector2> Rectangle(
      num xmin, num ymin, num xmax, num ymax);
  external static List<Vector2> Circle(
      num radius, num cx, num cy, num numOfSides);
  external static List<Vector2> Parse(String input);
  external static Path2 StartingAt(num x, num y);
}

@JS()
class PolygonMeshBuilder {
  external factory PolygonMeshBuilder(
      [String name, List<Vector2> contours, Scene scene]);

  external PolygonMeshBuilder addHole(List<Vector2> hole);
  external Mesh build(bool updatable, num depth);
}

@JS()
class SubMesh {
  external factory SubMesh(
      [num materialIndex,
      num verticesStart,
      num verticesCount,
      dynamic indexStart,
      num indexCount,
      AbstractMesh mesh,
      Mesh renderingMesh,
      bool createBoundingBox]);

  external num get materialIndex;
  external set materialIndex(num v);
  external num get verticesStart;
  external set verticesStart(num v);
  external num get verticesCount;
  external set verticesCount(num v);
  external dynamic get indexStart;
  external set indexStart(dynamic v);
  external num get indexCount;
  external set indexCount(num v);
  external num get linesIndexCount;
  external set linesIndexCount(num v);

  external List<Vector3> get _lastColliderWorldVertices;
  external set _lastColliderWorldVertices(List<Vector3> v);
  external List<Plane> get _trianglePlanes;
  external set _trianglePlanes(List<Plane> v);
  external Matrix get _lastColliderTransformMatrix;
  external set _lastColliderTransformMatrix(Matrix v);
  external num get _renderId;
  external set _renderId(num v);
  external num get _alphaIndex;
  external set _alphaIndex(num v);
  external num get _distanceToCamera;
  external set _distanceToCamera(num v);
  external num get _id;
  external set _id(num v);

  external bool get IsGlobal;
  external set IsGlobal(bool v);
  external BoundingInfo getBoundingInfo();
  external AbstractMesh getMesh();
  external Mesh getRenderingMesh();
  external Material getMaterial();
  external void refreshBoundingInfo();
  external bool _checkCollision(Collider collider);
  external void updateBoundingInfo(Matrix world);
  external bool isInFrustum(List<Plane> frustumPlanes);
  external void render(bool enableAlphaMode);
  external WebGLBuffer getLinesIndexBuffer(dynamic indices, dynamic engine);
  external bool canIntersects(Ray ray);
  external IntersectionInfo intersects(
      Ray ray, List<Vector3> positions, dynamic indices, bool fastCheck);
  external SubMesh clone(AbstractMesh newMesh, Mesh newRenderingMesh);
  external void dispose();
  external static SubMesh CreateFromIndices(num materialIndex, num startIndex,
                                            num indexCount, AbstractMesh mesh, Mesh renderingMesh);
}

@JS()
class VertexBuffer {
  external factory VertexBuffer(
      [dynamic engine,
      dynamic data,
      String kind,
      bool updatable,
      bool postponeInternalCreation,
      num stride]);

  external bool isUpdatable();
  external dynamic getData();
  external WebGLBuffer getBuffer();
  external num getStrideSize();
  external void create(dynamic data);
  external void update(dynamic data);
  external void updateDirectly(List data, num offset);
  external void dispose();

  external static String get PositionKind;
  external static String get NormalKind;
  external static String get UVKind;
  external static String get UV2Kind;
  external static String get UV3Kind;
  external static String get UV4Kind;
  external static String get UV5Kind;
  external static String get UV6Kind;
  external static String get ColorKind;
  external static String get MatricesIndicesKind;
  external static String get MatricesWeightsKind;
  external static String get MatricesIndicesExtraKind;
  external static String get MatricesWeightsExtraKind;
}

@JS()
class Particle {
  external factory Particle();

  external Vector3 get position;
  external set position(Vector3 v);
  external Vector3 get direction;
  external set direction(Vector3 v);
  external Color4 get color;
  external set color(Color4 v);
  external Color4 get colorStep;
  external set colorStep(Color4 v);
  external num get lifeTime;
  external set lifeTime(num v);
  external num get age;
  external set age(num v);
  external num get size;
  external set size(num v);
  external num get angle;
  external set angle(num v);
  external num get angularSpeed;
  external set angularSpeed(num v);
  external void copyTo(Particle other);
}

@JS()
class ParticleSystem {
  external factory ParticleSystem(
      [String name, num capacity, Scene scene, Effect customEffect]);

  external String get name;
  external set name(String v);
  external static num get BLENDMODE_ONEONE;
  external static num get BLENDMODE_STANDARD;
  external String get id;
  external set id(String v);
  external num get renderingGroupId;
  external set renderingGroupId(num v);
  external dynamic get emitter;
  external set emitter(dynamic v);
  external num get emitRate;
  external set emitRate(num v);
  external num get manualEmitCount;
  external set manualEmitCount(num v);
  external num get updateSpeed;
  external set updateSpeed(num v);
  external num get targetStopDuration;
  external set targetStopDuration(num v);
  external bool get disposeOnStop;
  external set disposeOnStop(bool v);
  external num get minEmitPower;
  external set minEmitPower(num v);
  external num get maxEmitPower;
  external set maxEmitPower(num v);
  external num get minLifeTime;
  external set minLifeTime(num v);
  external num get maxLifeTime;
  external set maxLifeTime(num v);
  external num get minSize;
  external set minSize(num v);
  external num get maxSize;
  external set maxSize(num v);
  external num get minAngularSpeed;
  external set minAngularSpeed(num v);
  external num get maxAngularSpeed;
  external set maxAngularSpeed(num v);
  external Texture get particleTexture;
  external set particleTexture(Texture v);
  external num get layerMask;
  external set layerMask(num v);
  external void onDispose();
  external void updateFunction(List<Particle> particles);
  external num get blendMode;
  external set blendMode(num v);
  external bool get forceDepthWrite;
  external set forceDepthWrite(bool v);
  external Vector3 get gravity;
  external set gravity(Vector3 v);
  external Vector3 get direction1;
  external set direction1(Vector3 v);
  external Vector3 get direction2;
  external set direction2(Vector3 v);
  external Vector3 get minEmitBox;
  external set minEmitBox(Vector3 v);
  external Vector3 get maxEmitBox;
  external set maxEmitBox(Vector3 v);
  external Color4 get color1;
  external set color1(Color4 v);
  external Color4 get color2;
  external set color2(Color4 v);
  external Color4 get colorDead;
  external set colorDead(Color4 v);
  external Color4 get textureMask;
  external set textureMask(Color4 v);
  external void startDirectionFunction(num emitPower, Matrix worldMatrix,
                                       Vector3 directionToUpdate, Particle particle);
  external void startPositionFunction(
      Matrix worldMatrix, Vector3 positionToUpdate, Particle particle);
  external void recycleParticle(Particle particle);
  external num getCapacity();
  external bool isAlive();
  external bool isStarted();
  external void start();
  external void stop();
  external void _appendParticleVertex(
      num index, Particle particle, num offsetX, num offsetY);
  external void animate();
  external num render();
  external void dispose();
  external ParticleSystem clone(String name, dynamic newEmitter);
  external dynamic serialize();
  external static ParticleSystem Parse(
      dynamic parsedParticleSystem, Scene scene, String rootUrl);
}

@JS()
class SolidParticle {
  external factory SolidParticle(
      [num particleIndex,
      num positionIndex,
      ModelShape model,
      num shapeId,
      num idxInShape]);

  external num get idx;
  external set idx(num v);
  external Color4 get color;
  external set color(Color4 v);
  external Vector3 get position;
  external set position(Vector3 v);
  external Vector3 get rotation;
  external set rotation(Vector3 v);
  external Vector4 get quaternion;
  external set quaternion(Vector4 v);
  external Vector3 get scale;
  external set scale(Vector3 v);
  external Vector4 get uvs;
  external set uvs(Vector4 v);
  external Vector3 get velocity;
  external set velocity(Vector3 v);
  external bool get alive;
  external set alive(bool v);
  external num get _pos;
  external set _pos(num v);
  external ModelShape get _model;
  external set _model(ModelShape v);
  external num get shapeId;
  external set shapeId(num v);
  external num get idxInShape;
  external set idxInShape(num v);
}

@JS()
class ModelShape {
  external factory ModelShape(
      [num id,
      List<Vector3> shape,
      List<num> shapeUV,
      VoidFunc3<SolidParticle, num, num> posFunction,
      VoidFunc3<SolidParticle, Vector3, num> vtxFunction]);

  external num get shapeID;
  external set shapeID(num v);
  external List<Vector3> get _shape;
  external set _shape(List<Vector3> v);
  external List<num> get _shapeUV;
  external set _shapeUV(List<num> v);
  external void _positionFunction(SolidParticle particle, num i, num s);
  external void _vertexFunction(SolidParticle particle, Vector3 vertex, num i);
}

@JS()
class SolidParticleSystem {
  external factory SolidParticleSystem(
      [String name, Scene scene, dynamic options]);

  external List<SolidParticle> get particles;
  external set particles(List<SolidParticle> v);
  external num get nbParticles;
  external set nbParticles(num v);
  external bool get billboard;
  external set billboard(bool v);
  external num get counter;
  external set counter(num v);
  external String get name;
  external set name(String v);
  external Mesh get mesh;
  external set mesh(Mesh v);
  external dynamic get vars;
  external set vars(dynamic v);
  external List<dynamic> get pickedParticles;
  external set pickedParticles(List<dynamic> v);
  external Mesh buildMesh();
  external num addShape(Mesh mesh, num nb, dynamic options);
  external void rebuildMesh();
  external void setParticles(num start, num end, bool update);
  external void dispose();
  external void refreshVisibleSize();
  /** Visibility helper : Sets the size of a visibility box, this sets the underlying mesh bounding box.



   */
  external void setVisibilityBox(num size);

  external bool get isAlwaysVisible;
  external set isAlwaysVisible(bool v);

  external bool get isVisibilityBoxLocked;
  external set isVisibilityBoxLocked(bool v);

  external bool get computeParticleRotation;
  external set computeParticleRotation(bool v);

  external bool get computeParticleColor;
  external set computeParticleColor(bool v);

  external bool get computeParticleTexture;
  external set computeParticleTexture(bool v);

  external bool get computeParticleVertex;
  external set computeParticleVertex(bool v);
  external void initParticles();
  external SolidParticle recycleParticle(SolidParticle particle);
  external SolidParticle updateParticle(SolidParticle particle);
  external Vector3 updateParticleVertex(
      SolidParticle particle, Vector3 vertex, num pt);
  external void beforeUpdateParticles(num start, num stop, bool update);
  external void afterUpdateParticles(num start, num stop, bool update);
}

@JS()
class IPhysicsEnginePlugin {
  external factory IPhysicsEnginePlugin();

  external String get name;
  external set name(String v);
  external dynamic initialize(num iterations);
  external void setGravity(Vector3 gravity);
  external Vector3 getGravity();
  external void runOneStep(num delta);
  external dynamic registerMesh(
      AbstractMesh mesh, num impostor, PhysicsBodyCreationOptions options);
  external dynamic registerMeshesAsCompound(
      List<PhysicsCompoundBodyPart> parts, PhysicsBodyCreationOptions options);
  external dynamic unregisterMesh(AbstractMesh mesh);
  external void applyImpulse(
      AbstractMesh mesh, Vector3 force, Vector3 contactPoint);
  external bool createLink(AbstractMesh mesh1, AbstractMesh mesh2,
                           Vector3 pivot1, Vector3 pivot2, dynamic options);
  external void dispose();
  external bool isSupported();
  external void updateBodyPosition(AbstractMesh mesh);
  external dynamic getWorldObject();
  external dynamic getPhysicsBodyOfMesh(AbstractMesh mesh);
}

@JS()
class PhysicsBodyCreationOptions {
  external factory PhysicsBodyCreationOptions();

  external num get mass;
  external set mass(num v);
  external num get friction;
  external set friction(num v);
  external num get restitution;
  external set restitution(num v);
}

@JS()
class PhysicsCompoundBodyPart {
  external factory PhysicsCompoundBodyPart();

  external Mesh get mesh;
  external set mesh(Mesh v);
  external num get impostor;
  external set impostor(num v);
}

@JS()
class PhysicsEngine {
  external factory PhysicsEngine([IPhysicsEnginePlugin plugin]);

  external Vector3 get gravity;
  external set gravity(Vector3 v);
  external void _initialize(Vector3 gravity);
  external void _runOneStep(num delta);
  external void _setGravity(Vector3 gravity);
  external Vector3 _getGravity();
  external dynamic _registerMesh(
      AbstractMesh mesh, num impostor, PhysicsBodyCreationOptions options);
  external dynamic _registerMeshesAsCompound(
      List<PhysicsCompoundBodyPart> parts, PhysicsBodyCreationOptions options);
  external void _unregisterMesh(AbstractMesh mesh);
  external void _applyImpulse(
      AbstractMesh mesh, Vector3 force, Vector3 contactPoint);
  external bool _createLink(AbstractMesh mesh1, AbstractMesh mesh2,
                            Vector3 pivot1, Vector3 pivot2, dynamic options);
  external void _updateBodyPosition(AbstractMesh mesh);
  external void dispose();
  external bool isSupported();
  external dynamic getPhysicsBodyOfMesh(AbstractMesh mesh);
  external String getPhysicsPluginName();
  external static num get NoImpostor;
  external static num get SphereImpostor;
  external static num get BoxImpostor;
  external static num get PlaneImpostor;
  external static num get MeshImpostor;
  external static num get CapsuleImpostor;
  external static num get ConeImpostor;
  external static num get CylinderImpostor;
  external static num get ConvexHullImpostor;
  external static num get HeightmapImpostor;
  external static num get Epsilon;
}

@JS()
class AnaglyphPostProcess extends PostProcess {
  external factory AnaglyphPostProcess(
      [String name,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);
}

@JS()
class BlackAndWhitePostProcess extends PostProcess {
  external factory BlackAndWhitePostProcess(
      [String name,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);
}

@JS()
class BlurPostProcess extends PostProcess {
  external factory BlurPostProcess(
      [String name,
      Vector2 direction,
      num blurWidth,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);

  external Vector2 get direction;
  external set direction(Vector2 v);
  external num get blurWidth;
  external set blurWidth(num v);
}

@JS()
class ColorCorrectionPostProcess extends PostProcess {
  external factory ColorCorrectionPostProcess(
      [String name,
      String colorTableUrl,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);
}

@JS()
class ConvolutionPostProcess extends PostProcess {
  external factory ConvolutionPostProcess(
      [String name,
      List<num> kernel,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);

  external List<num> get kernel;
  external set kernel(List<num> v);

  external static List<num> get EdgeDetect0Kernel;
  external static List<num> get EdgeDetect1Kernel;
  external static List<num> get EdgeDetect2Kernel;
  external static List<num> get SharpenKernel;
  external static List<num> get EmbossKernel;
  external static List<num> get GaussianKernel;
}

@JS()
class DisplayPassPostProcess extends PostProcess {
  external factory DisplayPassPostProcess(
      [String name,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);
}

@JS()
class FilterPostProcess extends PostProcess {
  external factory FilterPostProcess(
      [String name,
      Matrix kernelMatrix,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);

  external Matrix get kernelMatrix;
  external set kernelMatrix(Matrix v);
}

@JS()
class FxaaPostProcess extends PostProcess {
  external factory FxaaPostProcess(
      [String name,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);

  external num get texelWidth;
  external set texelWidth(num v);
  external num get texelHeight;
  external set texelHeight(num v);
}

@JS()
class HDRRenderingPipeline extends PostProcessRenderPipeline {
  external factory HDRRenderingPipeline(
      [String name,
      Scene scene,
      num ratio,
      PostProcess originalPostProcess,
      List<Camera> cameras]);

  external num get gaussCoeff;
  external set gaussCoeff(num v);

  external num get gaussMean;
  external set gaussMean(num v);

  external num get gaussStandDev;
  external set gaussStandDev(num v);

  external num get gaussMultiplier;
  external set gaussMultiplier(num v);

  external num get exposure;
  external set exposure(num v);

  external num get minimumLuminance;
  external set minimumLuminance(num v);

  external num get maximumLuminance;
  external set maximumLuminance(num v);

  external num get luminanceIncreaserate;
  external set luminanceIncreaserate(num v);

  external num get luminanceDecreaseRate;
  external set luminanceDecreaseRate(num v);

  external num get brightThreshold;
  external set brightThreshold(num v);

  external static num get LUM_STEPS;
  external void update();
  external num getCurrentLuminance();
  external num getOutputLuminance();
  external void dispose();
}

@JS()
class LensRenderingPipeline extends PostProcessRenderPipeline {
  external factory LensRenderingPipeline(
      [String name,
      dynamic parameters,
      Scene scene,
      num ratio,
      List<Camera> cameras]);

  external String get LensChromaticAberrationEffect;
  external set LensChromaticAberrationEffect(String v);

  external String get HighlightsEnhancingEffect;
  external set HighlightsEnhancingEffect(String v);

  external String get LensDepthOfFieldEffect;
  external set LensDepthOfFieldEffect(String v);
  external void setEdgeBlur(num amount);
  external void disableEdgeBlur();
  external void setGrainAmount(num amount);
  external void disableGrain();
  external void setChromaticAberration(num amount);
  external void disableChromaticAberration();
  external void setEdgeDistortion(num amount);
  external void disableEdgeDistortion();
  external void setFocusDistance(num amount);
  external void disableDepthOfField();
  external void setAperture(num amount);
  external void setDarkenOutOfFocus(num amount);
  external void enablePentagonBokeh();
  external void disablePentagonBokeh();
  external void enableNoiseBlur();
  external void disableNoiseBlur();
  external void setHighlightsGain(num amount);
  external void setHighlightsThreshold(num amount);
  external void disableHighlights();
  external void dispose(bool disableDepthRender);
}

@JS()
class PassPostProcess extends PostProcess {
  external factory PassPostProcess(
      [String name,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);
}

@JS()
class PostProcess {
  external factory PostProcess(
      [String name,
      String fragmentUrl,
      List<String> parameters,
      List<String> samplers,
      dynamic ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable,
      String defines,
      num textureType]);

  external String get name;
  external set name(String v);
  external void onApply(Effect effect);
  external void onBeforeRender(Effect effect);
  external void onAfterRender(Effect effect);
  external void onSizeChanged();
  external void onActivate(Camera camera);
  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
  external num get renderTargetSamplingMode;
  external set renderTargetSamplingMode(num v);
  external Color4 get clearColor;
  external set clearColor(Color4 v);

  external SmartList<WebGLTexture> get _textures;
  external set _textures(SmartList<WebGLTexture> v);
  external num get _currentRenderTextureInd;
  external set _currentRenderTextureInd(num v);
  external void updateEffect(String defines);
  external bool isReusable();
  external void activate(Camera camera, WebGLTexture sourceTexture);
  external bool get isSupported;
  external set isSupported(bool v);
  external Effect apply();
  external void dispose(Camera camera);
}

@JS()
class PostProcessManager {
  external factory PostProcessManager([Scene scene]);

  external bool _prepareFrame(WebGLTexture sourceTexture);
  external void directRender(
      List<PostProcess> postProcesses, WebGLTexture targetTexture);
  external void _finalizeFrame(bool doNotPresent, WebGLTexture targetTexture,
                               num faceIndex, List<PostProcess> postProcesses);
  external void dispose();
}

@JS()
class RefractionPostProcess extends PostProcess {
  external factory RefractionPostProcess(
      [String name,
      String refractionTextureUrl,
      Color3 color,
      num depth,
      num colorLevel,
      num ratio,
      Camera camera,
      num samplingMode,
      Engine engine,
      bool reusable]);

  external Color3 get color;
  external set color(Color3 v);
  external num get depth;
  external set depth(num v);
  external num get colorLevel;
  external set colorLevel(num v);
  external void dispose(Camera camera);
}

@JS()
class SSAORenderingPipeline extends PostProcessRenderPipeline {
  external factory SSAORenderingPipeline(
      [String name, Scene scene, dynamic ratio, List<Camera> cameras]);

  external String get SSAOOriginalSceneColorEffect;
  external set SSAOOriginalSceneColorEffect(String v);

  external String get SSAORenderEffect;
  external set SSAORenderEffect(String v);

  external String get SSAOBlurHRenderEffect;
  external set SSAOBlurHRenderEffect(String v);

  external String get SSAOBlurVRenderEffect;
  external set SSAOBlurVRenderEffect(String v);

  external String get SSAOCombineRenderEffect;
  external set SSAOCombineRenderEffect(String v);

  external num get totalStrength;
  external set totalStrength(num v);

  external num get radius;
  external set radius(num v);

  external num get area;
  external set area(num v);

  external num get fallOff;
  external set fallOff(num v);

  external num get base;
  external set base(num v);
  external BlurPostProcess getBlurHPostProcess();
  external BlurPostProcess getBlurVPostProcess();
  external void dispose(bool disableDepthRender);
}

@JS()
class StereoscopicInterlacePostProcess extends PostProcess {
  external factory StereoscopicInterlacePostProcess(
      [String name,
      Camera camB,
      PostProcess postProcessA,
      bool isStereoscopicHoriz,
      num samplingMode]);
}

enum TonemappingOperator { Hable, Reinhard, HejiDawson, Photographic, }

@JS()
class TonemapPostProcess extends PostProcess {
  external factory TonemapPostProcess(
      [String name,
      TonemappingOperator operator,
      num exposureAdjustment,
      Camera camera,
      num samplingMode,
      Engine engine,
      num textureFormat]);
}

@JS()
class VolumetricLightScatteringPostProcess extends PostProcess {
  external factory VolumetricLightScatteringPostProcess(
      [String name,
      dynamic ratio,
      Camera camera,
      Mesh mesh,
      num samples,
      num samplingMode,
      Engine engine,
      bool reusable,
      Scene scene]);

  external bool get useCustomMeshPosition;
  external set useCustomMeshPosition(bool v);

  external bool get invert;
  external set invert(bool v);

  external Mesh get mesh;
  external set mesh(Mesh v);

  external bool get useDiffuseColor;
  external set useDiffuseColor(bool v);

  external List<AbstractMesh> get excludedMeshes;
  external set excludedMeshes(List<AbstractMesh> v);

  external num get exposure;
  external set exposure(num v);

  external num get decay;
  external set decay(num v);

  external num get weight;
  external set weight(num v);

  external num get density;
  external set density(num v);
  /* (0.5 means that your postprocess will have a width = canvas.width 0.5 and a height = canvas.height 0.5)







         */
  external bool isReady(SubMesh subMesh, bool useInstances);
  external void setCustomMeshPosition(Vector3 position);
  external Vector3 getCustomMeshPosition();
  external void dispose(Camera camera);
  external RenderTargetTexture getPass();

  external static Mesh CreateDefaultMesh(String name, Scene scene);
}

@JS()
class VRDistortionCorrectionPostProcess extends PostProcess {
  external factory VRDistortionCorrectionPostProcess(
      [String name, Camera camera, bool isRightEye, VRCameraMetrics vrMetrics]);

  external num get aspectRatio;
  external set aspectRatio(num v);
}

@JS()
class ReflectionProbe {
  external factory ReflectionProbe(
      [String name, num size, Scene scene, bool generateMipMaps]);

  external String get name;
  external set name(String v);

  external Vector3 get position;
  external set position(Vector3 v);

  external num get refreshRate;
  external set refreshRate(num v);
  external Scene getScene();
  external RenderTargetTexture get cubeTexture;
  external set cubeTexture(RenderTargetTexture v);
  external List<AbstractMesh> get renderList;
  external set renderList(List<AbstractMesh> v);
  external void attachToMesh(AbstractMesh mesh);
  external void dispose();
}

@JS()
class BoundingBoxRenderer {
  external factory BoundingBoxRenderer([Scene scene]);

  external Color3 get frontColor;
  external set frontColor(Color3 v);
  external Color3 get backColor;
  external set backColor(Color3 v);
  external bool get showBackLines;
  external set showBackLines(bool v);
  external SmartList<BoundingBox> get renderList;
  external set renderList(SmartList<BoundingBox> v);
  external void reset();
  external void render();
  external void dispose();
}

@JS()
class DepthRenderer {
  external factory DepthRenderer([Scene scene, num type]);

  external bool isReady(SubMesh subMesh, bool useInstances);
  external RenderTargetTexture getDepthMap();
  external void dispose();
}

@JS()
class EdgesRenderer {
  external factory EdgesRenderer(
      [AbstractMesh source, num epsilon, bool checkVerticesInsteadOfIndices]);

  external num get edgesWidthScalerForOrthographic;
  external set edgesWidthScalerForOrthographic(num v);
  external num get edgesWidthScalerForPerspective;
  external set edgesWidthScalerForPerspective(num v);
  external void dispose();
  external void _generateEdgesLines();
  external void render();
}

@JS()
class OutlineRenderer {
  external factory OutlineRenderer([Scene scene]);

  external void render(SubMesh subMesh, _InstancesBatch batch, bool useOverlay);
  external bool isReady(SubMesh subMesh, bool useInstances);
}

@JS()
class RenderingGroup {
  external factory RenderingGroup([num index, Scene scene]);

  external num get index;
  external set index(num v);
  external void onBeforeTransparentRendering();
  external bool render(
      VoidFunc3<SmartList<SubMesh>, SmartList<SubMesh>,
          SmartList<SubMesh>> customRenderFunction);
  external void prepare();
  external void dispatch(SubMesh subMesh);
}

@JS()
class RenderingManager {
  external factory RenderingManager([Scene scene]);

  external static num get MAX_RENDERINGGROUPS;
  external void render(
      VoidFunc3<SmartList<SubMesh>, SmartList<SubMesh>,
          SmartList<SubMesh>> customRenderFunction,
      List<AbstractMesh> activeMeshes,
      bool renderParticles,
      bool renderSprites);
  external void reset();
  external void dispatch(SubMesh subMesh);
}

@JS()
class Sprite {
  external factory Sprite([String name, SpriteManager manager]);

  external String get name;
  external set name(String v);
  external Vector3 get position;
  external set position(Vector3 v);
  external Color4 get color;
  external set color(Color4 v);
  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
  external num get angle;
  external set angle(num v);
  external num get cellIndex;
  external set cellIndex(num v);
  external num get invertU;
  external set invertU(num v);
  external num get invertV;
  external set invertV(num v);
  external bool get disposeWhenFinishedAnimating;
  external set disposeWhenFinishedAnimating(bool v);
  external List<Animation> get animations;
  external set animations(List<Animation> v);
  external bool get isPickable;
  external set isPickable(bool v);
  external ActionManager get actionManager;
  external set actionManager(ActionManager v);

  external num get size;
  external set size(num v);
  external void playAnimation(num from, num to, bool loop, num delay);
  external void stopAnimation();
  external void _animate(num deltaTime);
  external void dispose();
}

@JS()
class SpriteManager {
  external factory SpriteManager(
      [String name,
      String imgUrl,
      num capacity,
      num cellSize,
      Scene scene,
      num epsilon,
      num samplingMode]);

  external String get name;
  external set name(String v);
  external num get cellSize;
  external set cellSize(num v);
  external List<Sprite> get sprites;
  external set sprites(List<Sprite> v);
  external num get renderingGroupId;
  external set renderingGroupId(num v);
  external num get layerMask;
  external set layerMask(num v);
  external void onDispose();
  external bool get fogEnabled;
  external set fogEnabled(bool v);
  external bool get isPickable;
  external set isPickable(bool v);
  external PickingInfo intersects(
      Ray ray, Camera camera, Func1<Sprite, bool> predicate, bool fastCheck);
  external void render();
  external void dispose();
}

@JS()
class AndOrNotEvaluator {
  external factory AndOrNotEvaluator();

  external static bool Eval(
      String query, Func1<dynamic, bool> evaluateCallback);
}

@JS()
class IAssetTask {
  external factory IAssetTask();

  external void onSuccess(IAssetTask task);
  external void onError(IAssetTask task);
  external bool get isCompleted;
  external set isCompleted(bool v);
  external dynamic run(Scene scene, VoidFunc0 onSuccess, VoidFunc0 onError);
}

@JS()
class MeshAssetTask {
  external factory MeshAssetTask(
      [String name, dynamic meshesNames, String rootUrl, String sceneFilename]);

  external String get name;
  external set name(String v);
  external dynamic get meshesNames;
  external set meshesNames(dynamic v);
  external String get rootUrl;
  external set rootUrl(String v);
  external String get sceneFilename;
  external set sceneFilename(String v);
  external List<AbstractMesh> get loadedMeshes;
  external set loadedMeshes(List<AbstractMesh> v);
  external List<ParticleSystem> get loadedParticleSystems;
  external set loadedParticleSystems(List<ParticleSystem> v);
  external List<Skeleton> get loadedSkeletons;
  external set loadedSkeletons(List<Skeleton> v);
  external void onSuccess(IAssetTask task);
  external void onError(IAssetTask task);
  external bool get isCompleted;
  external set isCompleted(bool v);
  external void run(Scene scene, VoidFunc0 onSuccess, VoidFunc0 onError);
}

@JS()
class TextFileAssetTask {
  external factory TextFileAssetTask([String name, String url]);

  external String get name;
  external set name(String v);
  external String get url;
  external set url(String v);
  external void onSuccess(IAssetTask task);
  external void onError(IAssetTask task);
  external bool get isCompleted;
  external set isCompleted(bool v);
  external String get text;
  external set text(String v);
  external void run(Scene scene, VoidFunc0 onSuccess, VoidFunc0 onError);
}

@JS()
class BinaryFileAssetTask {
  external factory BinaryFileAssetTask([String name, String url]);

  external String get name;
  external set name(String v);
  external String get url;
  external set url(String v);
  external void onSuccess(IAssetTask task);
  external void onError(IAssetTask task);
  external bool get isCompleted;
  external set isCompleted(bool v);
  external ArrayBuffer get data;
  external set data(ArrayBuffer v);
  external void run(Scene scene, VoidFunc0 onSuccess, VoidFunc0 onError);
}

@JS()
class ImageAssetTask {
  external factory ImageAssetTask([String name, String url]);

  external String get name;
  external set name(String v);
  external String get url;
  external set url(String v);
  external void onSuccess(IAssetTask task);
  external void onError(IAssetTask task);
  external bool get isCompleted;
  external set isCompleted(bool v);
  external ImageElement get image;
  external set image(ImageElement v);
  external void run(Scene scene, VoidFunc0 onSuccess, VoidFunc0 onError);
}

@JS()
class TextureAssetTask {
  external factory TextureAssetTask(
      [String name, String url, bool noMipmap, bool invertY, num samplingMode]);

  external String get name;
  external set name(String v);
  external String get url;
  external set url(String v);
  external bool get noMipmap;
  external set noMipmap(bool v);
  external bool get invertY;
  external set invertY(bool v);
  external num get samplingMode;
  external set samplingMode(num v);
  external void onSuccess(IAssetTask task);
  external void onError(IAssetTask task);
  external bool get isCompleted;
  external set isCompleted(bool v);
  external Texture get texture;
  external set texture(Texture v);
  external void run(Scene scene, VoidFunc0 onSuccess, VoidFunc0 onError);
}

@JS()
class AssetsManager {
  external factory AssetsManager([Scene scene]);

  external void onFinish(List<IAssetTask> tasks);
  external void onTaskSuccess(IAssetTask task);
  external void onTaskError(IAssetTask task);
  external bool get useDefaultLoadingScreen;
  external set useDefaultLoadingScreen(bool v);
  external IAssetTask addMeshTask(String taskName, dynamic meshesNames,
                                  String rootUrl, String sceneFilename);
  external IAssetTask addTextFileTask(String taskName, String url);
  external IAssetTask addBinaryFileTask(String taskName, String url);
  external IAssetTask addImageTask(String taskName, String url);
  external IAssetTask addTextureTask(String taskName, String url, bool noMipmap,
                                     bool invertY, num samplingMode);
  external AssetsManager reset();
  external AssetsManager load();
}

@JS()
class Database {
  external factory Database(
      [String urlToScene, Func1<bool, dynamic> callbackManifestChecked]);

  external static bool get IsUASupportingBlobStorage;
  external static bool get IDBStorageEnabled;

  external static String parseURL(String url);
  external static String ReturnFullUrlLocation(String url);
  external void checkManifestFile();
  external void openAsync(dynamic successCallback, dynamic errorCallback);
  external void loadImageFromDB(String url, ImageElement image);
}

@JS()
class FilesInput {
  external factory FilesInput(
      [Engine p_engine,
      Scene p_scene,
      CanvasElement p_canvas,
      dynamic p_sceneLoadedCallback,
      dynamic p_progressCallback,
      dynamic p_additionnalRenderLoopLogicCallback,
      dynamic p_textureLoadingCallback,
      dynamic p_startingProcessingFilesCallback]);

  external static List<dynamic> get FilesTextures;
  external static List<dynamic> get FilesToLoad;
  external void monitorElementForDragNDrop(Element p_elementToMonitor);
  external void loadFiles(dynamic event);
  external void reload();
}

@JS()
class Gamepads {
  external factory Gamepads([VoidFunc1<Gamepad> ongamedpadconnected]);

  external void dispose();
}

@JS()
class StickValues {
  external factory StickValues([dynamic x, dynamic y]);

  external dynamic get x;
  external set x(dynamic v);
  external dynamic get y;
  external set y(dynamic v);
}

@JS()
class Gamepad {
  external factory Gamepad([String id, num index, dynamic browserGamepad]);

  external String get id;
  external set id(String v);
  external num get index;
  external set index(num v);
  external dynamic get browserGamepad;
  external set browserGamepad(dynamic v);
  external void onleftstickchanged(VoidFunc1<StickValues> callback);
  external void onrightstickchanged(VoidFunc1<StickValues> callback);
  external StickValues get leftStick;
  external set leftStick(StickValues v);
  external StickValues get rightStick;
  external set rightStick(StickValues v);
  external void update();
}

@JS()
class GenericPad extends Gamepad {
  external factory GenericPad([String id, num index, dynamic gamepad]);

  external String get id;
  external set id(String v);
  external num get index;
  external set index(num v);
  external dynamic get gamepad;
  external set gamepad(dynamic v);
  external void onbuttondown(VoidFunc1<num> callback);
  external void onbuttonup(VoidFunc1<num> callback);
  external void update();
}

enum Xbox360Button { A, B, X, Y, Start, Back, LB, RB, LeftStick, RightStick, }
enum Xbox360Dpad { Up, Down, Left, Right, }

@JS()
class Xbox360Pad extends Gamepad {
  external factory Xbox360Pad();

  external void onlefttriggerchanged(VoidFunc1<num> callback);
  external void onrighttriggerchanged(VoidFunc1<num> callback);
  external num get leftTrigger;
  external set leftTrigger(num v);
  external num get rightTrigger;
  external set rightTrigger(num v);
  external void onbuttondown(VoidFunc1<Xbox360Button> callback);
  external void onbuttonup(VoidFunc1<Xbox360Button> callback);
  external void ondpaddown(VoidFunc1<Xbox360Dpad> callback);
  external void ondpadup(VoidFunc1<Xbox360Dpad> callback);

  external num get buttonA;
  external set buttonA(num v);
  external num get buttonB;
  external set buttonB(num v);
  external num get buttonX;
  external set buttonX(num v);
  external num get buttonY;
  external set buttonY(num v);
  external num get buttonStart;
  external set buttonStart(num v);
  external num get buttonBack;
  external set buttonBack(num v);
  external num get buttonLB;
  external set buttonLB(num v);
  external num get buttonRB;
  external set buttonRB(num v);
  external num get buttonLeftStick;
  external set buttonLeftStick(num v);
  external num get buttonRightStick;
  external set buttonRightStick(num v);
  external num get dPadUp;
  external set dPadUp(num v);
  external num get dPadDown;
  external set dPadDown(num v);
  external num get dPadLeft;
  external set dPadLeft(num v);
  external num get dPadRight;
  external set dPadRight(num v);
  external void update();
}

@JS()
class ILoadingScreen {
  external factory ILoadingScreen();

  external void displayLoadingUI();
  external void hideLoadingUI();
  external String get loadingUIBackgroundColor;
  external set loadingUIBackgroundColor(String v);
  external String get loadingUIText;
  external set loadingUIText(String v);
}

@JS()
class DefaultLoadingScreen {
  external factory DefaultLoadingScreen(
      [CanvasElement _renderingCanvas,
      String _loadingText,
      String _loadingDivBackgroundColor]);

  external void displayLoadingUI();
  external void hideLoadingUI();
  external String get loadingUIText;
  external set loadingUIText(String v);
  external String get loadingUIBackgroundColor;
  external set loadingUIBackgroundColor(String v);
}

@JS()
class SceneOptimization {
  external factory SceneOptimization([num priority]);

  external num get priority;
  external set priority(num v);
  external bool apply(Scene scene);
}

@JS()
class TextureOptimization extends SceneOptimization {
  external factory TextureOptimization([num priority, num maximumSize]);

  external num get priority;
  external set priority(num v);
  external num get maximumSize;
  external set maximumSize(num v);
  external bool apply(Scene scene);
}

@JS()
class HardwareScalingOptimization extends SceneOptimization {
  external factory HardwareScalingOptimization(
      [num priority, num maximumScale]);

  external num get priority;
  external set priority(num v);
  external num get maximumScale;
  external set maximumScale(num v);
  external bool apply(Scene scene);
}

@JS()
class ShadowsOptimization extends SceneOptimization {
  external factory ShadowsOptimization();

  external bool apply(Scene scene);
}

@JS()
class PostProcessesOptimization extends SceneOptimization {
  external factory PostProcessesOptimization();

  external bool apply(Scene scene);
}

@JS()
class LensFlaresOptimization extends SceneOptimization {
  external factory LensFlaresOptimization();

  external bool apply(Scene scene);
}

@JS()
class ParticlesOptimization extends SceneOptimization {
  external factory ParticlesOptimization();

  external bool apply(Scene scene);
}

@JS()
class RenderTargetsOptimization extends SceneOptimization {
  external factory RenderTargetsOptimization();

  external bool apply(Scene scene);
}

@JS()
class MergeMeshesOptimization extends SceneOptimization {
  external factory MergeMeshesOptimization();

  external static bool get _UpdateSelectionTree;
  external static bool get UpdateSelectionTree;
  external bool apply(Scene scene, bool updateSelectionTree);
}

@JS()
class SceneOptimizerOptions {
  external factory SceneOptimizerOptions(
      [num targetFrameRate, num trackerDuration]);

  external num get targetFrameRate;
  external set targetFrameRate(num v);
  external num get trackerDuration;
  external set trackerDuration(num v);
  external List<SceneOptimization> get optimizations;
  external set optimizations(List<SceneOptimization> v);

  external static SceneOptimizerOptions LowDegradationAllowed(
      num targetFrameRate);
  external static SceneOptimizerOptions ModerateDegradationAllowed(
      num targetFrameRate);
  external static SceneOptimizerOptions HighDegradationAllowed(
      num targetFrameRate);
}

@JS()
class SceneOptimizer {
  external factory SceneOptimizer();

  external static void _CheckCurrentState(
      Scene scene,
      SceneOptimizerOptions options,
      num currentPriorityLevel,
      VoidFunc0 onSuccess,
      VoidFunc0 onFailure);
  external static void OptimizeAsync(Scene scene, SceneOptimizerOptions options,
                                     VoidFunc0 onSuccess, VoidFunc0 onFailure);
}

@JS()
class SceneSerializer {
  external factory SceneSerializer();

  external static dynamic Serialize(Scene scene);
  external static dynamic SerializeMesh(
      dynamic toSerialize, bool withParents, bool withChildren);
}

@JS()
class SmartList<T> {
  external factory SmartList([num capacity]);

  external List<T> get data;
  external set data(List<T> v);
  external num get length;
  external set length(num v);
  external void push(dynamic value);
  external void pushNoDuplicate(dynamic value);
  external void sort(dynamic compareFn);
  external void reset();
  external void concat(dynamic array);
  external void concatWithNoDuplicate(dynamic array);
  external num indexOf(dynamic value);
}

@JS()
class SmartCollection {
  external factory SmartCollection([num capacity]);

  external num get count;
  external set count(num v);
  external dynamic get items;
  external set items(dynamic v);
  external num add(dynamic key, dynamic item);
  external num remove(dynamic key);
  external num removeItemOfIndex(num index);
  external num indexOf(dynamic key);
  external dynamic item(dynamic key);
  external List<dynamic> getAllKeys();
  external dynamic getKeyByIndex(num index);
  external dynamic getItemByIndex(num index);
  external void empty();
  external void forEach(VoidFunc1<dynamic> block);
}

@JS()
class Tags {
  external factory Tags();

  external static void EnableFor(dynamic obj);
  external static void DisableFor(dynamic obj);
  external static bool HasTags(dynamic obj);
  external static dynamic GetTags(dynamic obj, bool asString);
  external static void AddTagsTo(dynamic obj, String tagsString);
  external static void _AddTagTo(dynamic obj, String tag);
  external static void RemoveTagsFrom(dynamic obj, String tagsString);
  external static void _RemoveTagFrom(dynamic obj, String tag);
  external static bool MatchesQuery(dynamic obj, String tagsQuery);
}

@JS()
class DDSInfo {
  external factory DDSInfo();

  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
  external num get mipmapCount;
  external set mipmapCount(num v);
  external bool get isFourCC;
  external set isFourCC(bool v);
  external bool get isRGB;
  external set isRGB(bool v);
  external bool get isLuminance;
  external set isLuminance(bool v);
  external bool get isCube;
  external set isCube(bool v);
}

@JS()
class DDSTools {
  external factory DDSTools();

  external static DDSInfo GetDDSInfo(dynamic arrayBuffer);

  external static void UploadDDSLevels(WebGLRenderingContext gl, dynamic ext,
                                       dynamic arrayBuffer, DDSInfo info, bool loadMipmaps, num faces);
}

@JS()
class TGATools {
  external factory TGATools();

  external static dynamic GetTGAHeader(Uint8List data);
  external static void UploadContent(WebGLRenderingContext gl, Uint8List data);
  external static Uint8List _getImageData8bits(
      dynamic header,
      Uint8List palettes,
      Uint8List pixel_data,
      num y_start,
      num y_step,
      num y_end,
      num x_start,
      num x_step,
      num x_end);
  external static Uint8List _getImageData16bits(
      dynamic header,
      Uint8List palettes,
      Uint8List pixel_data,
      num y_start,
      num y_step,
      num y_end,
      num x_start,
      num x_step,
      num x_end);
  external static Uint8List _getImageData24bits(
      dynamic header,
      Uint8List palettes,
      Uint8List pixel_data,
      num y_start,
      num y_step,
      num y_end,
      num x_start,
      num x_step,
      num x_end);
  external static Uint8List _getImageData32bits(
      dynamic header,
      Uint8List palettes,
      Uint8List pixel_data,
      num y_start,
      num y_step,
      num y_end,
      num x_start,
      num x_step,
      num x_end);
  external static Uint8List _getImageDataGrey8bits(
      dynamic header,
      Uint8List palettes,
      Uint8List pixel_data,
      num y_start,
      num y_step,
      num y_end,
      num x_start,
      num x_step,
      num x_end);
  external static Uint8List _getImageDataGrey16bits(
      dynamic header,
      Uint8List palettes,
      Uint8List pixel_data,
      num y_start,
      num y_step,
      num y_end,
      num x_start,
      num x_step,
      num x_end);
}

@JS()
class IAnimatable {
  external factory IAnimatable();

  external List<Animation> get animations;
  external set animations(List<Animation> v);
}

@JS()
class ISize {
  external factory ISize();

  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
}

@JS()
class Tools {
  external factory Tools();

  external static String get BaseUrl;
  external static dynamic get CorsBehavior;
  external static bool get UseFallbackTexture;
  external static dynamic Instantiate(String className);
  external static dynamic GetConstructorName(dynamic obj);
  external static String ToHex(num i);
  external static void SetImmediate(VoidFunc0 action);
  external static bool IsExponentOfTwo(num value);
  external static num GetExponentOfTwo(num value, num max);
  external static String GetFilename(String path);
  external static String GetDOMTextContent(Element element);
  external static num ToDegrees(num angle);
  external static num ToRadians(num angle);
  external static String EncodeArrayBufferTobase64(ArrayBuffer buffer);
  external static dynamic ExtractMinAndMaxIndexed(
      dynamic positions, dynamic indices, num indexStart, num indexCount);
  external static dynamic ExtractMinAndMax(
      dynamic positions, num start, num count);
  external static List<dynamic> MakeArray(
      dynamic obj, bool allowsNullUndefined);
  external static String GetPointerPrefix();
  external static void QueueNewFrame(dynamic func);
  external static void RequestFullscreen(dynamic element);
  external static void ExitFullscreen();
  external static String CleanUrl(String url);
  external static ImageElement LoadImage(
      dynamic url, dynamic onload, dynamic onerror, dynamic database);
  external static void LoadFile(
      String url,
      VoidFunc1<dynamic> callback,
      VoidFunc0 progressCallBack,
      dynamic database,
      bool useArrayBuffer,
      VoidFunc0 onError);
  external static void ReadFileAsDataURL(
      dynamic fileToLoad, dynamic callback, dynamic progressCallback);
  external static void ReadFile(dynamic fileToLoad, dynamic callback,
                                dynamic progressCallBack, bool useArrayBuffer);
  external static String FileAsURL(String content);
  external static num Clamp(num value, num min, num max);
  external static num Sign(num value);
  external static String Format(num value, num decimals);
  external static void CheckExtends(Vector3 v, Vector3 min, Vector3 max);
  external static bool WithinEpsilon(num a, num b, num epsilon);
  external static void DeepCopy(dynamic source, dynamic destination,
                                List<String> doNotCopyList, List<String> mustCopyList);
  external static bool IsEmpty(dynamic obj);
  external static void RegisterTopRootEvents(List<dynamic> events);
  external static void UnregisterTopRootEvents(List<dynamic> events);
  external static void DumpFramebuffer(
      num width, num height, Engine engine, VoidFunc1<String> successCallback);
  external static void CreateScreenshot(Engine engine, Camera camera,
                                        dynamic size, VoidFunc1<String> successCallback);
  external static bool ValidateXHRData(XMLHttpRequest xhr, num dataType);

  external static num get errorsCount;
  external static void OnNewCacheEntry(String entry);
  external static num get NoneLogLevel;
  external static num get MessageLogLevel;
  external static num get WarningLogLevel;
  external static num get ErrorLogLevel;
  external static num get AllLogLevel;

  external static void Log(String message);

  external static void Warn(String message);

  external static void Error(String message);

  external static String get LogCache;
  external static void ClearLogCache();
  external static num get LogLevels;

  external static num get PerformanceNoneLogLevel;
  external static num get PerformanceUserMarkLogLevel;
  external static num get PerformanceConsoleLogLevel;
  external static num get PerformanceLogLevel;
  external static void _StartPerformanceCounterDisabled(
      String counterName, bool condition);
  external static void _EndPerformanceCounterDisabled(
      String counterName, bool condition);
  external static void _StartUserMark(String counterName, bool condition);
  external static void _EndUserMark(String counterName, bool condition);
  external static void _StartPerformanceConsole(
      String counterName, bool condition);
  external static void _EndPerformanceConsole(
      String counterName, bool condition);
  external static void StartPerformanceCounter(
      String counterName, bool condition);
  external static void EndPerformanceCounter(
      String counterName, bool condition);
  external static num get Now;
}

@JS()
class AsyncLoop {
  external factory AsyncLoop(
      [num iterations,
      VoidFunc1<AsyncLoop> _fn,
      VoidFunc0 _successCallback,
      num offset]);

  external num get iterations;
  external set iterations(num v);

  external num get index;
  external set index(num v);
  external void executeNext();
  external void breakLoop();

  external static AsyncLoop Run(num iterations, VoidFunc1<AsyncLoop> _fn,
                                VoidFunc0 _successCallback, num offset);

  external static void SyncAsyncForLoop(
      num iterations,
      num syncedIterations,
      VoidFunc1<num> fn,
      VoidFunc0 callback,
      Func0<bool> breakFunction,
      num timeout);
}

enum JoystickAxis { X, Y, Z, }

@JS()
class VirtualJoystick {
  external factory VirtualJoystick([bool leftJoystick]);

  external bool get reverseLeftRight;
  external set reverseLeftRight(bool v);
  external bool get reverseUpDown;
  external set reverseUpDown(bool v);
  external Vector3 get deltaPosition;
  external set deltaPosition(Vector3 v);
  external bool get pressed;
  external set pressed(bool v);
  external void setJoystickSensibility(num newJoystickSensibility);
  external void setJoystickColor(String newColor);
  external void setActionOnTouch(Func0<dynamic> action);
  external void setAxisForLeftRight(JoystickAxis axis);
  external void setAxisForUpDown(JoystickAxis axis);
  external void releaseCanvas();
}

@JS()
class VRDeviceOrientationFreeCamera extends FreeCamera {
  external factory VRDeviceOrientationFreeCamera(
      [String name, Vector3 position, Scene scene, bool compensateDistortion]);

  external num get _alpha;
  external set _alpha(num v);
  external num get _beta;
  external set _beta(num v);
  external num get _gamma;
  external set _gamma(num v);
  external void _onOrientationEvent(DeviceOrientationEvent evt);
  external void attachControl(Element element, bool noPreventDefault);
  external void detachControl(Element element);
}

@JS()
class WebVRFreeCamera extends FreeCamera {
  external factory WebVRFreeCamera(
      [String name, Vector3 position, Scene scene, bool compensateDistortion]);

  external dynamic get _hmdDevice;
  external set _hmdDevice(dynamic v);
  external dynamic get _sensorDevice;
  external set _sensorDevice(dynamic v);
  external dynamic get _cacheState;
  external set _cacheState(dynamic v);
  external Quaternion get _cacheQuaternion;
  external set _cacheQuaternion(Quaternion v);
  external Vector3 get _cacheRotation;
  external set _cacheRotation(Vector3 v);
  external bool get _vrEnabled;
  external set _vrEnabled(bool v);
  external void _checkInputs();
  external void attachControl(Element element, bool noPreventDefault);
  external void detachControl(Element element);
}

@JS()
class IOctreeContainer<T> {
  external factory IOctreeContainer();

  external List<OctreeBlock<T>> get blocks;
  external set blocks(List<OctreeBlock<T>> v);
}

@JS()
class Octree<T> {
  external factory Octree(
      [VoidFunc2<T, OctreeBlock<T>> creationFunc,
      num maxBlockCapacity,
      num maxDepth]);

  external num get maxDepth;
  external set maxDepth(num v);
  external List<OctreeBlock<T>> get blocks;
  external set blocks(List<OctreeBlock<T>> v);
  external List<T> get dynamicContent;
  external set dynamicContent(List<T> v);
  external void update(Vector3 worldMin, Vector3 worldMax, List<T> entries);
  external void addMesh(T entry);
  external SmartList<T> select(List<Plane> frustumPlanes, bool allowDuplicate);
  external SmartList<T> intersects(
      Vector3 sphereCenter, num sphereRadius, bool allowDuplicate);
  external SmartList<T> intersectsRay(Ray ray);
  external static void _CreateBlocks(
      Vector3 worldMin,
      Vector3 worldMax,
      List<T> entries,
      num maxBlockCapacity,
      num currentDepth,
      num maxDepth,
      IOctreeContainer<T> target,
      VoidFunc2<T, OctreeBlock<T>> creationFunc);
  external static void CreationFuncForMeshes(
      AbstractMesh entry, OctreeBlock<AbstractMesh> block);
  external static void CreationFuncForSubMeshes(
      SubMesh entry, OctreeBlock<SubMesh> block);
}

@JS()
class OctreeBlock<T> {
  external factory OctreeBlock(
      [Vector3 minPoint,
      Vector3 maxPoint,
      num capacity,
      num depth,
      num maxDepth,
      VoidFunc2<T, OctreeBlock<T>> creationFunc]);

  external List<T> get entries;
  external set entries(List<T> v);
  external List<OctreeBlock<T>> get blocks;
  external set blocks(List<OctreeBlock<T>> v);

  external num get capacity;
  external set capacity(num v);
  external Vector3 get minPoint;
  external set minPoint(Vector3 v);
  external Vector3 get maxPoint;
  external set maxPoint(Vector3 v);
  external void addEntry(T entry);
  external void addEntries(List<T> entries);
  external void select(
      List<Plane> frustumPlanes, SmartList<T> selection, bool allowDuplicate);
  external void intersects(Vector3 sphereCenter, num sphereRadius,
                           SmartList<T> selection, bool allowDuplicate);
  external void intersectsRay(Ray ray, SmartList<T> selection);
  external void createInnerBlocks();
}

@JS()
class ShadowGenerator {
  external factory ShadowGenerator([num mapSize, IShadowLight light]);

  external static num get FILTER_NONE;
  external static num get FILTER_VARIANCESHADOWMAP;
  external static num get FILTER_POISSONSAMPLING;
  external static num get FILTER_BLURVARIANCESHADOWMAP;

  external num get blurScale;
  external set blurScale(num v);

  external bool get forceBackFacesOnly;
  external set forceBackFacesOnly(bool v);
  external num get bias;
  external set bias(num v);
  external num get blurBoxOffset;
  external set blurBoxOffset(num v);
  external num get filter;
  external set filter(num v);
  external bool get useVarianceShadowMap;
  external set useVarianceShadowMap(bool v);
  external bool get usePoissonSampling;
  external set usePoissonSampling(bool v);
  external bool get useBlurVarianceShadowMap;
  external set useBlurVarianceShadowMap(bool v);
  external bool isReady(SubMesh subMesh, bool useInstances);
  external RenderTargetTexture getShadowMap();
  external RenderTargetTexture getShadowMapForRendering();
  external IShadowLight getLight();
  external Matrix getTransformMatrix();
  external num getDarkness();
  external void setDarkness(num darkness);
  external void setTransparencyShadow(bool hasShadow);
  external void dispose();
  external dynamic serialize();
  external static ShadowGenerator Parse(
      dynamic parsedShadowGenerator, Scene scene);
}

@JS()
class BaseTexture {
  external factory BaseTexture([Scene scene]);

  external String get name;
  external set name(String v);
  external num get delayLoadState;
  external set delayLoadState(num v);
  external bool get hasAlpha;
  external set hasAlpha(bool v);
  external bool get getAlphaFromRGB;
  external set getAlphaFromRGB(bool v);
  external num get level;
  external set level(num v);
  external bool get isCube;
  external set isCube(bool v);
  external bool get isRenderTarget;
  external set isRenderTarget(bool v);
  external List<Animation> get animations;
  external set animations(List<Animation> v);
  external void onDispose();
  external num get coordinatesIndex;
  external set coordinatesIndex(num v);
  external num get coordinatesMode;
  external set coordinatesMode(num v);
  external num get wrapU;
  external set wrapU(num v);
  external num get wrapV;
  external set wrapV(num v);
  external num get anisotropicFilteringLevel;
  external set anisotropicFilteringLevel(num v);
  external num get _cachedAnisotropicFilteringLevel;
  external set _cachedAnisotropicFilteringLevel(num v);

  external WebGLTexture get _texture;
  external set _texture(WebGLTexture v);
  external Scene getScene();
  external Matrix getTextureMatrix();
  external Matrix getReflectionTextureMatrix();
  external WebGLTexture getInternalTexture();
  external bool isReady();
  external ISize getSize();
  external ISize getBaseSize();
  external void scale(num ratio);
  external bool get canRescale;
  external set canRescale(bool v);
  external void _removeFromCache(String url, bool noMipmap);
  external WebGLTexture _getFromCache(String url, bool noMipmap, num sampling);
  external void delayLoad();
  external BaseTexture clone();
  external void releaseInternalTexture();
  external void dispose();
  external dynamic serialize();
}

@JS()
class CubeTexture extends BaseTexture {
  external factory CubeTexture(
      [String rootUrl,
      Scene scene,
      List<String> extensions,
      bool noMipmap,
      List<String> files]);

  external String get url;
  external set url(String v);
  external num get coordinatesMode;
  external set coordinatesMode(num v);

  external static CubeTexture CreateFromImages(
      List<String> files, Scene scene, bool noMipmap);
  external CubeTexture clone();
  external void delayLoad();
  external Matrix getReflectionTextureMatrix();
  external static CubeTexture Parse(
      dynamic parsedTexture, Scene scene, String rootUrl);
  external dynamic serialize();
}

@JS()
class DynamicTexture extends Texture {
  external factory DynamicTexture(
      [String name,
      dynamic options,
      Scene scene,
      bool generateMipMaps,
      num samplingMode]);

  external bool get canRescale;
  external set canRescale(bool v);
  external void scale(num ratio);
  external CanvasRenderingContext2D getContext();
  external void clear();
  external void update(bool invertY);
  external void drawText(String text, num x, num y, String font, String color,
                         String clearColor, bool invertY, bool update);
  external DynamicTexture clone();
}

@JS()
class MirrorTexture extends RenderTargetTexture {
  external factory MirrorTexture(
      [String name, num size, Scene scene, bool generateMipMaps]);

  external Plane get mirrorPlane;
  external set mirrorPlane(Plane v);
  external MirrorTexture clone();
  external dynamic serialize();
}

@JS()
class RawTexture extends Texture {
  external factory RawTexture(
      [ArrayBufferView data,
      num width,
      num height,
      num format,
      Scene scene,
      bool generateMipMaps,
      bool invertY,
      num samplingMode]);

  external num get format;
  external set format(num v);
  external void update(ArrayBufferView data);
  external static RawTexture CreateLuminanceTexture(
      ArrayBufferView data,
      num width,
      num height,
      Scene scene,
      bool generateMipMaps,
      bool invertY,
      num samplingMode);
  external static RawTexture CreateLuminanceAlphaTexture(
      ArrayBufferView data,
      num width,
      num height,
      Scene scene,
      bool generateMipMaps,
      bool invertY,
      num samplingMode);
  external static RawTexture CreateAlphaTexture(
      ArrayBufferView data,
      num width,
      num height,
      Scene scene,
      bool generateMipMaps,
      bool invertY,
      num samplingMode);
  external static RawTexture CreateRGBTexture(
      ArrayBufferView data,
      num width,
      num height,
      Scene scene,
      bool generateMipMaps,
      bool invertY,
      num samplingMode);
  external static RawTexture CreateRGBATexture(
      ArrayBufferView data,
      num width,
      num height,
      Scene scene,
      bool generateMipMaps,
      bool invertY,
      num samplingMode);
}

@JS()
class RenderTargetTexture extends Texture {
  external factory RenderTargetTexture(
      [String name,
      dynamic size,
      Scene scene,
      bool generateMipMaps,
      bool doNotChangeAspectRatio,
      num type,
      bool isCube]);

  external bool get isCube;
  external set isCube(bool v);
  external static num get _REFRESHRATE_RENDER_ONCE;
  external static num get _REFRESHRATE_RENDER_ONEVERYFRAME;
  external static num get _REFRESHRATE_RENDER_ONEVERYTWOFRAMES;
  external static num get REFRESHRATE_RENDER_ONCE;
  external static num get REFRESHRATE_RENDER_ONEVERYFRAME;
  external static num get REFRESHRATE_RENDER_ONEVERYTWOFRAMES;
  external List<AbstractMesh> get renderList;
  external set renderList(List<AbstractMesh> v);
  external bool get renderParticles;
  external set renderParticles(bool v);
  external bool get renderSprites;
  external set renderSprites(bool v);
  external num get coordinatesMode;
  external set coordinatesMode(num v);
  external void onBeforeRender(num faceIndex);
  external void onAfterRender(num faceIndex);
  external void onAfterUnbind();
  external void onClear(Engine engine);
  external Camera get activeCamera;
  external set activeCamera(Camera v);
  external void customRenderFunction(
      SmartList<SubMesh> opaqueSubMeshes,
      SmartList<SubMesh> transparentSubMeshes,
      SmartList<SubMesh> alphaTestSubMeshes,
      VoidFunc0 beforeTransparents);

  external bool get _generateMipMaps;
  external set _generateMipMaps(bool v);

  external List<String> get _waitingRenderList;
  external set _waitingRenderList(List<String> v);
  external void resetRefreshCounter();
  external num get refreshRate;
  external set refreshRate(num v);
  external bool _shouldRender();
  external bool isReady();
  external num getRenderSize();
  external bool get canRescale;
  external set canRescale(bool v);
  external void scale(num ratio);
  external Matrix getReflectionTextureMatrix();
  external void resize(dynamic size, bool generateMipMaps);
  external void render(bool useCameraPostProcess, bool dumpForDebug);
  external void renderToTarget(
      num faceIndex,
      List<AbstractMesh> currentRenderList,
      bool useCameraPostProcess,
      bool dumpForDebug);
  external RenderTargetTexture clone();
  external dynamic serialize();
}

@JS()
class Texture extends BaseTexture {
  external factory Texture(
      [String url,
      Scene scene,
      bool noMipmap,
      bool invertY,
      num samplingMode,
      VoidFunc0 onLoad,
      VoidFunc0 onError,
      dynamic buffer,
      bool deleteBuffer]);

  external static num get NEAREST_SAMPLINGMODE;
  external static num get BILINEAR_SAMPLINGMODE;
  external static num get TRILINEAR_SAMPLINGMODE;
  external static num get EXPLICIT_MODE;
  external static num get SPHERICAL_MODE;
  external static num get PLANAR_MODE;
  external static num get CUBIC_MODE;
  external static num get PROJECTION_MODE;
  external static num get SKYBOX_MODE;
  external static num get INVCUBIC_MODE;
  external static num get EQUIRECTANGULAR_MODE;
  external static num get FIXED_EQUIRECTANGULAR_MODE;
  external static num get CLAMP_ADDRESSMODE;
  external static num get WRAP_ADDRESSMODE;
  external static num get MIRROR_ADDRESSMODE;
  external String get url;
  external set url(String v);
  external num get uOffset;
  external set uOffset(num v);
  external num get vOffset;
  external set vOffset(num v);
  external num get uScale;
  external set uScale(num v);
  external num get vScale;
  external set vScale(num v);
  external num get uAng;
  external set uAng(num v);
  external num get vAng;
  external set vAng(num v);
  external num get wAng;
  external set wAng(num v);

  external bool get _invertY;
  external set _invertY(bool v);

  external num get _samplingMode;
  external set _samplingMode(num v);
  external void delayLoad();
  external void updateSamplingMode(num samplingMode);
  external Matrix getTextureMatrix();
  external Matrix getReflectionTextureMatrix();
  external Texture clone();
  external dynamic serialize();
  external static Texture CreateFromBase64String(
      String data,
      String name,
      Scene scene,
      bool noMipmap,
      bool invertY,
      num samplingMode,
      VoidFunc0 onLoad,
      VoidFunc0 onError);
  external static BaseTexture Parse(
      dynamic parsedTexture, Scene scene, String rootUrl);
}

@JS()
class VideoTexture extends Texture {
  external factory VideoTexture(
      [String name,
      List<String> urls,
      Scene scene,
      bool generateMipMaps,
      bool invertY,
      num samplingMode]);

  external VideoElement get video;
  external set video(VideoElement v);
  external bool update();
}

@JS()
class CannonJSPlugin {
  external factory CannonJSPlugin([bool _useDeltaForWorldStep]);

  external String get name;
  external set name(String v);
  external void initialize(num iterations);
  external void runOneStep(num delta);
  external void setGravity(Vector3 gravity);
  external Vector3 getGravity();
  external dynamic registerMesh(
      AbstractMesh mesh, num impostor, PhysicsBodyCreationOptions options);
  external dynamic registerMeshesAsCompound(
      List<PhysicsCompoundBodyPart> parts, PhysicsBodyCreationOptions options);
  external void unregisterMesh(AbstractMesh mesh);
  external void applyImpulse(
      AbstractMesh mesh, Vector3 force, Vector3 contactPoint);
  external void updateBodyPosition(AbstractMesh mesh);
  external bool createLink(
      AbstractMesh mesh1, AbstractMesh mesh2, Vector3 pivot1, Vector3 pivot2);
  external void dispose();
  external bool isSupported();
  external dynamic getWorldObject();
  external dynamic getPhysicsBodyOfMesh(AbstractMesh mesh);
}

@JS()
class OimoJSPlugin {
  external factory OimoJSPlugin();

  external String get name;
  external set name(String v);
  external void initialize(num iterations);
  external void setGravity(Vector3 gravity);
  external Vector3 getGravity();
  external dynamic registerMesh(
      AbstractMesh mesh, num impostor, PhysicsBodyCreationOptions options);
  external dynamic registerMeshesAsCompound(
      List<PhysicsCompoundBodyPart> parts, PhysicsBodyCreationOptions options);
  external void unregisterMesh(AbstractMesh mesh);
  external void updateBodyPosition(AbstractMesh mesh);
  external void applyImpulse(
      AbstractMesh mesh, Vector3 force, Vector3 contactPoint);
  external bool createLink(AbstractMesh mesh1, AbstractMesh mesh2,
                           Vector3 pivot1, Vector3 pivot2, dynamic options);
  external void dispose();
  external bool isSupported();
  external dynamic getWorldObject();
  external dynamic getPhysicsBodyOfMesh(AbstractMesh mesh);
  external void runOneStep(num time);
}

@JS()
class PostProcessRenderEffect {
  external factory PostProcessRenderEffect(
      [Engine engine,
      String name,
      Func0<PostProcess> getPostProcess,
      bool singleInstance]);

  external String get _name;
  external set _name(String v);
  external void applyParameters(PostProcess postProcess);

  external bool get isSupported;
  external set isSupported(bool v);
  external void _update();
  external void addPass(PostProcessRenderPass renderPass);
  external void removePass(PostProcessRenderPass renderPass);
  external void addRenderEffectAsPass(PostProcessRenderEffect renderEffect);
  external void getPass(String passName);
  external void emptyPasses();
  external dynamic _attachCameras(List<Camera> cameras);
  external dynamic _detachCameras(List<Camera> cameras);
  external dynamic _enable(List<Camera> cameras);
  external dynamic _disable(List<Camera> cameras);
  external PostProcess getPostProcess(Camera camera);
}

@JS()
class PostProcessRenderPass {
  external factory PostProcessRenderPass(
      [Scene scene,
      String name,
      num size,
      List<Mesh> renderList,
      VoidFunc0 beforeRender,
      VoidFunc0 afterRender]);

  external String get _name;
  external set _name(String v);
  external num _incRefCount();
  external num _decRefCount();
  external void _update();
  external void setRenderList(List<Mesh> renderList);
  external RenderTargetTexture getRenderTexture();
}

@JS()
class PostProcessRenderPipeline {
  external factory PostProcessRenderPipeline([Engine engine, String name]);

  external String get _name;
  external set _name(String v);

  external bool get isSupported;
  external set isSupported(bool v);
  external void addEffect(PostProcessRenderEffect renderEffect);
  external dynamic _enableEffect(String renderEffectName, List<Camera> cameras);
  external dynamic _disableEffect(
      String renderEffectName, List<Camera> cameras);
  external dynamic _attachCameras(List<Camera> cameras, bool unique);
  external dynamic _detachCameras(List<Camera> cameras);
  external dynamic _enableDisplayOnlyPass(
      dynamic passName, List<Camera> cameras);
  external dynamic _disableDisplayOnlyPass(List<Camera> cameras);
  external void _update();
  external void dispose();
}

@JS()
class PostProcessRenderPipelineManager {
  external factory PostProcessRenderPipelineManager();

  external void addPipeline(PostProcessRenderPipeline renderPipeline);
  external dynamic attachCamerasToRenderPipeline(
      String renderPipelineName, List<Camera> cameras, bool unique);
  external dynamic detachCamerasFromRenderPipeline(
      String renderPipelineName, List<Camera> cameras);
  external dynamic enableEffectInPipeline(
      String renderPipelineName, String renderEffectName, List<Camera> cameras);
  external dynamic disableEffectInPipeline(
      String renderPipelineName, String renderEffectName, List<Camera> cameras);
  external dynamic enableDisplayOnlyPassInPipeline(
      String renderPipelineName, String passName, List<Camera> cameras);
  external dynamic disableDisplayOnlyPassInPipeline(
      String renderPipelineName, List<Camera> cameras);
  external void update();
}

@JS()
class CustomProceduralTexture extends ProceduralTexture {
  external factory CustomProceduralTexture(
      [String name,
      dynamic texturePath,
      num size,
      Scene scene,
      Texture fallbackTexture,
      bool generateMipMaps]);

  external bool isReady();
  external void render(bool useCameraPostProcess);
  external void updateTextures();
  external void updateShaderUniforms();
  external bool get animate;
  external set animate(bool v);
}

@JS()
class ProceduralTexture extends Texture {
  external factory ProceduralTexture(
      [String name,
      dynamic size,
      dynamic fragment,
      Scene scene,
      Texture fallbackTexture,
      bool generateMipMaps,
      bool isCube]);

  external bool get isCube;
  external set isCube(bool v);

  external bool get _generateMipMaps;
  external set _generateMipMaps(bool v);
  external bool get isEnabled;
  external set isEnabled(bool v);
  external void onGenerated();

  external List<Texture> get _textures;
  external set _textures(List<Texture> v);
  external void reset();
  external bool isReady();
  external void resetRefreshCounter();
  external void setFragment(dynamic fragment);
  external num get refreshRate;
  external set refreshRate(num v);
  external bool _shouldRender();
  external num getRenderSize();
  external void resize(dynamic size, dynamic generateMipMaps);
  external ProceduralTexture setTexture(String name, Texture texture);
  external ProceduralTexture setFloat(String name, num value);
  external ProceduralTexture setFloats(String name, List<num> value);
  external ProceduralTexture setColor3(String name, Color3 value);
  external ProceduralTexture setColor4(String name, Color4 value);
  external ProceduralTexture setVector2(String name, Vector2 value);
  external ProceduralTexture setVector3(String name, Vector3 value);
  external ProceduralTexture setMatrix(String name, Matrix value);
  external void render(bool useCameraPostProcess);
  external ProceduralTexture clone();
  external void dispose();
}
