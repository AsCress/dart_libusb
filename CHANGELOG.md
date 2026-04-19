## 1.0.0
 
- Forked from [`libusb`](https://pub.dev/packages/libusb)
- Updated `ffigen` to `^20.1.1`, `ffi` to `^2.2.0`, Dart SDK to `^3.11.0`
- Regenerated `lib/src/libusb.ffigen.dart` with `dart run ffigen`
- Updated `libusb_base.dart`: added `base` modifier to `Timeval`, `Susecond`, and `Ssize`; replaced `pkg_ffi.Long` with `Long` from `dart:ffi` directly