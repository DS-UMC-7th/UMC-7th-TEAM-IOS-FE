//
//  BookDetailPageViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 11/29/24.
//

import UIKit

class BookDetailViewController: UIViewController {
    private let bookDetailView = BookDetailView()
    private let data = BookDetailModel.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = bookDetailView

        bookDetailView.bookDetailCell.configure(with: data)
    }
}
/*
extension BookDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookDetailCell.identifier, for: indexPath) as? BookDetailCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: data)
        return cell
    }
}*/
