//
//  ViewController.swift
//  CollectionView with PageControl
//
//  Created by omrobbie on 30/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var controlView: UIView!

    fileprivate let collectionPage = CollectionViewWithPageControl()
    fileprivate let data = ["One", "Two", "Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewWithPageControl()
    }

    fileprivate func setupCollectionViewWithPageControl() {
        collectionPage.delegate = self
        collectionPage.cellName = "ControlCell"
        collectionPage.showView(controlView)
        collectionPage.numberOfPage(data.count)
    }
}

extension ViewController: CollectionViewWithPageControlDelegate {

    func cellForItemAt(cell: UICollectionViewCell, indexPath: IndexPath) {
        let myCell = cell as! ControlCell
        myCell.lblTitle.text = data[indexPath.row]
    }

    func didSelectItemAt(indexPath: IndexPath) {
        print("Item \(indexPath.row) selected!")
    }
}
