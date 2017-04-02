# ModalView
> An easy to implement iOS Modal

![](https://github.com/joegesualdo/ModalView/raw/master/ModalView.gif)

# Usage
```swift
import UIKit
import ModalView

class ViewController: UIViewController, UITextFieldDelegate {
  var Modal: ModalView?
  
  // setup ann app view with a button that launches the modal
  override func viewDidLoad() {
    let button = UIButton(
      frame: CGRect(x:0, y: 200, width: 50, height: 30)
    )
    button.setTitle("Launch Modal", for: .normal)
    button.addTarget(self, action: #selector(launchModal), for: .touchUpInside)

    button.backgroundColor = UIColor.purple
    view.addSubview(button)
  }
  
  // Create the view you want to use as the modal
  func modalView() -> UIView {
    let mv = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let button = UIButton(frame: CGRect(x:0, y: 0, width: 50, height: 30))
    button.setTitle("Dismiss", for: .normal)
    button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)

    button.backgroundColor = UIColor.purple
    mv.addSubview(button)

    mv.backgroundColor = UIColor.red
    return mv
  }
  
  // function to launch the modal
  func launchModal() {
    Modal = ModalView(insertView: modalView(), intoView: view)
    view.addSubview(Modal!)
  }
  
  // function to dismiss the modal
  func dismissModal(){
    Modal?.dismiss()
  }
}
```
