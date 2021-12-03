//
//  ImageViewController.swift
//  LandmarkBook
//
//  Created by Hüseyin BAKAR on 3.12.2021.
//

import UIKit

final class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var name :  String?
    var image = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name ?? ""
        imageView.image = image
    }
    
}
