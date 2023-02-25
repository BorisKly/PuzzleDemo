//
//  PublicService.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

class PublicService {  // force unwrap

    public static let shared = PublicService()

    public let backgroundImageForAllDisplays = "image5.pdf"

    // MARK: - Init Properties

    private init() {}

    public func setArrayOf16Images(_ imageName: String, mixed: Bool ) -> [UIImage] {
        let image = UIImage(named: imageName)
        let arrayOf16Images: [UIImage] = splitImageOnFourEqualLines(image2D: image!)
            .flatMap{splitImageOnFourEqualMiniSquers(image2D: $0)
        }
        return mixed ? arrayOf16Images.shuffled() : arrayOf16Images
    }

    private func splitImageOnFourEqualLines(image2D: UIImage) -> [UIImage] {
        let imgWidth = image2D.size.width
        let imgHeight = image2D.size.height / 4
        var imgImages: [UIImage] = []

        let first = CGRect(x: 0, y: 0, width: imgWidth, height: imgHeight )
        let second = CGRect(x: 0, y: imgHeight, width: imgWidth, height: imgHeight )
        let third = CGRect(x: 0, y: 2 * imgHeight, width: imgWidth, height: imgHeight )
        let fourth = CGRect(x: 0, y: 3 * imgHeight, width: imgWidth, height: imgHeight )

        let firstH = image2D.cgImage?.cropping(to: first)
        let secondH = image2D.cgImage?.cropping(to: second)
        let thirdH = image2D.cgImage?.cropping(to: third)
        let fourthH = image2D.cgImage?.cropping(to: fourth)

        imgImages.append(UIImage(cgImage: firstH!))
        imgImages.append(UIImage(cgImage: secondH!))
        imgImages.append(UIImage(cgImage: thirdH!))
        imgImages.append(UIImage(cgImage: fourthH!))

        return imgImages
    }
    private func splitImageOnFourEqualMiniSquers(image2D: UIImage) -> [UIImage] {
        let imgWidth = image2D.size.width / 4
        let imgHeight = image2D.size.height
        var imgImages: [UIImage] = []

        let first = CGRect(x: 0, y: 0, width: imgWidth, height: imgHeight )
        let second = CGRect(x: imgWidth, y: 0, width: imgWidth, height: imgHeight )
        let third = CGRect(x: 2 * imgWidth, y: 0, width: imgWidth, height: imgHeight )
        let fourth = CGRect(x: 3 * imgWidth, y: 0, width: imgWidth, height: imgHeight )

        let firstH = image2D.cgImage?.cropping(to: first)
        let secondH = image2D.cgImage?.cropping(to: second)
        let thirdH = image2D.cgImage?.cropping(to: third)
        let fourthH = image2D.cgImage?.cropping(to: fourth)

        imgImages.append(UIImage(cgImage: firstH!))
        imgImages.append(UIImage(cgImage: secondH!))
        imgImages.append(UIImage(cgImage: thirdH!))
        imgImages.append(UIImage(cgImage: fourthH!))

        return imgImages
    }
}

