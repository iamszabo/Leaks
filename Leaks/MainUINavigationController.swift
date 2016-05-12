import Foundation
import UIKit

class MainUINavigationController: UITabBarController, UITabBarControllerDelegate {

  let mainViewController = MainViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    print("init main nav coder")
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    print("init main nav nib")
  }

  deinit {
    print("deinit main nav")
  }

  override func viewWillAppear(animated: Bool) {
    let icon1 = UITabBarItem(title: "Main", image: nil, selectedImage: nil)
    mainViewController.tabBarItem = icon1
    let controllers = [mainViewController] // array of the root view controllers displayed by the tab bar interface
    self.viewControllers = controllers
  }
}

class SideUINavigationController: UITabBarController, UITabBarControllerDelegate {

  let sideViewController = SideViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    print("init side nav coder ")
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    print("init side nav nib")
  }

  deinit {
    print("deinit side nav")
  }

  override func viewWillAppear(animated: Bool) {
    let icon1 = UITabBarItem(title: "Side", image: nil, selectedImage: nil)
    sideViewController.tabBarItem = icon1
    let controllers = [sideViewController] // array of the root view controllers displayed by the tab bar interface
    self.viewControllers = controllers
  }
}