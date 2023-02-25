//
//  LevelOneViewController+.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

 //  var selectedItems: [IndexPath]?

extension LevelOneViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOf16Images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelOneCell", for: indexPath)
        let image: UIImage = arrayOf16Images[imageOrder[indexPath.row]]

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 82.75, height: 82.75))
        imageView.image = image
        cell.contentView.addSubview(imageView)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.shadowOpacity = (cell?.isSelected ?? false) ? 0.5 : 1.0

        let selectedItems = collectionView.indexPathsForSelectedItems

        if selectedItems?.count == 2 {
            imageOrder.swapAt(selectedItems?.first?.row ?? 0, selectedItems?.last?.row ?? 0)
            selectedItems?.forEach({ collectionView.deselectItem(at: $0, animated: true)
            })
            collectionView.reloadData()

            if imageOrder == correctOrder {
                self.eventHandler?(.levelCompleted(time: totalTime - time ))
            }
        }

        print(indexPath.row)
    }


}
