//
//  ViewController.swift
//  NavBar&TabBar
//
//  Created by Alibek Kozhambekov on 30.10.2022.
//

import UIKit

struct MusicList {
    let image: UIImage
    let albomName: String
    let singer: String
}

class MusicViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedIndex: Int = 0
    
    let music: [MusicList] = [
        MusicList(image: #imageLiteral(resourceName: "buster-keaton"), albomName: "Bustor Keaton", singer: "Miyagi & Andy Panda"),
        MusicList(image: #imageLiteral(resourceName: "legenda"), albomName: "Legend", singer: "Da Gudda Jaz"),
        MusicList(image: #imageLiteral(resourceName: "yamakasi"), albomName: "Yamakasi", singer: "Miyagi & Andy Panda"),
        MusicList(image: #imageLiteral(resourceName: "hit-hop"), albomName: "Hit-Hop", singer: "Da Gudda Jaz"),
        MusicList(image: #imageLiteral(resourceName: "hattori"), albomName: "Hattori", singer: "Miyagi & Andy Panda")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "MusicCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "musicIdentifier")
    }
}

//MARK: - DataSource

extension MusicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        music.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "musicIdentifier", for: indexPath) as! MusicCollectionViewCell
        cell.imageView.image = music[indexPath.row].image
        cell.title.text = music[indexPath.row].albomName
        return cell
    }
}

//MARK: - Delegate

extension MusicViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "musicDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "musicDetail" {
            if let detailVC = segue.destination as? MusicDetailViewController {
                detailVC.musicImage = music[selectedIndex].image
                detailVC.musicName = music[selectedIndex].albomName
                detailVC.musicSinger = music[selectedIndex].singer
            }
        }
    }
}

