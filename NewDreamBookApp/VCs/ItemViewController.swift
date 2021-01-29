//
//  ItemViewController.swift
//  NewDreamBookApp
//
//  Created by Denis Velikanov on 29.12.2020.
//

import UIKit

class ItemViewController: UIViewController {
    let mainStack = UIStackView()
    let themeStack = UIStackView()
    let durationStack = UIStackView()
    let imageView = UIImageView()
    let dateView = UILabel()
    let label4Theme = UILabel()
    let themeLabel = UILabel()
    let descriptionLabel = UILabel()
    let label4duration = UILabel()
    let durationLabel = UILabel()
    let ratingController = UISegmentedControl(items: segmentedArray)
    var currentDream = Dream()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setup()
        constraint()
    }
    
    func constraint() {
        mainStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        imageView.anchor(top: mainStack.safeAreaLayoutGuide.topAnchor, leading: mainStack.safeAreaLayoutGuide.leadingAnchor, bottom: themeStack.safeAreaLayoutGuide.topAnchor, trailing: mainStack.safeAreaLayoutGuide.trailingAnchor)
        themeStack.anchor(top: imageView.bottomAnchor, leading: mainStack.safeAreaLayoutGuide.leadingAnchor, bottom: descriptionLabel.topAnchor, trailing: mainStack.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        descriptionLabel.anchor(top: themeStack.safeAreaLayoutGuide.bottomAnchor, leading: mainStack.leadingAnchor, bottom: durationStack.safeAreaLayoutGuide.topAnchor, trailing: mainStack.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        durationStack.anchor(top: descriptionLabel.bottomAnchor, leading: mainStack.safeAreaLayoutGuide.leadingAnchor, bottom: ratingController.topAnchor, trailing: mainStack.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        ratingController.anchor(top: durationStack.bottomAnchor, leading: mainStack.safeAreaLayoutGuide.leadingAnchor, bottom: mainStack.safeAreaLayoutGuide.bottomAnchor, trailing: mainStack.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        ratingController.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.height / 2 - 100).isActive = true
    }
}
