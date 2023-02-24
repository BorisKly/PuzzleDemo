//
//  LevelOneView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import PinLayout

class LevelOneView: UIView {

    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "image5.pdf")
        view.backgroundColor = .white
        return view
    }()

    let backToLevels: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let vector = UIImage(named: "Vector.pdf")
        button.setImage(vector, for: .normal)
        button.setTitleColor(Colors.background1, for: .normal)
        return button
    }()

    let reloadLevel: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let vector = UIImage(named: "Vector2.pdf")
        button.setImage(vector, for: .normal)
        button.setTitleColor(Colors.background1, for: .normal)
        return button
    }()

    private let numberLevelLabelTitle: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LVL1.pdf")
        return image
    }()

    public let timer: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Levels"
        titleLabel.textColor = Colors.background1
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = .white
        return titleLabel
    }()

    public let mixedCollectionOfElementsOfPuzzle: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: 84.25, height: 84.25)
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .vertical
        collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collection
    }()

    private let correctPuzzle: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "image15.pdf")
        view.backgroundColor = .white
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.registerCollection()
        self.backgroundColor = Colors.background1
        self.addSubview(backgroundImage)
        self.addSubview(backToLevels)
        self.addSubview(reloadLevel)
        self.addSubview(numberLevelLabelTitle)
        self.addSubview(timer)
        self.addSubview(mixedCollectionOfElementsOfPuzzle)
        self.addSubview(correctPuzzle)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }

    // MARK: - Public Methods

    private func registerCollection() {
        self.mixedCollectionOfElementsOfPuzzle.register(LevelsViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

    private func setConstraints() {
        backgroundImage.pin
            .width(500)
            .height(844)
            .hCenter()
            .vCenter()

        backToLevels.pin
            .size(35)
            .left(20)
            .top(74) //
        reloadLevel.pin
            .size(35)
            .after(of: backToLevels)
            .topLeft(to: backToLevels.anchor.topRight)
            .marginLeft(10)
        numberLevelLabelTitle.pin
            .topLeft(to: reloadLevel.anchor.topRight)
            .height(35) //
            .width(100) //
            .marginLeft(10)
        timer.pin
            .topLeft(to: numberLevelLabelTitle.anchor.topRight)
            .height(35)
            .width(100)
            .marginLeft(10)
        mixedCollectionOfElementsOfPuzzle.pin
            .below(of: backToLevels)
            .marginTop(40) //
            .size(340) //
            .hCenter()
        correctPuzzle.pin
            .below(of: mixedCollectionOfElementsOfPuzzle)
            .marginTop(50)
            .height(226) //
            .width(226.14) //
            .hCenter()
}
}
