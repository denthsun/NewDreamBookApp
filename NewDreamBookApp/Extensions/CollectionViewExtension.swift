
//  CollectionViewExtension.swift
//  NewDreamBookApp
//
//  Created by Denis Velikanov on 26.12.2020.


import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dreamsArray?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let dream = dreamsArray?[indexPath.row]
        let date = dream?.value(forKey: "date") as? Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyy"
        let dateString = dateFormatter.string(from: date!)
        cell.setDate(date: dateString)
        cell.setTheme(theme: dreamsArray?[indexPath.row].theme ?? "")
        cell.setDuration(duration: dreamsArray?[indexPath.row].duration ?? "")
        cell.setRating(rate: Int(dreamsArray?[indexPath.row].rating ?? 2))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ItemViewController()
        vc.currentDream = (dreamsArray?[indexPath.row])!
        navigationController?.pushViewController(vc, animated: true)
    }
}
