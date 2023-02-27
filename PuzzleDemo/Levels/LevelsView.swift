//
//  LevelsView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import PinLayout

class LevelsView: UIView {

    let leftVector = "Vector.pdf"

    public let backToMainScreenButton = UIButton()

    public let collectionOfLevels: UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical
        collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collection
    }()

    private let parentView = UIImageView()
    private let levelsLabelTitle = UILabel()
    private let stackViewLevels = UIStackView()
    private let verticalStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(parentView)
        parentView.image = UIImage(named: PublicService.shared.backgroundImageForAllDisplays)
        self.sendSubviewToBack(parentView)

        self.registerCollection()

        self.addSubview(parentView)
        self.addSubview(verticalStackView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setLabelsButtons()
        setStackViews()
        setConstraints()
    }

    // MARK: - Private Methods
    private func setLabelsButtons () {
        levelsLabelTitle.setUILabel(text: "LEVELS")
        backToMainScreenButton.setUIButtonRound(image: leftVector)
    }

    private func setStackViews() {

        stackViewLevels.addArrangedSubview(backToMainScreenButton)
        stackViewLevels.addArrangedSubview(levelsLabelTitle)
        
        verticalStackView.addArrangedSubview(stackViewLevels)
        verticalStackView.addArrangedSubview(collectionOfLevels)

        stackViewLevels.axis = .horizontal
        stackViewLevels.alignment = .center
        stackViewLevels.distribution = .fillEqually
        stackViewLevels.spacing = 10

        stackViewLevels.translatesAutoresizingMaskIntoConstraints = false
        backToMainScreenButton.translatesAutoresizingMaskIntoConstraints = false

        stackViewLevels.pin.top().left().right().bottom()
        backToMainScreenButton.pin
            .height(100)
            .width(100)


        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 30
    }

    private func registerCollection() {
        self.collectionOfLevels.register(LevelsViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

    private func setConstraints() {

        parentView.pin
            .width(500)
            .height(844)
            .hCenter()
            .vCenter()
        verticalStackView.pin
            .top(100)
            .width(330)
            .height(600)
            .hCenter()

    }
}
