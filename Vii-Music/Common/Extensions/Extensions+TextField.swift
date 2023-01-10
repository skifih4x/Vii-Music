//
//  Extensions+TextField.swift
//  Vii-Music
//
//  Created by Sergio on 9.01.23.
//

import UIKit

extension UITextField {

    func addTextFieldSetup() {
        backgroundColor = .white
        textColor = .black
        font = .systemFont(ofSize: 16)
        borderStyle = .none
        layer.cornerRadius = 6
        translatesAutoresizingMaskIntoConstraints = false
    }

    func setLeftPaddingPoints(_ amount:CGFloat){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
}
