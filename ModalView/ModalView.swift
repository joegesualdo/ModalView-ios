//
//  File.swift
//  Test2
//
//  Created by Joe Gesualdo on 3/20/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import Foundation
import UIKit

public class ModalView: UIView {
  var parentView: UIView
  var modalView: UIView
  
  public init(insertView modalView: UIView, intoView view: UIView) {
    self.parentView = view
    self.modalView = modalView
    
    super.init(frame: CGRect.zero)
    
    self.frame = CGRect()
    self.backgroundColor = UIColor.black
    self.isOpaque = true
//    parentView.isUserInteractionEnabled = false
    self.isUserInteractionEnabled = true
    self.backgroundColor = UIColor(colorLiteralRed: 0.126, green: 0.188, blue: 0.277, alpha: 0.8)
    modalView.tag = 1
    self.addSubview(modalView)
    self.alpha = 0
    fadeIn(viewToFadeIn: self)
  }
  
  public func dismiss() {
    fadeOut(viewToFadeOut: self)
    print("dismiss")
    let subViews = self.subviews
    for subview in subViews{
      print("for removing...")
      subview.removeFromSuperview()
    }
    self.removeFromSuperview()
  }
  
  // didMoveToSuperview is even called when you remove the view. So we
  //   don't want to run setupLayout if we removed the view
  // http://stackoverflow.com/questions/8282288/is-willmovetosuperview-called-with-nil-when-removing-a-view-from-a-hierarchy
  // http://stackoverflow.com/questions/3074933/how-to-be-notified-when-a-uiview-detached-from-its-superview
  override public func didMoveToSuperview() {
    super.didMoveToSuperview()
    if (self.window == nil) {
      // YOUR CODE FOR WHEN UIVIEW IS REMOVED
    } else {
      setupLayout()
    }
  }
  
  func setupLayout() {
    print(parentView)
    self.translatesAutoresizingMaskIntoConstraints = false;
    self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0).isActive = true
    self.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 0).isActive = true
    self.widthAnchor.constraint(equalTo: parentView.widthAnchor).isActive = true
    self.heightAnchor.constraint(equalTo: parentView.heightAnchor, constant: 0).isActive = true
    
    let modalWidth = self.modalView.frame.size.width
    let modalHeight = self.modalView.frame.size.height
    self.modalView.frame.origin.x = (parentView.frame.size.width/2) - CGFloat(modalWidth/2)
    self.modalView.frame.origin.y = (parentView.frame.size.height/2) - CGFloat(modalWidth/2)
    self.modalView.frame.size.width = CGFloat(modalWidth)
    self.modalView.frame.size.height = CGFloat(modalHeight)
    
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func fadeOut(viewToFadeOut: UIView){
    // Move our fade out code from earlier
    UIView.animate(
      withDuration: 0.5,
      delay: 0.0,
      options: .transitionCurlUp,
      animations: {
       viewToFadeOut.alpha = 0.0
      },
      completion: { finished in
        if finished {
        }
      }
    )
  
  }
  
  func fadeIn(viewToFadeIn: UIView) {
    UIView.animate(
      withDuration: 0.5,
      delay: 0.0,
      options: .transitionCurlDown,
      animations: {
        viewToFadeIn.alpha = 1.0
      },
      completion: { finished in
        if finished {
        }
      }
    )
  }
}
