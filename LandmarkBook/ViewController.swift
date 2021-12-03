//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Hüseyin BAKAR on 3.12.2021.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var landmarkImages = [UIImage]()
    var landmarkNames = [String]()
    
    var selectedName = ""
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Taj Mahal")
        
        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        
        print("game over")
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            self.landmarkImages.remove(at: indexPath.row)
            self.landmarkNames.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = self.landmarkNames[indexPath.row]
        selectedImage = self.landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toImageViewController", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"
        {
            let vc = segue.destination as? ImageViewController
            vc?.name = selectedName
            vc?.image = selectedImage
        }
    }
    
    
}

