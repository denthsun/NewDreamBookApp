//
//  ViewControllerExtensions.swift
//  NewDreamBookApp
//
//  Created by Denis Velikanov on 29.12.2020.
//

import UIKit


extension DreamViewController {
    
    func setup() {
        [topImage, topLabel, mainStack, saveButton].forEach { view.addSubview($0) }
        topImage.image = UIImage(named: "two")
        topImage.contentMode = .scaleToFill
        topImage.enableCornerRadius(radius: 15)
        
        topLabel.text = "Dream: "
        topLabel.font = UIFont.boldSystemFont(ofSize: 30)
        topLabel.textColor = .black
        topLabel.textAlignment = .center
        
        mainStack.distribution = .fillEqually
        mainStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        mainStack.isLayoutMarginsRelativeArrangement = true
        mainStack.axis = .vertical
        mainStack.backgroundColor = .systemTeal
        mainStack.enableCornerRadius(radius: 20)
        
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.backgroundColor = .black
        saveButton.enableCornerRadius(radius: 20)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        
        [dateStack, themeStack, descriptStack, durationStack, ratingStack].forEach { mainStack.addArrangedSubview($0) }
        
        [label4date, datePicker].forEach { dateStack.addArrangedSubview($0) }
        dateStack.axis = .horizontal
        dateStack.layoutMargins = UIEdgeInsets(top: 15, left: 5, bottom: 5, right: 15)
        dateStack.isLayoutMarginsRelativeArrangement = true
        dateStack.distribution = .fillEqually
        
        label4date.text = "Dream Date: "
        label4date.font = UIFont.boldSystemFont(ofSize: 20)
        label4date.textColor = .white
        
        datePicker.datePickerMode = .date
        datePicker.tintColor = .black
        
        [label4theme, themeField].forEach { themeStack.addArrangedSubview($0) }
        themeStack.axis = .horizontal
        themeStack.distribution = .fillEqually
        themeStack.layoutMargins = UIEdgeInsets(top: 15, left: 5, bottom: 15, right: 5)
        themeStack.isLayoutMarginsRelativeArrangement = true
        
        label4theme.text = "Dream Theme: "
        label4theme.font = UIFont.boldSystemFont(ofSize: 20)
        label4theme.textColor = .white
        
        themeField.placeholder = "dream theme"
        themeField.textColor = .black
        themeField.backgroundColor = .white
        themeField.textAlignment = .center
        themeField.adjustsFontSizeToFitWidth = true
        themeField.enableCornerRadius(radius: 10)
        
        [label4desc, descField].forEach { descriptStack.addArrangedSubview($0) }
        descriptStack.axis = .horizontal
        descriptStack.distribution = .fillEqually
        descriptStack.layoutMargins = UIEdgeInsets(top: 15, left: 5, bottom: 15, right: 5)
        descriptStack.isLayoutMarginsRelativeArrangement = true
        
        label4desc.text = "More Details: "
        label4desc.adjustsFontSizeToFitWidth = true
        label4desc.font = UIFont.boldSystemFont(ofSize: 20)
        label4desc.textColor = .white
        
        descField.placeholder = "what it was about?"
        descField.textColor = .black
        descField.backgroundColor = .white
        descField.textAlignment = .center
        descField.adjustsFontSizeToFitWidth = true
        descField.enableCornerRadius(radius: 10)
        
        [label4duration, durationPicker].forEach { durationStack.addArrangedSubview($0) }
        durationStack.axis = .horizontal
        durationStack.distribution = .fillEqually
        durationStack.layoutMargins = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
        durationStack.isLayoutMarginsRelativeArrangement = true
        
        label4duration.text = "Slept Time: "
        label4duration.font = UIFont.boldSystemFont(ofSize: 20)
        label4duration.textColor = .white
        
        durationPicker.delegate = self
        durationPicker.dataSource = self
        
        [label4rating, ratingController].forEach { ratingStack.addArrangedSubview($0) }
        ratingStack.axis = .horizontal
        ratingStack.distribution = .fillEqually
        ratingStack.layoutMargins = UIEdgeInsets(top: 15, left: 5, bottom: 15, right: 5)
        ratingStack.isLayoutMarginsRelativeArrangement = true
        
        label4rating.text = "Rate Your Dream: "
        label4rating.adjustsFontSizeToFitWidth = true
        label4rating.font = UIFont.boldSystemFont(ofSize: 20)
        label4rating.textColor = .white
        
        ratingController.selectedSegmentTintColor = .systemTeal
        ratingController.backgroundColor = .systemGray5
    }
}

extension DreamViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        durationStuff = pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
}
