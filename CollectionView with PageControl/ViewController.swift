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

    let collectionPage = CollectionViewWithPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewWithPageControl()
    }

    fileprivate func setupCollectionViewWithPageControl() {
        collectionPage.showView(controlView)
    }
}
