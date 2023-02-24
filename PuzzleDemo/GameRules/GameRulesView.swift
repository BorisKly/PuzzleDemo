//
//  GameRulesView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import PinLayout

class GameRulesView: UIView {

    let backToMainScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("<<<", for: .normal)
        button.setTitleColor(Colors.background1, for: .normal)
        return button
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Game Rules"
        titleLabel.textColor = Colors.labelColor1
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = .white
        return titleLabel
    }()

    private let welcomeLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Welcome to Juicy! "
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = Colors.background1
        return titleLabel
    }()


    private let explaineRulesLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "jdbcdsbcelln cnldqwcnwlq cenwiewnq "
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = Colors.background1
        return titleLabel
    }()

override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(backToMainScreenButton)
    self.addSubview(titleLabel)
    self.addSubview(welcomeLabel)
    self.addSubview(explaineRulesLabel)

}
required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

override func layoutSubviews() {
    super.layoutSubviews()
    setConstraints()
}

// MARK: - Public Methods


    private func setConstraints() {

        backToMainScreenButton.pin
            .size(60)
            .left(20)
            .top(70)
        titleLabel.pin
            .after(of: backToMainScreenButton)
            .top(74)
            .marginLeft(21)
            .height(53)
            .width(189)
        welcomeLabel.pin
            .below(of: titleLabel)
            .height(114)
            .width(289)
            .marginTop(20)
            .hCenter()
        explaineRulesLabel.pin.below(of: welcomeLabel)
            .height(200)
            .width(200)
            .marginTop(20)
            .hCenter()
    }
}

