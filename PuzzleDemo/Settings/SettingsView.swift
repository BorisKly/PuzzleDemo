//
//  SettingsView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//
import UIKit
import PinLayout

class SettingsView: UIView {

    let leftVector = "Vector.pdf"

    private let parentView = UIImageView()
    public let backToMainScreenButton = UIButton()
    private let settingsLabel = UILabel()
    private let soundLabel = UILabel()
    private let soundButton = UIButton()
    private let vibroLabel = UILabel()
    private let vibroButton = UIButton()
    private let rateUsLabel = UILabel()

    let stackViewSound = UIStackView()
    let stackViewVibro = UIStackView()
    let stackViewSettings = UIStackView()

    let verticalStackView = UIStackView()

override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(parentView)
    parentView.image = UIImage(named: PublicService.shared.backgroundImageForAllDisplays)
    self.sendSubviewToBack(parentView)

    self.addSubview(verticalStackView)
    verticalStackView.addArrangedSubview(stackViewSettings)
    verticalStackView.addArrangedSubview(stackViewVibro)
    verticalStackView.addArrangedSubview(stackViewSound)
    verticalStackView.addArrangedSubview(rateUsLabel)

}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

override func layoutSubviews() {
    super.layoutSubviews()
    setUILabels()
    setButtons()
    setStackViews()
    setSubviewsForStacks()
    setConstraints()
    setConstrInStack()

}

// MARK: - Private Methods

    private func setSubviewsForStacks() {
        stackViewSettings.addArrangedSubview(backToMainScreenButton)
        stackViewSettings.addArrangedSubview(settingsLabel)

        stackViewSound.addArrangedSubview(soundLabel)
        stackViewSound.addArrangedSubview(soundButton)

        stackViewVibro.addArrangedSubview(vibroLabel)
        stackViewVibro.addArrangedSubview(vibroButton)

        verticalStackView.addArrangedSubview(stackViewSettings)
        verticalStackView.addArrangedSubview(stackViewSound)
        verticalStackView.addArrangedSubview(stackViewVibro)
        verticalStackView.addArrangedSubview(rateUsLabel)
    }

    private func setUILabels() {
        vibroLabel.setUILabel(text: "VIBRO")
        rateUsLabel.setUILabel(text: "RATE US")
        soundLabel.setUILabel(text: "SOUND")
        settingsLabel.setUILabel(text: "SETTINGS")
    }

    func setButtons() {
        backToMainScreenButton.setUIButtonRound(image: leftVector)
        vibroButton.setUIButton(title: "+", titleHighlited: "+")
        soundButton.setUIButton(title: "+", titleHighlited: "+")
    }

    func setStackViews() {
        stackViewSound.setStackViewHorizontal(spacing: 20)
        stackViewVibro.setStackViewHorizontal(spacing: 20)
        stackViewSettings.setStackViewHorizontal(spacing: 20)
        verticalStackView.setStackViewVertical(spacing: 30)
    }

    func setConstrInStack() {
        soundButton.pin
            .size(50)
        vibroButton.pin
            .size(50)
        soundLabel.pin
            .height(50)
        vibroLabel.pin
            .height(50)
    }

    private func setConstraints() {

        parentView.pin
            .width(500)
            .height(844)
            .hCenter()
            .vCenter()

        verticalStackView.pin
            .top(150)
            .width(350)
            .height(450)
            .hCenter()

    }
}

