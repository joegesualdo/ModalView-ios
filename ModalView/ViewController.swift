//
//  ViewController.swift
//  JPGInput
//
//  Created by Joe Gesualdo on 3/9/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  var Modal: ModalView?
  
  override func viewDidLoad() {
    let button = UIButton(
      frame: CGRect(x:0, y: 200, width: 50, height: 30)
    )
    button.setTitle("Launch Modal", for: .normal)
    button.addTarget(self, action: #selector(launchModal), for: .touchUpInside)

    button.backgroundColor = UIColor.purple
    view.addSubview(button)
    
//    Modal.dismiss()
  }
  
  func modalView() -> UIView {
    let mv = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let button = UIButton(frame: CGRect(x:0, y: 0, width: 50, height: 30))
    button.setTitle("Dismiss", for: .normal)
    button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)

    button.backgroundColor = UIColor.purple
    mv.addSubview(button)
    
    // Activity spinner
    let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
    actInd.center = mv.center
    actInd.hidesWhenStopped = true
    actInd.activityIndicatorViewStyle =
      UIActivityIndicatorViewStyle.whiteLarge
    actInd.startAnimating()
    // end activity spinner
    
    mv.backgroundColor = UIColor.red
    return mv
  }
  
  func launchModal() {
    Modal = ModalView(insertView: modalView(), intoView: view)
    view.addSubview(Modal!)
  }
  
  func dismissModal(){
    Modal?.dismiss()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}
