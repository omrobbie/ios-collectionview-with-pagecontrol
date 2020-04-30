//
//  CollectionViewWithPageControl.swift
//  CollectionView with PageControl
//
//  Created by omrobbie on 30/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

protocol CollectionViewWithPageControlDelegate {

    func cellForItemAt(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    func didSelectItemAt(collectionView: UICollectionView, indexPath: IndexPath)
}

class CollectionViewWithPageControl: UIViewController {

    @IBOutlet fileprivate weak var constraintHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet fileprivate weak var pageControl: UIPageControl!

    var delegate: CollectionViewWithPageControlDelegate?

    var cellName = ""
    var itemCount = 0

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

    func numberOfPage(_ count: Int) {
        itemCount = count
        pageControl.numberOfPages = count
        collectionView.reloadData()
    }

    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath)
        delegate?.cellForItemAt(collectionView: collectionView, cell: cell, indexPath: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemAt(collectionView: collectionView, indexPath: indexPath)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = scrollView.contentOffset.x
        let cellWidth = UIScreen.main.bounds.width
        pageControl.currentPage = Int(point / cellWidth)
    }
}
