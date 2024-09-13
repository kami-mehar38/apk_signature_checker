# Apk Signature Checker Plugin

## Motive

In mobile app development, especially for Android, there is always a risk of code tampering and security vulnerabilities. With the open nature of the Android platform, it is possible for malicious actors to inspect and modify your APK file. This can lead to unauthorized changes or security breaches.

To address these concerns, it is crucial to ensure that your app is signed with the correct release certificate. The **Apk Signature Checker** plugin helps you verify that the APK running on the device is signed with your official release certificate. By using this plugin, you can prevent others from tampering with your app and ensure that it remains secure and authentic.

**Apk Signature Checker** is a Flutter plugin that provides a way to verify the signature of the APK file at runtime. This plugin is particularly useful for applications that need to ensure they are running with the correct signature, which can help with verifying the integrity and authenticity of the application.

## Features

- **Verify APK Signature**: Get the SHA-256 signature of the APK at runtime to ensure that it matches the expected signature.
- **No Setup Required**: This plugin is straightforward to use and does not require additional setup beyond adding it to your `pubspec.yaml`.

## Platform Support

- **Android**: This plugin currently supports only Android. It is designed to work seamlessly with your Flutter Android applications.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  apk_signature_checker:
    path: ./path_to_your_plugin
```

## Usage

To use the plugin, follow these steps:

1. Import the Plugin:

```dart
import 'package:apk_signature_checker/apk_signature_checker.dart';
```

1. Get the APK Signature: You can get the APK signature using the following code snippet:

```dart
void checkSignature() async {
  final signature = await ApkSignatureChecker().getApkSignature();
  print('APK Signature: $signature');
}
```

## Contact
For any questions or issues, please open an [issue](https://github.com/kami-mehar38/apk_signature_checker/issues) on the repository or [Email Me](mailto:kamranramzan098@gmail.com).

## Show Your Support
If you find this plugin useful, please consider giving it a star on GitHub and liking it on pub.dev!

⭐ Star the repository on [GitHub](https://github.com/kami-mehar38/apk_signature_checker)
❤️ Like this plugin on [pub.dev](https://pub.dev/)