import 'package:flutter_test/flutter_test.dart';
import 'package:apk_signature_checker/apk_signature_checker.dart';
import 'package:apk_signature_checker/apk_signature_checker_platform_interface.dart';
import 'package:apk_signature_checker/apk_signature_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockApkSignatureCheckerPlatform
    with MockPlatformInterfaceMixin
    implements ApkSignatureCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ApkSignatureCheckerPlatform initialPlatform = ApkSignatureCheckerPlatform.instance;

  test('$MethodChannelApkSignatureChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelApkSignatureChecker>());
  });

  test('getPlatformVersion', () async {
    ApkSignatureChecker apkSignatureCheckerPlugin = ApkSignatureChecker();
    MockApkSignatureCheckerPlatform fakePlatform = MockApkSignatureCheckerPlatform();
    ApkSignatureCheckerPlatform.instance = fakePlatform;

    expect(await apkSignatureCheckerPlugin.getPlatformVersion(), '42');
  });
}
