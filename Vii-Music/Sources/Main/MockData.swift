//
//  MockData.swift
//  Vii-Music
//
//  Created by Alexander Altman on 19.01.2023.
//

import UIKit

struct MockData {
    
    static let shared = MockData()
    
    private let firstSection: ListSection = {
        .first([
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage())
        ])
    }()
    
    private let secondSection: ListSection = {
        .second([
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage()),
            .init(title: " ", image: UIImage(named: "note")!, id: 1, button: UIImage())
        ])
    }()
    
    var pageData: [ListSection] {
        [firstSection, secondSection]
    }
}
