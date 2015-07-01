//
//  IconNavigationBar.swift
//  MoreThanToday
//
//  Created by Gelber, Assaf on 7/1/15.
//  Copyright (c) 2015 Gelber, Assaf. All rights reserved.
//

import Foundation
import UIKit

class IconNavigationBar: UINavigationBar {
  private let HEIGHT_INCREASE: CGFloat = 144
  private let STATUS_BAR_HEIGHT: CGFloat = 20
  private let DEFAULT_NAVBAR_HEIGHT: CGFloat = 44
  private let IMAGE_SIZE: CGFloat = 100

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  private func setup() {
    self.transform = CGAffineTransformMakeTranslation(0, -HEIGHT_INCREASE)
    self.setupImage()
  }

  private func setupImage() {
    let imageView = UIImageView(image: UIImage(named: "Calendar"))
    let x = (UIScreen.mainScreen().bounds.width - IMAGE_SIZE) / 2
    let y = HEIGHT_INCREASE + DEFAULT_NAVBAR_HEIGHT
    imageView.frame = CGRect(x: x, y: y, width: IMAGE_SIZE, height: IMAGE_SIZE)
    self.addSubview(imageView)
  }

  override func sizeThatFits(size: CGSize) -> CGSize {
    var newSize = super.sizeThatFits(size)
    newSize.height += HEIGHT_INCREASE
    return newSize
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    for (var sub) in self.subviews as! [UIView] {
      if NSStringFromClass(sub.classForCoder) == "_UINavigationBarBackground" {
        let y: CGFloat = HEIGHT_INCREASE - STATUS_BAR_HEIGHT
        let height: CGFloat = HEIGHT_INCREASE + DEFAULT_NAVBAR_HEIGHT + STATUS_BAR_HEIGHT
        sub.frame = CGRect(x: 0, y: y, width: self.frame.width, height: height)
      }
    }
  }
}