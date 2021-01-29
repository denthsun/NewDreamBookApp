//
//  DreamViewController.swift
//  NewDreamBookApp
//
//  Created by Denis Velikanov on 27.12.2020.
//

import UIKit
import CoreData

class DreamViewController: UIViewController {
    
    let topImage = UIImageView()
    let topLabel = UILabel()
    let mainStack = UIStackView()
    let dateStack = UIStackView()
    let themeStack = UIStackView()
    let descriptStack = UIStackView()
    let durationStack = UIStackView()
    let ratingStack = UIStackView()
    let saveButton = UIButton()
    let label4date = UILabel()
    let datePicker = UIDatePicker()
    let label4theme = UILabel()
    let themeField = UITextField()
    let label4desc = UILabel()
    let descField = UITextField()
    let label4duration = UILabel()
    var durationPicker = UIPickerView()
    let label4rating = UILabel()
    let ratingController = UISegmentedControl(items: segmentedArray)
    var durationStuff: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setup()
        constraint()
        createToolBar()
    }
    
    func constraint() {
        topImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: topLabel.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        topImage.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
        topLabel.anchor(top: topImage.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: mainStack.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        mainStack.anchor(top: topLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: saveButton.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        mainStack.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        saveButton.anchor(top: mainStack.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        datePicker.heightAnchor.constraint(equalTo: themeField.heightAnchor).isActive = true
        datePicker.widthAnchor.constraint(equalTo: themeField.widthAnchor).isActive = true
        
        themeField.widthAnchor.constraint(equalTo: descField.widthAnchor).isActive = true
        themeField.widthAnchor.constraint(equalTo: descField.widthAnchor).isActive = true

        durationPicker.widthAnchor.constraint(equalTo: descField.widthAnchor).isActive = true
        durationPicker.widthAnchor.constraint(equalTo: descField.widthAnchor).isActive = true
    }
    
    @objc func saveTapped() {
        let date2save = datePicker.date
        let theme2save = themeField.text!
        let desc2save = descField.text!
        let duration2save = durationStuff ?? "8"
        let rating2save = Int16(ratingController.selectedSegmentIndex)
            self.save(date: date2save, theme: theme2save, desc: desc2save, duration: duration2save, rating: rating2save)
        navigationController?.popViewController(animated: true)
    }
    
    func save(date: Date = Date(), theme: String, desc: String, duration: String, rating: Int16) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Dream", in: managedContext)
        let dream = Dream(entity: entity!, insertInto: managedContext)
            dream.date = datePicker.date
            dream.theme = themeField.text
            dream.rating = Int16(ratingController.selectedSegmentIndex)
            dream.descript = descField.text
            dream.duration = durationStuff
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func createToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barStyle = .black
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        
        themeField.inputAccessoryView = toolbar
        descField.inputAccessoryView = toolbar
        
        toolbar.tintColor = .white
        toolbar.barTintColor = .black
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
