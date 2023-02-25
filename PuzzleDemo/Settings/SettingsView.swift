//
//  SettingsView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//
import UIKit
import PinLayout


class SettingsView: UIView {

    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: PublicService.shared.backgroundImageForAllDisplays)
        view.backgroundColor = .white
        return view
    }()

    let backToMainScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let vector = UIImage(named: "Vector.pdf")
        button.setImage(vector, for: .normal)
        return button
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "SETTINGS"
        titleLabel.textColor = Colors.textButtonColor1
        titleLabel.font = Fonts.forButtons
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = UIColor.clear
        return titleLabel
    }()

    private let soundLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "SOUND"
        titleLabel.textColor = Colors.textButtonColor1
        titleLabel.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        titleLabel.layer.masksToBounds = true
        titleLabel.font = Fonts.forButtons
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = Colors.buttonColor1
        return titleLabel
    }()

    let soundButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.buttonColor1
        button.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        button.setTitle("+", for: .normal)
        button.setTitleColor(Colors.black, for: .normal)

        return button
    }()


    private let vibroLabel: UILabel = {
        let label = UILabel()
        label.text = "VIBRO"
        label.textColor = Colors.textButtonColor1
        label.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        label.layer.masksToBounds = true
        label.font = Fonts.forButtons
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = Colors.buttonColor1
        return label
    }()

    let vibroButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.buttonColor1
        button.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        button.setTitle("+", for: .normal)
        button.setTitleColor(Colors.black, for: .normal)
        return button
    }()

    private let rateUsLabel: UILabel = {
        let label = UILabel()
        label.text = "RATE US"
        label.backgroundColor = Colors.buttonColor1
        label.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        label.layer.masksToBounds = true
        label.textColor = Colors.textButtonColor1
        label.font = Fonts.forButtons
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = Colors.back1
    self.addSubview(backgroundImage)
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

        backgroundImage.pin
            .width(500)
            .height(844)
            .hCenter()
            .vCenter()

        backToMainScreenButton.pin
            .size(60)//
            .left(20)
            .top(150)
        titleLabel.pin
            .after(of: backToMainScreenButton)
            .topLeft(to: backToMainScreenButton.anchor.topRight)
            .marginLeft(20)
            .height(53)//
            .width(200)
        soundLabel.pin
            .below(of: backToMainScreenButton)
            .height(60)
            .width(250)
            .marginTop(50)
            .left(30)
        soundButton.pin
            .after(of: soundLabel)
            .size(60)//
            .marginLeft(16)//
            .topLeft(to: soundLabel.anchor.topRight)
        vibroLabel.pin
            .below(of: soundLabel)
            .height(60)
            .width(250)
            .marginTop(50)
            .left(30)
        vibroButton.pin
            .after(of: vibroLabel)
            .size(60)//
            .marginLeft(16)//
            .topLeft(to: vibroLabel.anchor.topRight)
        rateUsLabel.pin
            .below(of: [vibroLabel, vibroButton])
            .marginTop(30)
            .topLeft(to: vibroLabel.anchor.bottomLeft)
            .topRight(to: vibroButton.anchor.bottomRight)
            .height(60)

    }
}

