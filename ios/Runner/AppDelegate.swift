import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      // 1
            let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
            
            // 2
            let deviceChannel = FlutterMethodChannel(name: "GET_DETAIL_CHANNEL",
                                                     binaryMessenger: controller.binaryMessenger)
            
            // 3
            prepareMethodHandler(deviceChannel: deviceChannel)
            
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func prepareMethodHandler(deviceChannel: FlutterMethodChannel) {
            
            // 4
            deviceChannel.setMethodCallHandler({
                (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                
                // 5
                if call.method == "goToWeb" {
                    
                    // 6
                    self.receiveDeviceModel(result: result)
                }
                else {
                    // 9
                    result(FlutterMethodNotImplemented)
                    return
                }
                
            })
        }
    private func receiveDeviceModel(result: FlutterResult) {
         print("--------------------------")
        UIWebView.loadRequest(webviewInstance)(NSURLRequest(URL: NSURL(string: "google.ca")!)) 
       }
    
}
