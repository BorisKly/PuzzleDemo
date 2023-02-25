//
//  LevelCompletedView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import PinLayout

class LevelCompletedView: UIView {

    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: PublicService.shared.backgroundImageForAllDisplays)
        view.backgroundColor = .white
        return view
    }()

    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "levelComplited1.pdf")
        return image
    }()

    private let levelComplited: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "levelComplited.pdf")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundImage)

    }

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

    private let bestTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "BEST TIME: ..."
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

    let toLevelTwo: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let vector = UIImage(named: "Vector5.pdf")
        button.setImage(vector, for: .normal)
        button.isEnabled = true
        return button
    }()


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(backgroundImage)
        self.addSubview(mainImage)
        self.addSubview(levelComplited)
        self.addSubview(bestTimeLabel)
        self.addSubview(timeLabel)
        self.addSubview(backToLevelsButton)
        self.addSubview(reloadLevel)
        self.addSubview(toLevelTwo)
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

        levelComplited.pin
            .width(200)
            .height(130)
            .top(300)
            .hCenter()

        bestTimeLabel.pin
            .below(of: levelComplited)
            .width(300)
            .height(50)
            .hCenter()
            .marginTop(50)

        timeLabel.pin
            .below(of: bestTimeLabel)
            .width(300)
            .height(50)
            .hCenter()
            .marginTop(30)

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

        toLevelTwo.pin
            .below(of: timeLabel)
            .size(50)
            .marginTop(50)
            .topRight(to: timeLabel.anchor.bottomRight)
    }
}
