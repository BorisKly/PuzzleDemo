//
//  SettingsView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//
import UIKit
import PinLayout


class SettingsView: UIView {


    let backToMainScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("<<<", for: .normal)
        button.setTitleColor(Colors.background1, for: .normal)
        return button
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.textColor = Colors.background1
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = .white
        return titleLabel
    }()

    private let soundLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Sound "
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = Colors.background1
        return titleLabel
    }()

    let soundButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.background1
        button.setTitle("+", for: .normal)
        button.setTitleColor(Colors.black, for: .normal)
        return button
    }()


    private let vibroLabel: UILabel = {
        let label = UILabel()
        label.text = "Vibro"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = Colors.background1
        return label
    }()

    let vibroButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.background1
        button.setTitle("+", for: .normal)
        button.setTitleColor(Colors.black, for: .normal)
        return button
    }()

    private let rateUsLabel: UILabel = {
        let label = UILabel()
        label.text = "Rate Us"
        label.backgroundColor = Colors.background1
        label.textColor = Colors.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()

override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = Colors.back1
    self.addSubview(backToMainScreenButton)
    self.addSubview(titleLabel)
    self.addSubview(soundLabel)
    self.addSubview(soundButton)
    self.addSubview(vibroLabel)
    self.addSubview(vibroButton)
    self.addSubview(rateUsLabel
    )
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
            .top(150)
        titleLabel.pin
            .after(of: backToMainScreenButton)
            .topLeft(to: backToMainScreenButton.anchor.topRight)
            //.top(60)
            .marginLeft(20)
            .height(60)
            .width(200)
        soundLabel.pin
            .below(of: backToMainScreenButton)
            .height(50)
            .width(200)
            .marginTop(50)
            .left(50)
        soundButton.pin
            .after(of: soundLabel)
            .size(50)
            .marginLeft(30)
            .topLeft(to: soundLabel.anchor.topRight)
        vibroLabel.pin
            .below(of: soundLabel)
            .height(50)
            .width(200)
            .marginTop(50)
            .left(50)
        vibroButton.pin
            .after(of: vibroLabel)
            .size(50)
            .marginLeft(30)
            .topLeft(to: vibroLabel.anchor.topRight)
        rateUsLabel.pin
            .below(of: [vibroLabel, vibroButton])
            .marginTop(30)
            .topLeft(to: vibroLabel.anchor.bottomLeft)
            .topRight(to: vibroButton.anchor.bottomRight)
            .height(50)

    }
}

