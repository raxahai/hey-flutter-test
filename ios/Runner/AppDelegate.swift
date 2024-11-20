import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let controller = window?.rootViewController as! FlutterViewController
        let metaChannel = FlutterMethodChannel(name: "com.heyflutter.test_task/meta",
                                               binaryMessenger: controller.binaryMessenger)
        metaChannel.setMethodCallHandler { (call, result) in
            if call.method == "setMetadata" {
                guard let args = call.arguments as? [String: Any],
                      let key = args["key"] as? String,
                      let value = args["value"] as? String else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid arguments", details: nil))
                    return
                }
                let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist")
                if let plistPath = plistPath, let plistDict = NSMutableDictionary(contentsOfFile: plistPath) {
                    plistDict[key] = value
                    plistDict.write(toFile: plistPath, atomically: true)
                    GMSServices.provideAPIKey(value) // Google Maps API-KEY
                    result("Metadata set successfully")
                } else {
                    result(FlutterError(code: "ERROR", message: "Failed to update Info.plist", details: nil))
                }
            } else if call.method == "getMetadata" {
                guard let args = call.arguments as? [String: Any],
                      let key = args["key"] as? String else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Key is required", details: nil))
                    return
                }
                let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist")
                if let plistPath = plistPath, let plistDict = NSMutableDictionary(contentsOfFile: plistPath) {
                    result(plistDict[key])
                } else {
                    result(FlutterError(code: "ERROR", message: "Failed to get key from Info.plist", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
