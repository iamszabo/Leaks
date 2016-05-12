import UIKit
import SnapKit
import RxCocoa
import RxSwift

protocol MainControllerDelegate: class {
  func forgetMain()
}

protocol SideControllerDelegate: class {
  func forgetSide()
}

class StartViewController: UIViewController, MainControllerDelegate, SideControllerDelegate {

  let button = UIButton()
  let button2 = UIButton()
  let disposeBag = DisposeBag()

  func forgetMain() {
    self.dismissViewControllerAnimated(false) { [unowned self] in
      self.presentSide()
    }
  }

  func presentSide() {
    let ctrl = SideUINavigationController()
    ctrl.sideViewController.sideDelegate = self
    self.presentViewController(ctrl, animated: false, completion: nil)
  }

  func forgetSide() {
    self.dismissViewControllerAnimated(false) { [unowned self] in
      self.presentMain()
    }
  }

  func presentMain() {
    let ctrl = MainUINavigationController()
    ctrl.mainViewController.mainDelegate = self
    self.presentViewController(ctrl, animated: false, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  deinit {
    print("deinit start view controller")
  }

  convenience init() {
    self.init(nibName: nil, bundle: nil)
    print("init start view controller")
  }

  override func viewDidLayoutSubviews() {
    view.backgroundColor = UIColor.brownColor()
    view.addSubview(button)
    button.backgroundColor = UIColor.greenColor()
    button.snp_makeConstraints { make in
      make.center.equalTo(view)
      make.width.height.equalTo(40)
    }
    button.rx_tap.subscribeNext { [unowned self] _ in
      self.presentMain()
    }.addDisposableTo(disposeBag)

    view.addSubview(button2)
    button2.backgroundColor = UIColor.yellowColor()
    button2.snp_makeConstraints { make in
      make.centerY.equalTo(view)
      make.centerX.equalTo(view).inset(50)
      make.width.height.equalTo(40)
    }
    button2.rx_tap.subscribeNext { [unowned self] _ in
      self.presentSide()
    }.addDisposableTo(disposeBag)
  }
}

class MainViewController: UIViewController {

  let button = UIButton()
  let disposeBag = DisposeBag()
  var mainDelegate: MainControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  deinit {
    print("deinit main view controller")
  }

  convenience init() {
    self.init(nibName: nil, bundle: nil)
    print("init main view controller")
  }

  override func viewWillAppear(animated: Bool) {
    view.backgroundColor = UIColor.greenColor()
    view.addSubview(button)
    button.backgroundColor = UIColor.brownColor()
    button.snp_makeConstraints { make in
      make.center.equalTo(view)
      make.width.height.equalTo(40)
    }

    button.rx_tap.subscribeNext { [unowned self] _ in
      self.mainDelegate?.forgetMain()
    }.addDisposableTo(disposeBag)
  }
}

class SideViewController: UIViewController {

  let button = UIButton()
  let disposeBag = DisposeBag()
  var sideDelegate: SideControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  convenience init() {
    self.init(nibName: nil, bundle: nil)
    print("init side view controller")
  }

  deinit {
    print("deinit side view controller")
  }

  override func viewWillAppear(animated: Bool) {
    view.backgroundColor = UIColor.yellowColor()
    view.addSubview(button)
    button.backgroundColor = UIColor.brownColor()
    button.snp_makeConstraints { make in
      make.center.equalTo(view)
      make.width.height.equalTo(40)
    }
    button.rx_tap.subscribeNext { [unowned self] _ in
      self.sideDelegate?.forgetSide()
    }.addDisposableTo(disposeBag)
  }
}
