import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    let rootNavController = UINavigationController(rootViewController: StartViewController())
    window?.rootViewController = rootNavController
    window?.makeKeyAndVisible()
    return true
  }
}
