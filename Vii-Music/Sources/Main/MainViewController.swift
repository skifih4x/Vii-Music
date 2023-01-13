//
//  MainViewController.swift
//  Vii-Music
//
//  Created by Alexander Altman on 12.01.2023.
//

import UIKit

final class MainViewController: UIViewController {

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, PUT-USER-Name"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headerSubLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you want to hear today?"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headerStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 10.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let segmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl()
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        setConstraints()
        
    }
   
    
    func setupViews() {
        view.backgroundColor = Theme.bgColor
        
        view.addSubview(headerStackView)
        view.addSubview(searchBar)
        view.addSubview(segmentedControl)
        headerStackView.addArrangedSubview(headerLabel)
        headerStackView.addArrangedSubview(headerSubLabel)
        
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            headerStackView.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10),
            
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])
       
    }
    
    
    
    
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = MainViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> MainViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}
