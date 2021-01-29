//
//  ItemViewControllerExtension.swift
//  NewDreamBookApp
//
//  Created by Denis Velikanov on 29.12.2020.
//

import UIKit

extension ItemViewController {
    func setup() {
        
        [mainStack].forEach { view.addSubview($0) }
        
        [imageView, themeStack, descriptionLabel, durationStack, ratingController].forEach { mainStack.addSubview($0) }
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        mainStack.layoutMargins = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.backgroundColor = .systemIndigo
        mainStack.enableCornerRadius(radius: 10)
        mainStack.spacing = CGFloat(10)
        
        descriptionLabel.text = currentDream.descript
        descriptionLabel.textColor = .white
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 19)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        ratingController.backgroundColor = .systemRed
        ratingController.selectedSegmentIndex = Int(currentDream.rating)

        [label4Theme, themeLabel].forEach { themeStack.addArrangedSubview($0) }
        themeStack.axis = .horizontal
        themeStack.distribution = .fillEqually
        themeStack.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        themeStack.isLayoutMarginsRelativeArrangement = true
        
        label4Theme.text = "About"
        label4Theme.font = UIFont.systemFont(ofSize: 20)
        label4Theme.adjustsFontSizeToFitWidth = true
        label4Theme.textColor = .systemGray3
        
        let font = UIFont.systemFont(ofSize: 35)
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 6
        myShadow.shadowOffset = CGSize(width: 5, height: 7)
        myShadow.shadowColor = UIColor.systemRed
        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.shadow: myShadow,
                          NSAttributedString.Key.foregroundColor: UIColor.red]
        let myAttributesString = NSAttributedString(string: currentDream.theme!, attributes: attributes)
        themeLabel.attributedText = myAttributesString
        themeLabel.textColor = .white
        themeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        themeLabel.adjustsFontSizeToFitWidth = true
        themeLabel.numberOfLines = 0
        
        [label4duration, durationLabel].forEach { durationStack.addArrangedSubview($0) }
        durationStack.axis = .horizontal
        durationStack.distribution = .fillEqually
        durationStack.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        durationStack.isLayoutMarginsRelativeArrangement = true
        
        durationLabel.text = "\(currentDream.duration ?? "") hours"
        durationLabel.textAlignment = .center
        durationLabel.textColor = .white
        durationLabel.adjustsFontSizeToFitWidth = true
        durationLabel.font = UIFont.boldSystemFont(ofSize: 19)
        
        label4duration.text = "Slept time:"
        label4duration.font = UIFont.systemFont(ofSize: 20)
        label4duration.adjustsFontSizeToFitWidth = true
        label4duration.textColor = .systemGray3
        
        let intRandom = Int.random(in: 1...4)
        imageView.image = UIImage(named: "\(intRandom)")
        if intRandom == 1 {
            ratingController.selectedSegmentTintColor = .systemOrange
        } else if intRandom == 2 {
            ratingController.selectedSegmentTintColor = .systemYellow
        } else if intRandom == 3 {
            ratingController.selectedSegmentTintColor = .white
        } else {
            ratingController.selectedSegmentTintColor = .systemYellow
        }
    }
}
