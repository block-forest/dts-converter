# TypeScript to Dart type definition converter

# Installation

### Requirements

* Dart SDK 1.13 or greater on your path

### Install

    $> pub global activate --source git https://github.com/blockforest/dts-converter

# Usage

Two modes are supported by the converter.

### Mode 1: Create a full project package

This way, you create a package to be reused, committed to github, uploaded to pub.

    $> mkdir fancy_package
    $> cd fancy_package
    $> dts_converter --source /path/to/sources --source-library Chart --create-project

### Mode 2: Create an internal package

This way, you create a package inside of your existing Dart project.

    $> cd fancy_existing_project
    $> dts_converter --source /path/to/sources --source-library Chart

The newly generated internal package will be added to your root pubspec.
If this doesn't make any sense, use Mode 1.

### Command line arguments

    # --source          The path (relative or absolute) to the Typescript .d.ts source file(s) to convert.
    # --source-library  The name of the javascript library to convert.
    # --target          The path (relative!) the generated Dart library will be written to (defaults to 'lib')
    # --target-library  The name of the dart library to be generated (defaults to same name as defined in --target).
    # --create-project  Create full dart project with pubspec and library file (optional)

# Example

You can find a conversion result here https://github.com/blockforest/dts-converter/test/chart-generated/chart/chart.d.dart
It was generated from this source: https://github.com/blockforest/dts-converter/test/chart/chart.d.ts

## Try for yourself

* Check out the git source of this project
* Open Terminal
* cd to the root of this project


    $> cd dts-converter
    $> dart bin/dts_converter.dart --source test/chart --target test/chart-generated --source-library Chart --target-library chart

* Marvel at the result

## Issues and bugs

Please file reports on the
[GitHub Issue Tracker](https://github.com/blockforest/dts-converter).

## Disclaimer

We're in beta!

## Next Steps

* Cover more edge cases, f.ex. as seen in THREE.js https://github.com/DefinitelyTyped/DefinitelyTyped/blob/cc3d223a946f661eff871787edeb0fcb8f0db156/threejs/three.d.ts
* Make the converter work with 'export module' sources.
