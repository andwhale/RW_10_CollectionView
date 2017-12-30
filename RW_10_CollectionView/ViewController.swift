//
//  ViewController.swift
//  RW_10_CollectionView
//
//  Created by Andrew Velikiy on 12/31/17.
//  Copyright © 2017 Andrey Velikiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var collectionData = ["1 🧐", "2 😇", "3 😍", "4 😙", "5 🤩", "6 🤪", "7 🤫", "8 🤥", "9 🙄", "10 😴", "11 🤧", "12 👻"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.size.width - 20) / 3
        //need to force cast to a specific layout type because the collection view's collectionViewLayout property is of type UICollectionViewLayout which DOESN'T have an item size property, BUT UICollectionViewFlowLayout DOES have it since it deals with laying out items based on their size
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = collectionData[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let text = collectionData[indexPath.row]
        print("Tapped a cell with a label that reads: \(text)")
    }
    
}
