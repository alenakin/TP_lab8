//
//  ViewController.swift
//  lab8_4
//
//  Created by Elena on 27.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = NSMutableDictionary()
    
    override func viewDidLoad() {
        NSLog("feg");
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.items = loadPlist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadPlist()->NSMutableDictionary{
        let path = Bundle.main.path(forResource: "Library", ofType: "plist")
        return NSMutableDictionary(contentsOf: URL.init(fileURLWithPath: path!))!
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return items.count
    }
    
    func collectionView(_ tableView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionCell
        let item = items.value(forKey: String(indexPath.row + 1)) as! NSDictionary
        cell.imageV!.image = UIImage(named: item.value(forKey: "image") as! String)
        cell.titleLabel!.text = item.value(forKey:"title") as? String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("norm");
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
        let item = items.value(forKey: String(indexPath.row + 1)) as! NSDictionary
        controller.title = item.value(forKey:"title") as? String
        controller.image = UIImage(named: item.value(forKey: "image") as! String)
        controller.author = item.value(forKey:"author") as? String
        controller.descript = item.value(forKey:"about") as? String
    }
}

