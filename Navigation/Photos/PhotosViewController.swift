//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Владислав Колундаев on 02.10.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    var photos = [String]()

    var collectionView: UICollectionView!

    override func loadView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        let side = (UIScreen.main.bounds.width - 4 * 8) / 3.1
        layout.itemSize = CGSize(width: side, height: side)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view = collectionView

        navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"

        setupCollectionView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        let photoName = photos[indexPath.row]
        cell.configure(with: photoName)
        return cell
    }
}
