//
//  LevelsViewCell.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit
import PinLayout

class LevelsViewCell: UICollectionViewCell {

    // MARK: Public Properties

    private let imageCell: UIImageView = {
      let image = UIImageView()
        image.backgroundColor = Colors.background3
//        let img = UIImage(named: "image21.pdf")
//        image.image = img
        return image
    }()

    // MARK: -
    // MARK: Init and Deinit

    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(imageCell)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: -
    // MARK: Private Methods

    private func setConstraints() {
        imageCell.pin
            .all(0)
    }
}
