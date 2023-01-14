//
//  Extensions+Label.swift
//  Vii-Music
//
//  Created by Sergio on 9.01.23.
//

import UIKit

extension UILabel {
    convenience init(text: String, size: CGFloat, textColor: UIColor) {
        self.init()

        self.text = text
        self.textColor = textColor
        self.font = .systemFont(ofSize: size)
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
