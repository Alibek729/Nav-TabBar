//
//  BookDetailViewController.swift
//  NavBar&TabBar
//
//  Created by Alibek Kozhambekov on 30.10.2022.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    var image: UIImage?
    var name: String = ""
    var author: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        bookName.text = name
        bookAuthor.text = author
        bookAuthor.textColor = .darkGray
    }

}
