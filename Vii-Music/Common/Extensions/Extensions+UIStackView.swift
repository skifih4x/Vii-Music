//
//  Extensions+UIStackView.swift
//  Vii-Music
//
//  Created by Sergio on 9.01.23.
//

import UIKit

extension UIStackView {

    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
