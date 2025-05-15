//
//  AnimatedBorderView.swift
//  AnimatedBorder
//
//  Created by Nirzar Gandhi on 15/05/25.
//

import Foundation
import UIKit

// MARK: - Border Gradient View
class BorderGradientView: UIView {
    
    // MARK: - Properties
    var locations: [NSNumber] = [0.0, 0.33, 0.75] {
        didSet {
            self.addBorderGradientLayer()
        }
    }
    
    var lineWidth: CGFloat = 1.6 {
        didSet {
            self.addBorderGradientLayer()
        }
    }
    
    var cornerRadius: CGFloat = 15 {
        didSet {
            self.addBorderGradientLayer()
        }
    }
    
    var itemSize: CGSize = .zero {
        didSet {
            self.addBorderGradientLayer()
        }
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addBorderGradientLayer()
    }
    
    // MARK: - Add Border GradientLayer
    func addBorderGradientLayer() {
        
        self.layer.sublayers?.removeAll()
        
        let firstColor = UIColor(hex: "#000000", alpha: 0.5).cgColor
        let secondColor = UIColor(hex: "#847F80", alpha: 1.0).cgColor
        let thirdColor = UIColor(hex: "#817C7D", alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: CGPoint.zero, size: self.itemSize != .zero ? self.itemSize : self.frame.size)
        gradientLayer.colors = [firstColor, secondColor, thirdColor, firstColor, secondColor]
        gradientLayer.locations = self.locations
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.cornerRadius = self.cornerRadius
        
        let shape = CAShapeLayer()
        shape.lineWidth = self.lineWidth
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).cgPath
        shape.strokeColor = secondColor
        shape.fillColor = UIColor.clear.cgColor
        shape.cornerRadius = self.cornerRadius
        gradientLayer.mask = shape
        
        self.layer.addSublayer(gradientLayer)
    }
}


// MARK: - Animated Border Gradient View
class AnimatedBorderGradientView: UIView {
    
    // MARK: - Properties
    var locations: [NSNumber] = [0.0, 0.33, 0.75] {
        didSet {
            self.addBorderGradientLayer()
        }
    }
    
    var lineWidth: CGFloat = 1.6 {
        didSet {
            self.addBorderGradientLayer()
        }
    }
    
    var cornerRadius: CGFloat = 15 {
        didSet {
            self.addBorderGradientLayer()
        }
    }
    
    var itemSize: CGSize = .zero {
        didSet {
            self.addBorderGradientLayer()
        }
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addBorderGradientLayer()
    }
    
    // MARK: - Add Border GradientLayer
    func addBorderGradientLayer() {
        
        self.layer.sublayers?.removeAll()
        
        let firstColor = UIColor(hex: "#000000", alpha: 0.0).cgColor
        let secondColor = UIColor(hex: "#847F80", alpha: 1.0).cgColor
        let thirdColor = UIColor(hex: "#FFFFFF", alpha: 0.6).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: CGPoint.zero, size: self.itemSize != .zero ? self.itemSize : self.frame.size)
        gradientLayer.colors = [firstColor, secondColor, thirdColor, firstColor, secondColor]
        gradientLayer.locations = self.locations
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.cornerRadius = self.cornerRadius
        
        let shape = CAShapeLayer()
        shape.lineWidth = self.lineWidth
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).cgPath
        shape.strokeColor = secondColor
        shape.fillColor = UIColor.clear.cgColor
        shape.cornerRadius = self.cornerRadius
        gradientLayer.mask = shape
        
        // Animation Points
        let startPointAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnimation.fromValue = CGPoint(x: 2, y: -1) // Top Right
        startPointAnimation.toValue = CGPoint(x: 0, y: 1) // Bottom Left
        
        let endPointAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnimation.fromValue = CGPoint(x: 1, y: 0) // Top Right
        endPointAnimation.toValue = CGPoint(x: -1, y: 2) // Bottom Left
        
        let animationGroup = CAAnimationGroup() // Group Animations together
        animationGroup.animations = [startPointAnimation, endPointAnimation]
        animationGroup.duration = 4
        animationGroup.repeatCount = .infinity // Repeat Animation Infinitely
        gradientLayer.add(animationGroup, forKey: nil)
        
        self.layer.addSublayer(gradientLayer)
    }
}
