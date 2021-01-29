//
//  ViewController.swift
//  NewDreamBookApp
//
//  Created by Denis Velikanov on 26.12.2020.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let mainImage = UIImageView()
    let plusButton = UIButton()
    var dream: Dream?
    let collectionView: UICollectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dreams"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(clearCoreData))
        setLayout()
        register()
        setup()
        constraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appendArray()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Dream>(entityName: "Dream")
        do {
            dreamsArray = try managedContext.fetch(fetchRequest)
        } catch {
            print("no way, its fucked up")
        }
        collectionView.reloadData()
    }
    
    func setLayout() {
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: view.frame.width / 2 - 10, height: view.frame.height / 2.5)
        layout.minimumLineSpacing = CGFloat(10)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    @objc func clearCoreData() {
        removeCoreData()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Dream>(entityName: "Dream")
        do {
            dreamsArray = try managedContext.fetch(fetchRequest)
        } catch {
            print("no way, its fucked up")
        }
        collectionView.reloadData()
    }
    
    func removeCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dream")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedContext.execute(deleteRequest)
        } catch let error as NSError {
            
            print(error.localizedDescription)
        }
        collectionView.reloadData()
    }
    
    func appendArray() {
        dreamsArray?.append(dream ?? Dream())
    }

    func register() {
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    func setup() {
        [mainImage, collectionView, plusButton].forEach { view.addSubview($0) }
        mainImage.image = UIImage(named: "three")
        mainImage.backgroundColor = .systemRed
        mainImage.contentMode = .scaleAspectFill
        
        collectionView.enableCornerRadius(radius: 20)
        collectionView.backgroundColor = .gray
        collectionView.delegate = self
        collectionView.dataSource = self
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.systemIndigo, for: .normal)
        plusButton.backgroundColor = .white
        plusButton.enableCornerRadius(radius: 35)
        plusButton.addTarget(self, action: #selector(addDream), for: .touchUpInside)
        
    }
    
    func constraint() {
        mainImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: collectionView.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        collectionView.anchor(top: mainImage.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        collectionView.heightAnchor.constraint(equalToConstant:  view.frame.height - view.frame.height / 3).isActive = true
        plusButton.anchor(top: nil, leading: nil, bottom: collectionView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 25, right: 0), size: .init(width: 70, height: 70))
        plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func addDream() {
        let newVC = DreamViewController()
        navigationController?.pushViewController(newVC, animated: true)
    }
}
