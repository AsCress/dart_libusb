# dart_libusb

[![pub package](https://img.shields.io/pub/v/dart_libusb.svg)](https://pub.dev/packages/dart_libusb)
[![package publisher](https://img.shields.io/pub/publisher/dart_libusb.svg)](https://pub.dev/packages/dart_libusb/publisher)

A fork of the [`libusb`](https://pub.dev/packages/libusb) Dart package
(originally by [woodemi](https://github.com/woodemi/libusb.dart)), updated to work
with current versions of `ffi`, and `ffigen`.

Provides Dart FFI bindings for [libusb](https://github.com/libusb/libusb),
enabling cross-platform USB device access from Dart/Flutter on Linux, macOS, and
Windows.

## Why this fork?

The upstream `libusb` package is no longer maintained and is incompatible with modern tooling.

Changes made in this fork:
- Updated all dependency constraints to current versions.
- Regenerated `lib/src/libusb.ffigen.dart` with `dart run ffigen`.
- Updated `libusb_base.dart`: added `base` modifier to `Timeval`, `Susecond`, and `Ssize`; replaced `pkg_ffi.Long` with `Long` from `dart:ffi` directly

## Supported platforms

- Windows 
- Linux
- macOS

## Usage
 
Add the dependency:
 
```yaml
dependencies:
  dart_libusb: ^1.0.0
```
 
Loading the `libusb-1.0` dynamic library is left to the application —
point to a bundled copy, a system installation, or any other path:
 
```dart
import 'dart:ffi';
import 'package:dart_libusb/libusb.dart';
 
final libusb = Libusb(DynamicLibrary.open('/path/to/libusb-1.0.dylib'));
```
 
See the [`example/`](example/) directory for a working sample.

## Contributing
 
Issues and PRs are welcome at
[github.com/AsCress/dart_libusb](https://github.com/AsCress/dart_libusb).
 
To run the examples or regenerate the bindings, you need to set up the
native library and header locally.
 
### Prepare the dynamic library
 
The examples load the library from a `libusb-1.0/` folder in the repo root.
 
**macOS**
 
```sh
brew install libusb
cp $(brew --prefix libusb)/lib/libusb-1.0.dylib libusb-1.0/
```
 
**Linux**
 
```sh
sudo apt install libusb-1.0-0
cp /usr/lib/x86_64-linux-gnu/libusb-1.0.so.0 libusb-1.0/libusb-1.0.so
```
 
**Windows**
 
Download the latest release archive (`libusb-1.0.xx.7z`) from
[github.com/libusb/libusb/releases](https://github.com/libusb/libusb/releases),
extract it, then copy the DLL:
 
```
copy libusb-1.0.xx\MS64\dll\libusb-1.0.dll libusb-1.0\
```
 
### Prepare libusb.h
 
Download the desired release tarball from
[github.com/libusb/libusb/releases](https://github.com/libusb/libusb/releases),
extract it, and copy the header into the repo:
 
```sh
# example for 1.0.29
tar xjf libusb-1.0.29.tar.bz2
cp libusb-1.0.29/libusb/libusb.h libusb-1.0/
```
 
### Regenerate bindings
 
#### 1. Install LLVM
 
- **Windows**: `winget install -e --id LLVM.LLVM`
- **macOS**: `brew install llvm`
- **Linux**: `sudo apt install libclang-dev`
#### 2. Run ffigen
 
```sh
dart run ffigen
```
