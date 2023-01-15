//
//  PlayViewController.swift
//  Vii-Music
//
//  Created by Sergio on 9.01.23.
//

import UIKit

final class PlayViewController: UIViewController {

    // MARK: - Properties

    private var playView: PlayView? {
        guard isViewLoaded else { return nil }
        return view as? PlayView
    }

    //MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = PlayView()
    }

    //MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
