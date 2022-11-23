//
//  MovieViewController.swift
//  NavBar&TabBar
//
//  Created by Alibek Kozhambekov on 30.10.2022.
//

import UIKit

struct Movies {
    let name: String
    let image: UIImage
    let category: String
}

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedIndex: Int = 0
    
    let movieArray: [Movies] = [
        Movies(name: "Black Adam", image: #imageLiteral(resourceName: "black-adam"), category: "Action"),
        Movies(name: "Fire", image: #imageLiteral(resourceName: "Fire"), category: "History"),
        Movies(name: "Halloween Ends", image: #imageLiteral(resourceName: "halloween-ends"), category: "Horror"),
        Movies(name: "One Piece Film: Red", image: #imageLiteral(resourceName: "one-piece-film-red"), category: "Anime"),
        Movies(name: "Dead Poetry Society", image: #imageLiteral(resourceName: "dead-poets-society"), category: "Drama")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemMint
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        var content =  cell.defaultContentConfiguration()
        content.text = movieArray[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Movies"
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailedInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedInfo" {
            if let detailVC = segue.destination as? MovieDetailViewController {
                detailVC.image = movieArray[selectedIndex].image
                detailVC.name = movieArray[selectedIndex].name
                detailVC.category = movieArray[selectedIndex].category
            }
        }
    }

}
