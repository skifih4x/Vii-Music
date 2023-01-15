//
//  OnboardingScreens.swift
//  Vii-Music
//
//  Created by Артем Орлов on 15.01.2023.
//

import UIKit

class OnboardingScreens: UIView {

    private let pageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let pageSubLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let pageImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "OnboardingImage01")
        image.layer.cornerRadius = 103.5
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        image.layer.borderColor = Theme.bgColor.cgColor
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let doneButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = Theme.brightGreen.cgColor
        button.setTitle("Done", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let skipButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = Theme.brightGreen.cgColor
        button.setTitle("Skip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageImage)
        addSubview(pageLabel)
        addSubview(pageSubLabel)
        addSubview(doneButton)
        addSubview(skipButton)
        setConstraints()
        buttonsTapped()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setPageLabelText(text: String) {
        pageLabel.text = text
    }

    public func setPageSubLabelText(text: String) {
        pageSubLabel.text = text
    }

    public func setPageImage(image: UIImage) {
        pageImage.image = image
    }

    public func setLabelColor() {
        pageLabel.textColor = Theme.brightGreen
        pageSubLabel.textColor = Theme.brightGreen
    }

    public func hideDoneButton() {
        doneButton.isHidden = true
    }

    public func hideSkipButton() {
        skipButton.isHidden = true
    }

    func buttonsTapped() {
        skipButton.addTarget(self, action: #selector(skipButtonTapped(_:)), for: .primaryActionTriggered)
        doneButton.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .primaryActionTriggered)
    }

    @objc func skipButtonTapped(_ sender: UIButton) {
        sender.showAnimation {
            print("skipskip")
            //go straight to login screen
        }
    }

    @objc func doneButtonTapped(_ sender: UIButton) {
        sender.showAnimation {
            print("donedone")
            //go straight to login screen
        }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),

            pageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Theme.spacing),
            pageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Theme.spacing),
            pageLabel.topAnchor.constraint(equalTo: pageImage.bottomAnchor, constant: 40),
            pageLabel.heightAnchor.constraint(equalToConstant: 100),

            pageSubLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Theme.spacing),
            pageSubLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Theme.spacing),
            pageSubLabel.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 20),
            pageSubLabel.heightAnchor.constraint(equalToConstant: 100),

            doneButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Theme.spacing),
            doneButton.widthAnchor.constraint(equalToConstant: 100),
            doneButton.heightAnchor.constraint(equalToConstant: 30),

            skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            skipButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Theme.spacing),
            skipButton.widthAnchor.constraint(equalToConstant: 100),
            skipButton.heightAnchor.constraint(equalToConstant: 30),

        ])
    }

}

 extension UIView {
    func showAnimation(_ completionBlock: @escaping () -> Void) {
      isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
}

