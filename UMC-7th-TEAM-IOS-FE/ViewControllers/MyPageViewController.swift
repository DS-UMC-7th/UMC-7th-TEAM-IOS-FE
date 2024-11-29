//
//  MyPageViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 30/11/2024.
//

import UIKit

class MyPageViewController: UIViewController {
    private let myPageView = MyPageView()
    private let data = MyPageMenuModel.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPageView
        setDataSource()
    }
    
    // MARK: - function
    private func setDataSource() {
        myPageView.menuCollectionView.dataSource = self
    }

}

extension MyPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageMenuCollectionViewCell.identifier, for: indexPath) as? MyPageMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = data[indexPath.row]
        cell.menuIcon.image = list.menuIcon
        cell.menuLabel.text = list.menuLabel
        return cell
    }
    
    
}
