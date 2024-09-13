package com.signature.checker.apk_signature_checker

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.PackageManager.NameNotFoundException
import android.util.Base64
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException


/** ApkSignatureCheckerPlugin */
class ApkSignatureCheckerPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  // Declare a context variable to hold the application context
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "apk_signature_checker")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getApkSignature") {
      try {
        // Get the package name of the current app
        val packageName = context.packageName
        // Fetch APK signature
        val signature = getApkSignature(packageName)
        result.success(signature)
      } catch (e: Exception) {
        result.error("UNAVAILABLE", "Could not get signature", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  /**
   * Retrieve the SHA-256 signature of the specified APK.
   *
   * @param pm The package manager.
   * @param packageName The package name.
   * @return The SHA-256 signature as a Base64-encoded string, or null if the signature is not available.
   * @throws PackageManager.NameNotFoundException If the package name is not found.
   * @throws NoSuchAlgorithmException If the SHA-256 algorithm is not available.
   */
  @kotlin.Throws(NameNotFoundException::class, NoSuchAlgorithmException::class)
  private fun getApkSignature(packageName: String): String? {
    return try {
      // Get the APK signature using PackageManager
      val packageInfo: PackageInfo = context.packageManager.getPackageInfo(packageName, PackageManager.GET_SIGNATURES)
      for (signature in packageInfo.signatures) {
        val signatureBytes = signature.toByteArray()
        val md = MessageDigest.getInstance("SHA-256")
        val digest = md.digest(signatureBytes)
        // Convert digest (byte array) to hex string
        val hexString = StringBuilder()
          for (i in digest.indices) {
                val hex = String.format("%02X", digest[i])  // Convert each byte to hex
                hexString.append(hex)
                if (i < digest.size - 1) {
                    hexString.append(":")  // Add colon between hex values
                }
            }
            
          return hexString.toString()
      }
      null
    } catch (e: Exception) {
      null
    }
  }
}
