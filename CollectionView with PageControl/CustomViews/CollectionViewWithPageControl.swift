//
//  CollectionViewWithPageControl.swift
//  CollectionView with PageControl
//
//  Created by omrobbie on 30/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class CollectionViewWithPageControl: UIViewController {

    @IBOutlet fileprivate weak var constraintHeight: NSLayoutConstraint!

    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    @IBOutlet fileprivate weak var pageControl: UIPageControl!

    fileprivate let cellId = "CollectionViewWithPageControl"
    fileprivate let itemCount = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
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

    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ControlCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        pageControl.numberOfPages = itemCount
    }
}

extension CollectionViewWithPageControl: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ControlCell
        cell.lblTitle.text = "Item \(indexPath.row)"
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = scrollView.contentOffset.x
        let cellWidth = UIScreen.main.bounds.width
        pageControl.currentPage = Int(point / cellWidth)
    }
}
