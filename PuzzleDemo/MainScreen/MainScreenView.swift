//
//  MainScreenView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit


class MainScreenView: UIView {

    var candy = "image13.pdf"

    let parentView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: PublicService.shared.backgroundImageForAllDisplays)
        return view
    }()

    private let candyImage = UIImageView()

    public let playButton = UIButton()
    public let gameRulesButton = UIButton()
    public let settingsButton = UIButton()
    public let privacyPolicyButton = UIButton()

    let stackViewOfButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(parentView)
        self.addSubview(candyImage)
        self.addSubview(stackViewOfButtons)
        self.sendSubviewToBack(parentView)
        // self.bringSubviewToFront(<#T##view: UIView##UIView#>)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addButtonsToStackView()
        setButtons()
        setImagesToLabels()
        setConstraints()
    }

    // MARK: - Private Methods

    private func setImagesToLabels() {
        candyImage.image = UIImage(named: candy)
    }

    private func addButtonsToStackView() {
        stackViewOfButtons.addArrangedSubview(playButton)
        stackViewOfButtons.addArrangedSubview(gameRulesButton)
        stackViewOfButtons.addArrangedSubview(settingsButton)
        stackViewOfButtons.addArrangedSubview(privacyPolicyButton)

        stackViewOfButtons.setCustomSpacing(5, after: playButton)
    }

    private func setButtons() {
        playButton.setUIButton(title: "PLAY", titleHighlited: "pressed")

        settingsButton.setUIButton(title: "SETTINGS", titleHighlited: "pressed")
        gameRulesButton.setUIButton(title: "GAMERULES", titleHighlited: "pressed")
        privacyPolicyButton.setUIButton(title: "PRIVACY POLICY", titleHighlited: "pressed")
    }

    private func setConstraints() {
        parentView.pin
            .width(500)
            .height(800)
            .hCenter()
            .vCenter()
        
        candyImage.pin
            .width(330)//
            .height(233)//
            .top(100)
            .hCenter()

        stackViewOfButtons.pin
            .below(of: candyImage)
            .marginTop(30)
            .width(330)
            .height(280)
            .hCenter()
    }
}
