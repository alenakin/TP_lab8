//
//  BookViewController.swift
//  lab8_4
//
//  Created by Elena on 27.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var image:UIImage? = nil
    var author:String? = nil
    var descript: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageV.image = image
        authorLabel.text = author
        descriptionLabel.text = descript
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
