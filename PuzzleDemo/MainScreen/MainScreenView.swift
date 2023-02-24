//
//  MainScreenView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit


class MainScreenView: UIView {

    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "image5.pdf")
        return view
    }()


    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image13.pdf")
        return image
    }()

    let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.buttonColor1
        button.setTitleColor(Colors.textButtonColor1, for: .normal)
        button.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        button.titleLabel?.font = Fonts.forButtons
        button.setTitle("PLAY", for: .normal)
        button.setTitle("pressed", for: .highlighted)
        return button
    }()

    let gameRulesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.buttonColor1
        button.setTitleColor(Colors.textButtonColor1, for: .normal)
        button.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        button.titleLabel?.font = Fonts.forButtons
        button.setTitle("GAMERULES", for: .normal)
        button.setTitle("pressed", for: .highlighted)
        return button
    }()

    let settingsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.buttonColor1
        button.setTitleColor(Colors.textButtonColor1, for: .normal)
        button.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        button.titleLabel?.font = Fonts.forButtons
        button.setTitle("SETTINGS", for: .normal)
        button.setTitle("pressed", for: .highlighted)
        return button
    }()

    let privacyPolicyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.buttonColor1
        button.setTitleColor(Colors.textButtonColor1, for: .normal)
        button.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        button.titleLabel?.font = Fonts.forButtons
        button.setTitle("PRIVACY POLICY", for: .normal)
        button.setTitle("pressed", for: .highlighted)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundImage)
        self.addSubview(mainImage)
        self.addSubview(playButton)
        self.addSubview(gameRulesButton)
        self.addSubview(settingsButton)
        self.addSubview(privacyPolicyButton)

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
            .height(800)
            .hCenter()
            .vCenter()
        
        mainImage.pin
            .width(350)//
            .height(233)//
            .top(100)
            .hCenter()

        playButton.pin
            .below(of: mainImage)
            .height(70)//
            .width(350)//
            .marginTop(20)
            .hCenter()
        gameRulesButton.pin
            .below(of: playButton)
            .height(70)//
            .width(350)//
            .marginTop(20)
            .hCenter()
        settingsButton.pin
            .below(of: gameRulesButton)
            .height(70)//
            .width(350)//
            .marginTop(20)
            .hCenter()
        privacyPolicyButton.pin
            .below(of: settingsButton)
            .height(70)//
            .width(350)//
            .marginTop(20)
            .hCenter()
    }
}
