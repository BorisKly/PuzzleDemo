//
//  PublicService.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

class PublicService {  // force unwrap

    public func setRandomArrayOf16Images(_ imageName: String ) -> [UIImage] {
        let image = UIImage(named: imageName)
        let arrayOf16Images: [UIImage] = splitImageOnFourEqualParts(image2D: image!).flatMap{          //Force unwrap
            splitImageOnFourEqualParts(image2D: $0)
        }
        return arrayOf16Images.shuffled()
    }

    private func splitImageOnFourEqualParts(image2D: UIImage) -> [UIImage] {
        let imgWidth = image2D.size.width / 4
        let imgHeight = image2D.size.height / 4
        var imgImages: [UIImage] = []

        let leftHigh = CGRect(x: 0, y: 0, width: imgWidth, height: imgHeight )
        let rightHigh = CGRect(x: imgWidth, y: 0, width: imgHeight, height: imgHeight )
        let leftLow = CGRect(x: 0, y: imgHeight, width: imgWidth, height: imgHeight )
        let rightLow = CGRect(x: imgWidth, y: imgHeight, width: imgWidth, height: imgHeight )

        let leftQH = image2D.cgImage?.cropping(to: leftHigh)
        let rightQH = image2D.cgImage?.cropping(to: rightHigh)
        let leftQL = image2D.cgImage?.cropping(to: leftLow)
        let rightQL = image2D.cgImage?.cropping(to: rightLow)

        imgImages.append(UIImage(cgImage: leftQH!))
        imgImages.append(UIImage(cgImage: rightQH!))
        imgImages.append(UIImage(cgImage: leftQL!))
        imgImages.append(UIImage(cgImage: rightQL!))

        return imgImages
    }
}

