//
//  MovieDetailViewController.swift
//  NavBar&TabBar
//
//  Created by Alibek Kozhambekov on 30.10.2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    
    var image: UIImage?
    var name: String = ""
    var category: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        movieName.text = name
        categoryName.text = category
    }


}
