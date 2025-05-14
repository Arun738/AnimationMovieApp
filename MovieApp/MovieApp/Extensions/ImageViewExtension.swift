//
//  ImageViewExtension.swift
//  MovieApp
//
//  Created by Arun Tiwari on 14/05/25.
//

import Foundation
import UIKit

extension UIImageView {
    
    func startShimmerEffect() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.systemGray5.cgColor,
            UIColor.white.cgColor,
            UIColor.systemGray5.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = self.bounds
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.name = "shimmerLayer"
        
        self.layer.addSublayer(gradientLayer)

        // Animation
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 1.5
        animation.repeatCount = .infinity

        gradientLayer.add(animation, forKey: "shimmerAnimation")
    }
    
    func stopShimmerEffect() {
        self.layer.sublayers?.removeAll(where: { $0.name == "shimmerLayer" })
    }
}
