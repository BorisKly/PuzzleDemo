//
//  UILabel+standart .swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 27.02.2023.
//

import UIKit

extension UILabel {

public func setUILabel (text: String) {
    self.text = text
    self.textColor = Colors.textButtonColor1
    self.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
    self.layer.masksToBounds = true
    self.font = Fonts.forButtons
    self.textAlignment = .center
    self.numberOfLines = 0
    self.backgroundColor = Colors.buttonColor1
}
}
