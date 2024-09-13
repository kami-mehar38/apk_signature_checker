import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'apk_signature_checker_method_channel.dart';

abstract class ApkSignatureCheckerPlatform extends PlatformInterface {
  /// Constructs a ApkSignatureCheckerPlatform.
  ApkSignatureCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ApkSignatureCheckerPlatform _instance =
      MethodChannelApkSignatureChecker();

  /// The default instance of [ApkSignatureCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelApkSignatureChecker].
  static ApkSignatureCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ApkSignatureCheckerPlatform] when
  /// they register themselves.
  static set instance(ApkSignatureCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getApkSignature() {
    throw UnimplementedError('getApkSignature() has not been implemented.');
  }
}
