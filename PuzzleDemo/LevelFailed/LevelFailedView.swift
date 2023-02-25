//
//  LevelFailedView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 25.02.2023.
//

import UIKit

class LevelFailedView: UIView {

    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: PublicService.shared.backgroundImageForAllDisplays)
        view.backgroundColor = .white
        return view
    }()


    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "levelFailed1.pdf")
        return image
    }()

    private let levelFailed: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "levelFailed.pdf")
        return image
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "TIME: ..."
        label.textColor = Colors.textButtonColor1
        label.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        label.layer.masksToBounds = true
        label.font = Fonts.forButtons
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = Colors.buttonColor1
        return label
    }()

    let backToLevelsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let vector = UIImage(named: "Vector3.pdf")
        button.setImage(vector, for: .normal)
        return button
    }()

    let reloadLevel: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let vector = UIImage(named: "Vector2.pdf")
        button.setImage(vector, for: .normal)
        return button
    }()

    let moveToNextLevel: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let vector = UIImage(named: "Vector4.pdf")
        button.setImage(vector, for: .normal)
        button.isEnabled = true
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundImage)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(backgroundImage)
        self.addSubview(mainImage)
        self.addSubview(levelFailed)
        self.addSubview(timeLabel)
        self.addSubview(backToLevelsButton)
        self.addSubview(reloadLevel)
        self.addSubview(moveToNextLevel)
        setConstraints()
    }

    private func setConstraints() {

        backgroundImage.pin
            .width(500)
            .height(844)
            .hCenter()
            .vCenter()

        mainImage.pin
            .width(350)//
            .height(233)//
            .top(100)
            .hCenter()

        levelFailed.pin
            .width(200)
            .height(130)
            .top(300)
            .hCenter()

        timeLabel.pin
            .below(of: levelFailed)
            .width(300)
            .height(50)
            .hCenter()
            .marginTop(50)

        backToLevelsButton.pin
            .below(of: timeLabel)
            .marginTop(50)
            .size(50)
            .topLeft(to: timeLabel.anchor.bottomLeft)

        reloadLevel.pin
            .below(of: timeLabel)
            .size(70)
            .marginTop(50)
            .topCenter(to: timeLabel.anchor.bottomCenter)

        moveToNextLevel.pin
            .below(of: timeLabel)
            .size(50)
            .marginTop(50)
            .topRight(to: timeLabel.anchor.bottomRight)
    }
}
