//
//  MusicDetailViewController.swift
//  NavBar&TabBar
//
//  Created by Alibek Kozhambekov on 30.10.2022.
//

import UIKit

class MusicDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var singer: UILabel!
    
    var musicImage: UIImage?
    var musicName: String = ""
    var musicSinger: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = musicImage
        name.text = musicName
        singer.text = musicSinger
        singer.textColor = .darkGray
    }

}
