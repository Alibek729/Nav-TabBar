//
//  BookViewController.swift
//  NavBar&TabBar
//
//  Created by Alibek Kozhambekov on 30.10.2022.
//

import UIKit

struct BookList {
    let image: UIImage
    let name: String
    let author: String
}

class BookViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedIndex: Int = 0
    
    let books: [BookList] = [
        BookList(image: #imageLiteral(resourceName: "american-midnight"), name: "American Midnight", author: "by Adam Hochschild"),
        BookList(image: #imageLiteral(resourceName: "kiki-man-ray"), name: "Kiki Man Ray", author: "by Mark Braude"),
        BookList(image: #imageLiteral(resourceName: "heaven"), name: "Heaven", author: "by Emma Donoghue"),
        BookList(image: #imageLiteral(resourceName: "the-joy-of-quitting"), name: "The Joy of Quitting", author: "by Keiler Roberts"),
        BookList(image: #imageLiteral(resourceName: "the-book-of-goose"), name: "The Book of Goose", author: "by Yiyun Li")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "BookCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "bookIdentifier")
    }
}

//MARK: - DataSource
extension BookViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookIdentifier", for: indexPath) as! BookCollectionViewCell
        cell.imageView.image = books[indexPath.row].image
        cell.title.text = books[indexPath.row].name
        return cell
    }
}

//MARK: - Delegate

extension BookViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "bookDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bookDetail" {
            if let detailVC = segue.destination as? BookDetailViewController {
                detailVC.image = books[selectedIndex].image
                detailVC.name = books[selectedIndex].name
                detailVC.author = books[selectedIndex].author
            }
        }
    }
}


