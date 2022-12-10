//
//  LibraryViewController.swift
//  SchoolLibrary
//
//  Created by Radi on 1.12.22.
//

import UIKit

class LibraryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var categories = ["Всички", "Mатематика", "Биология", "Физика", "Английски", "Френски", "Програмиране", "Музика", "Романи", "Фантастика"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let categoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell {
            categoryCollectionViewCell.categoryName.text = self.categories[indexPath.row]
            return categoryCollectionViewCell
            
        }
        return UICollectionViewCell()
    }
    
}
extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let bookCell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell {
            return bookCell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let bookDetailsViewController = UIStoryboard.library.instantiateViewController(withIdentifier: "BookDetailsViewController") as? BookDetailsViewController {
            self.navigationController?.pushViewController(bookDetailsViewController, animated: true)
        }
    }
}
