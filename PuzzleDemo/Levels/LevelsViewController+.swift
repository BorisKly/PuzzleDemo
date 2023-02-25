//
//  LevelsViewController+.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

extension LevelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.arrayOfLevels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        let image = UIImage(named: model.arrayOfLevels[indexPath.row])
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 100.0))
        imageView.image = image
        cell.contentView.addSubview(imageView)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = indexPath.row
        switch item {
        case 0:
            self.eventHandler?(.toLevelOne)
        case 1:
            self.eventHandler?(.toLevelTwo)
        case 2:
            self.eventHandler?(.toLevelThree)
        default:
            break
        }
    }


}

