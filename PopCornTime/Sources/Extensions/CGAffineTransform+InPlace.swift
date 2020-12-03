//
//  CGAffineTransform+InPlace.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 02.12.20.
//

import UIKit

extension CGAffineTransform {

    mutating func rotate(by rotationAngle: CGFloat) {
        self = self.rotated(by: rotationAngle)
    }

    mutating func scale(by scalingFactor: CGFloat) {
        self = self.scaledBy(x: scalingFactor, y: scalingFactor)
    }

}

