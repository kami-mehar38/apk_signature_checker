import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:apk_signature_checker/apk_signature_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _apkSignatureKey = 'Unknown';
  final _apkSignatureCheckerPlugin = ApkSignatureChecker();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String apkSignatureKey;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      apkSignatureKey = await _apkSignatureCheckerPlugin.getApkSignature() ??
          'Unknown apk signatuer key';
    } on PlatformException {
      apkSignatureKey = 'Failed to get apk signatuer key.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    debugPrint(apkSignatureKey);

    setState(() {
      _apkSignatureKey = apkSignatureKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_apkSignatureKey\n'),
        ),
      ),
    );
  }
}
