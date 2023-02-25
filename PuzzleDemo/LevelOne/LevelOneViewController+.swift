//
//  LevelOneViewController+.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

   var selectedItems: [IndexPath]?

extension LevelOneViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOf16Images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelOneCell", for: indexPath)
        let image: UIImage = arrayOf16Images[indexPath.row]
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 84.25, height: 84.25))
        imageView.image = image
       // imageView.frame = CGRect(x: 0, y: 0, width: 84.25, height: 84.25)
       // imageView.frame = CGRect(x: 0, y: 0, width: 169.25, height: 169.25)
        cell.contentView.addSubview(imageView)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        if ((cell?.isSelected) != nil) {cell?.layer.shadowOpacity = 0.5 }

        selectedItems = collectionView.indexPathsForSelectedItems

        if selectedItems?.count == 2 {

            selectedItems?.forEach({ collectionView.deselectItem(at: $0, animated: true)
            })
        }

        print(indexPath.row)
    }

   
}
