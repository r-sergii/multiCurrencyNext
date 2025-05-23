// multiplatform_io.dart

import 'dart:io' as io;

import 'platform.dart';

Platform getPlatform() {
  if (io.Platform.isAndroid) return Platform.android;
  if (io.Platform.isIOS) return Platform.ios;
  if (io.Platform.isWindows) return Platform.windows;
  if (io.Platform.isMacOS) return Platform.macos;
  if (io.Platform.isLinux) return Platform.linux;
  throw UnimplementedError('Unsupported');
}
