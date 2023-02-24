//
//  LevelsView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import PinLayout

class LevelsView: UIView {

    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "image5.pdf")
        view.backgroundColor = .white
        return view
    }()

    public let backToMainScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let vector = UIImage(named: "Vector.pdf")
        button.setImage(vector, for: .normal)
        return button
    }()

    private let levelsLabelTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "LEVELS"
        titleLabel.textColor = Colors.textButtonColor1
        titleLabel.font = Fonts.forButtons
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
       // titleLabel.backgroundColor = .white
        return titleLabel
    }()

    public let collectionOfLevels: UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical
        collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.registerCollection()
        self.addSubview(backgroundImage)
        self.addSubview(backToMainScreenButton)
        self.addSubview(levelsLabelTitle)
        self.addSubview(collectionOfLevels)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }

    // MARK: - Private Methods

    private func registerCollection() {
        self.collectionOfLevels.register(LevelsViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

    private func setConstraints() {

        backgroundImage.pin
            .width(500)
            .height(844)
            .hCenter()
            .vCenter()
        backToMainScreenButton.pin
            .size(60)
            .left(20)
            .top(150)
        levelsLabelTitle.pin
            .after(of: backToMainScreenButton)
            .topLeft(to: backToMainScreenButton.anchor.topRight)
            .marginLeft(20)
            .height(60)
            .width(200)
        collectionOfLevels.pin
            .below(of: backToMainScreenButton)
            .height(420)
            .width(315)
            .marginTop(50)
            .hCenter()
}
}
