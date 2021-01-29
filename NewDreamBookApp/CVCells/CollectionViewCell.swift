//
//  CollectionViewCell.swift
//  NewDreamBookApp
//
//  Created by Denis Velikanov on 26.12.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let mainStack = UIStackView()
    let themeStack = UIStackView()
    let durationStack = UIStackView()
    let imageView = UIImageView()
    let dateView = UILabel()
    let label4Theme = UILabel()
    let themeLabel = UILabel()
    let label4duration = UILabel()
    let durationLabel = UILabel()
    let ratingController = UISegmentedControl(items: segmentedArray)
    
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .systemGray2
        setup()
        constraint()
        backgroundColor = .white
        enableCornerRadius(radius: 10)
    }
    
    func setup() {
        [mainStack].forEach { contentView.addSubview($0) }
        [dateView, imageView, themeStack, durationStack, ratingController].forEach { mainStack.addArrangedSubview($0) }
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        mainStack.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.backgroundColor = .systemIndigo
        mainStack.enableCornerRadius(radius: 10)
        
        [label4Theme, themeLabel].forEach { themeStack.addArrangedSubview($0) }
        themeStack.axis = .horizontal
        themeStack.distribution = .fillEqually
        themeStack.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        themeStack.isLayoutMarginsRelativeArrangement = true
        
        [label4duration, durationLabel].forEach { durationStack.addArrangedSubview($0) }
        durationStack.axis = .horizontal
        durationStack.distribution = .fillEqually
        durationStack.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        durationStack.isLayoutMarginsRelativeArrangement = true
        durationStack.spacing = CGFloat(10)
        
        label4Theme.text = "About"
        label4Theme.font = UIFont.systemFont(ofSize: 20)
        label4Theme.adjustsFontSizeToFitWidth = true
        label4Theme.textColor = .systemGray3
        
        label4duration.text = "Slept time:"
        label4duration.font = UIFont.systemFont(ofSize: 20)
        label4duration.adjustsFontSizeToFitWidth = true
        label4duration.textColor = .systemGray3
        
        ratingController.selectedSegmentTintColor = .systemRed
        let intRandom = Int.random(in: 1...4)
        imageView.image = UIImage(named: "\(intRandom)")
    }
    
    func constraint() {
        mainStack.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
    }
    
    func setDate(date: String) {
        let font = UIFont.boldSystemFont(ofSize: 20)
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 6
        myShadow.shadowOffset = CGSize(width: 5, height: 7)
        myShadow.shadowColor = UIColor.systemRed
        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.shadow: myShadow,
                          NSAttributedString.Key.foregroundColor: UIColor.red]
        let myAttributesString = NSAttributedString(string: date, attributes: attributes)
        dateView.attributedText = myAttributesString
        dateView.numberOfLines = 0
        dateView.adjustsFontSizeToFitWidth = true
        dateView.textAlignment = .center
        dateView.textColor = .systemIndigo
        dateView.backgroundColor = .systemGray3
    }
    
    func setTheme(theme: String) {
        themeLabel.text = theme
        themeLabel.textColor = .white
        themeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        themeLabel.adjustsFontSizeToFitWidth = true
        themeLabel.numberOfLines = 0
        themeLabel.textAlignment = .center
    }
    
    func setDuration(duration: String) {
        durationLabel.text = "\(duration) hours"
        durationLabel.textColor = .white
        durationLabel.adjustsFontSizeToFitWidth = true
        durationLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    func setRating(rate: Int) {
        ratingController.selectedSegmentIndex = rate
        ratingController.selectedSegmentTintColor = .systemGray3
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
}
