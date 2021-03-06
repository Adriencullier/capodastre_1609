//
//  UIView*Extension.swift
//  UIView*Extension
//
//  Created by Adrien Cullier on 08/09/2021.
//


import Foundation
import UIKit

// Extension used to simplify the views' Anchor
extension UIView {
    ///
    func anchor (
        top: NSLayoutYAxisAnchor?,
        bottom : NSLayoutYAxisAnchor?,
        leading : NSLayoutXAxisAnchor?,
        trailing : NSLayoutXAxisAnchor?,
        padding : UIEdgeInsets = .zero,
        size : CGSize = .zero) {
            
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    ///
    func centerAnchor (
        centerX: NSLayoutXAxisAnchor?,
        centerY : NSLayoutYAxisAnchor?) {
            
        translatesAutoresizingMaskIntoConstraints = false
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
}

