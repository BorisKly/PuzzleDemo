//
//  LevelOneView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import PinLayout

class LevelOneView: UIView {

    let leftVectorImg = "Vector.pdf"
    let reloadLevelImg = "Vector2.pdf"

    private let parentView = UIImageView()

    public let backToLevelsButton = UIButton()
    public let reloadLevelButton =  UIButton()

    public let numberLevelLabelTitle = UILabel()
    public let timer = UILabel()

    public let correctPuzzle = UIImageView()

    public let mixedCollectionOfElementsOfPuzzle: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.allowsMultipleSelection = true
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        layout.itemSize = CGSize(width: 82.75, height: 82.75)
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.registerCollection()

        self.addSubview(parentView)
        self.sendSubviewToBack(parentView)
        self.addSubview(backToLevelsButton)
        self.addSubview(reloadLevelButton)
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
        setImagesToLabels()
        setButtons()
        setLabels()
        setConstraints()
    }

    // MARK: - Private Methods

    private func setButtons() {
        backToLevelsButton.setUIButtonRound(image: leftVectorImg)
        reloadLevelButton.setUIButtonRound(image: reloadLevelImg)
    }

    private func setLabels() {
        timer.setUILabel(text: "")
    }

    private func setImagesToLabels() {
        parentView.image = UIImage(named: PublicService.shared.backgroundImageForAllDisplays )
      //  correctPuzzle.image = UIImage(named: correctPuzzleImage)
    }

    private func registerCollection() {
        self.mixedCollectionOfElementsOfPuzzle.register(LevelOneViewCell.self, forCellWithReuseIdentifier: "LevelOneCell")
    }

    private func setConstraints() {
        parentView.pin
            .width(500)
            .height(844)
            .hCenter()
            .vCenter()
        backToLevelsButton.pin
            .size(50)
            .top(100)
            .left(20)
        reloadLevelButton.pin
            .size(50)
            .topLeft(to: backToLevelsButton.anchor.topRight)
            .marginLeft(10)
        numberLevelLabelTitle.pin
            .height(50)
            .width(100)
            .marginLeft(10)
            .topLeft(to: reloadLevelButton.anchor.topRight)
        timer.pin
            .height(50)
            .width(100)
            .marginLeft(10)
            .topLeft(to: numberLevelLabelTitle.anchor.topRight)
        mixedCollectionOfElementsOfPuzzle.pin
            .below(of: backToLevelsButton)
            .marginTop(30)
            .width(340)
            .height(340)
            .hCenter()
        correctPuzzle.pin
            .below(of: mixedCollectionOfElementsOfPuzzle)
            .size(220)
            .marginTop(30)
            .hCenter()
        
    }
}
