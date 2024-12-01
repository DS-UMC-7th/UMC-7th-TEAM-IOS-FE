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
        setAction()
    }
    
    // MARK: - function
    private func setDataSource() {
        myPageView.menuCollectionView.dataSource = self
    }
    
    private func setAction() {
        myPageView.filterButton.addTarget(self, action: #selector(filterButtonTapped(_ :)), for: .touchUpInside)
    }
    
    // MARK: - action
    @objc
    func filterButtonTapped(_ sender: UIButton) {
        let option1 = UIAction(title: "별점 높은 순") { action in
            self.myPageView.filterButton.setTitle(action.title, for: .normal)
        }
        let option2 = UIAction(title: "최신순") { action in
            self.myPageView.filterButton.setTitle(action.title, for: .normal)
        }
        let option3 = UIAction(title: "공감 많은 순") { action in
            self.myPageView.filterButton.setTitle(action.title, for: .normal)
        }
        
        let menu = UIMenu(children: [option1, option2, option3])
        
        sender.menu = menu
        sender.showsMenuAsPrimaryAction = true
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
