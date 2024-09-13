import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'apk_signature_checker_platform_interface.dart';

/// An implementation of [ApkSignatureCheckerPlatform] that uses method channels.
class MethodChannelApkSignatureChecker extends ApkSignatureCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('apk_signature_checker');

  @override
  Future<String?> getApkSignature() async {
    try {
      final String? signature =
          await methodChannel.invokeMethod<String>('getApkSignature');
      return signature;
    } on PlatformException {
      return null;
    }
  }
}
