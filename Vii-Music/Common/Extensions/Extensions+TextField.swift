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

    func setLeftPaddingPoints(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }else{
            button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }

    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        button.tintColor = .black
        self.rightView = button
        self.rightViewMode = .always
    }

    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
