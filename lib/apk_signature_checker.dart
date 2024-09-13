import 'apk_signature_checker_platform_interface.dart';

class ApkSignatureChecker {
  Future<String?> getApkSignature() {
    return ApkSignatureCheckerPlatform.instance.getApkSignature();
  }
}
