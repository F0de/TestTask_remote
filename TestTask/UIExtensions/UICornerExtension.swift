//
//  UICornerExtension.swift
//  TestTask
//
//  Created by Влад Тимчук on 17.06.2023.
//

import UIKit

// Extension for UITableViewCell
extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}
