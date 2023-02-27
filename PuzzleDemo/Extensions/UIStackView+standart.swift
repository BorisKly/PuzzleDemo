//
//  UIStackView+standart.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 27.02.2023.
//


import UIKit
extension UIStackView {

    func setStackViewHorizontal(spacing: CGFloat) {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = spacing
    }

    func setStackViewVertical(spacing: CGFloat) {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = spacing
    }
}
