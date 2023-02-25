//
//  LevelTwoView.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 25.02.2023.
//

import UIKit

class LevelTwoView: UIView {

    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: PublicService.shared.backgroundImageForAllDisplays )
        view.backgroundColor = .white
        return view
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
        setConstraints()
    }

    private func setConstraints() {
        backgroundImage.pin
            .width(500)
            .height(844)
            .hCenter()
            .vCenter()
    }
}
