# TypeScript definition to Dart JS interop facade converter

# Tests

* Check out the git source of this project
* Open Terminal
* cd to the root of this project


    $> cd dts-converter
    # To convert ChartJS:
    $> dart bin/dts_converter.dart --source test/input/chart --target test/output/chartjs_facade --source-library Chart --target-library chartjs_facade --create-project

    # To convert THREE.js:
    $> dart bin/dts_converter.dart --source test/input/three --target test/output/threejs_facade --source-library THREE --target-library threejs_facade --create-project

    # To convert BabylonJS:
    $> dart bin/dts_converter.dart --source test/input/babylon --target test/output/babylonjs_facade --source-library BABYLON --target-library babylonjs_facade --create-project

* Marvel at the result

## Issues and bugs

Please file reports on the
[GitHub Issue Tracker](https://github.com/blockforest/dts-converter/issues).