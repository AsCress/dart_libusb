import 'dart:ffi';

base class Timeval extends Struct {
  @Long()
  external int tv_sec;

  @Susecond()
  external int tv_usec;
}

/// [Long] on Linux
/// [Int] on macOS
/// [Long] on Windows
@AbiSpecificIntegerMapping({
  Abi.linuxArm: Int32(),
  Abi.linuxArm64: Int64(),
  Abi.linuxIA32: Int32(),
  Abi.linuxX64: Int64(),
  Abi.macosArm64: Int32(),
  Abi.macosX64: Int32(),
  Abi.windowsArm64: Int32(),
  Abi.windowsIA32: Int32(),
  Abi.windowsX64: Int32(),
})
base class Susecond extends AbiSpecificInteger {
  const Susecond();
}

/// [Long] on Linux
/// [Long] on macOS
/// [LongLong] on Windows
@AbiSpecificIntegerMapping({
  Abi.linuxArm: Int32(),
  Abi.linuxArm64: Int64(),
  Abi.linuxIA32: Int32(),
  Abi.linuxX64: Int64(),
  Abi.macosArm64: Int64(),
  Abi.macosX64: Int64(),
  Abi.windowsArm64: Int64(),
  Abi.windowsIA32: Int64(),
  Abi.windowsX64: Int64(),
})
base class Ssize extends AbiSpecificInteger {
  const Ssize();
}
