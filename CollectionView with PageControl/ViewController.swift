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
    @IBOutlet weak var controlView2: UIView!

    fileprivate let collectionPage = CollectionViewWithPageControl()
    fileprivate let data = ["One", "Two", "Three"]

    fileprivate let collectionPage2 = CollectionViewWithPageControl()
    fileprivate let data2 = ["Bike", "Motorcycle", "Car", "Bus", "Truck"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewWithPageControl()
        setupCollectionViewWithPageControl2()
    }

    fileprivate func setupCollectionViewWithPageControl() {
        collectionPage.delegate = self
        collectionPage.cellName = "ControlCell"
        collectionPage.showView(controlView)
        collectionPage.numberOfPage(data.count)
    }

    fileprivate func setupCollectionViewWithPageControl2() {
        collectionPage2.delegate = self
        collectionPage2.cellName = "ControlCell2"
        collectionPage2.showView(controlView2)
        collectionPage2.numberOfPage(data2.count)
    }
}

extension ViewController: CollectionViewWithPageControlDelegate {

    func cellForItemAt(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath) {
        switch collectionView {
        case collectionPage.collectionView:
            let myCell = cell as! ControlCell
            myCell.lblTitle.text = data[indexPath.row]
        case collectionPage2.collectionView:
            let myCell = cell as! ControlCell2
            myCell.lblName.text = data2[indexPath.row]
        default: break
        }
    }

    func didSelectItemAt(collectionView: UICollectionView, indexPath: IndexPath) {
        switch collectionView {
        case collectionPage.collectionView: print("Item \(data[indexPath.row]) selected!")
        case collectionPage2.collectionView: print("Item \(data2[indexPath.row]) selected!")
        default: break
        }
    }
}
