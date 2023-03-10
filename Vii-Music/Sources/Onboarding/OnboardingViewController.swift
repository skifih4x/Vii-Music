//
//  OnboardingViewController.swift
//  Vii-Music
//
//  Created by Артем Орлов on 15.01.2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    private let firstOnboardingScreen = OnboardingScreens()
    private let secondOnboardingScreen = OnboardingScreens()
    private let thirdOnboardingScreen = OnboardingScreens()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.contentInsetAdjustmentBehavior = .scrollableAxes
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "OnboardingBack")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = Theme.brightGreen
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    private var slides = [OnboardingScreens]()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        slides = createSlides()
        setupSlidesScrollView(slides: slides)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrints()
        setDelegates()
        buttonsTapped()
    }

    private func setupViews() {
        view.backgroundColor = Theme.bgColor
        navigationController?.isNavigationBarHidden = true
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundImageView)
        view.addSubview(pageControl)
    }

    private func setDelegates() {
        scrollView.delegate = self
    }

    private func createSlides() -> [OnboardingScreens] {
        firstOnboardingScreen.setPageLabelText(text: "Welcome to the world of Music")
        firstOnboardingScreen.setPageSubLabelText(text: "Millions of tracks to perfectly fit your mood")
        firstOnboardingScreen.setPageImage(image: UIImage(named: "OnboardingImage01")!)
        firstOnboardingScreen.hideDoneButton()

        secondOnboardingScreen.setPageLabelText(text: "Search and listen to the millions of artists")
        secondOnboardingScreen.setPageSubLabelText(text: "Music of any style, genre and tempo, so you'll find exactly what you want to listen")
        secondOnboardingScreen.setPageImage(image: UIImage(named: "OnboardingImage02")!)
        secondOnboardingScreen.hideDoneButton()
        secondOnboardingScreen.setLabelColor()

        thirdOnboardingScreen.setPageLabelText(text: "Your favourite music is always with you")
        thirdOnboardingScreen.setPageSubLabelText(text: "Save your favourite music to your device and you'll never be alone as your music will always be with you")
        thirdOnboardingScreen.setPageImage(image: UIImage(named: "OnboardingImage03")!)
        thirdOnboardingScreen.hideSkipButton()
        thirdOnboardingScreen.setLabelColor()

        return [firstOnboardingScreen, secondOnboardingScreen, thirdOnboardingScreen]
    }

    private func setupSlidesScrollView(slides: [OnboardingScreens]) {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                        height: view.frame.height)

        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                     y: 0,
                                     width: view.frame.width,
                                     height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

    func buttonsTapped() {
        firstOnboardingScreen.skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        secondOnboardingScreen.skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        thirdOnboardingScreen.doneButton.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .primaryActionTriggered)
    }

    @objc func skipButtonTapped() {
        secondOnboardingScreen.showAnimation {
            //go straight to login screen
            let mainTabBarController = MainTabBarViewController()
            if let navigator = self.navigationController {
                navigator.pushViewController(mainTabBarController, animated: true)
            }
        }
    }

    @objc func doneButtonTapped(_ sender: UIButton) {
        sender.showAnimation {
            //go straight to login screen
            let mainTabBarController = MainTabBarViewController()
            if let navigator = self.navigationController {
                navigator.pushViewController(mainTabBarController, animated: true)
            }
        }
    }
}
//MARK: - UIScrollViewDelegate
extension OnboardingViewController: UIScrollViewDelegate, UIPageViewControllerDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

//MARK: - Set Constraints
extension OnboardingViewController {
    private func setConstrints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Theme.spacing),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Theme.spacing),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Theme.spacing),
            pageControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
