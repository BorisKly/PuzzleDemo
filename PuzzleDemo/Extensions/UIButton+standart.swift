//
//  UIButton+standart.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 27.02.2023.
//

import UIKit

extension UIButton {

    public func setUIButton(title: String, titleHighlited: String) {
        self.backgroundColor = Colors.buttonColor1
        self.setTitleColor(Colors.textButtonColor1, for: .normal)
        self.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        self.titleLabel?.font = Fonts.forButtons
        self.setTitle(title, for: .normal)
        self.setTitle(titleHighlited, for: .highlighted)
    }
    public func setUIButtonRound(image: String) {
        self.backgroundColor = Colors.buttonColorBackgroundWhite
        self.setTitleColor(Colors.textButtonColor1, for: .normal)
        self.layer.cornerRadius = CGFloat(CornerRadius.forButtonsRound)
        self.titleLabel?.font = Fonts.forButtons
        let vector = UIImage(named: image)
        self.setImage(vector, for: .normal)
    }

}
