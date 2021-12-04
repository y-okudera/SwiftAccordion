//
//  UIView+.swift
//  SwiftAccordion
//
//  Created by Yuki Okudera on 2021/12/04.
//

import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
