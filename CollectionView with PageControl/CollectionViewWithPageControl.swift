//
//  CollectionViewWithPageControl.swift
//  CollectionView with PageControl
//
//  Created by omrobbie on 30/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class CollectionViewWithPageControl: UIViewController {

    @IBOutlet weak var constraintHeight: NSLayoutConstraint!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showView(_ onView: UIView) {
        onView.addSubview(view)
        constraintHeight.constant = onView.frame.height
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: onView.topAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: onView.rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: onView.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: onView.leftAnchor).isActive = true
    }
}
