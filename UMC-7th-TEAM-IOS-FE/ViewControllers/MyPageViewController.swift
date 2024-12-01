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
    private var isExpanded = false
    private var visibleReviewCount = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPageView
        setDataSource()
        setAction()
    }
    
    // MARK: - function
    private func setDataSource() {
        myPageView.menuCollectionView.dataSource = self
        myPageView.reviewTableView.dataSource = self
        myPageView.reviewTableView.delegate = self
    }
    
    private func setAction() {
        myPageView.filterButton.addTarget(self, action: #selector(filterButtonTapped(_ :)), for: .touchUpInside)
        myPageView.moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
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
    
    @objc
    private func moreButtonTapped(_ sender: UIButton) {
        isExpanded.toggle()
        visibleReviewCount = isExpanded ? 7 : 3
        myPageView.moreButton.setTitle(isExpanded ? "접기" : "더보기", for: .normal)
        
        UIView.animate(withDuration: 0) { [weak self] in
            guard let self = self else { return }
            self.myPageView.reviewTableView.snp.updateConstraints {
                $0.height.equalTo(148 * self.visibleReviewCount)
            }
            self.myPageView.layoutIfNeeded()
        }
        myPageView.reviewTableView.reloadData()
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

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let reviews = MyPageReviewModel.dummy()
        return min(reviews.count, visibleReviewCount)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageReviewTableViewCell.identifier, for: indexPath) as? MyPageReviewTableViewCell else {
            return UITableViewCell()
        }
        
        let list = MyPageReviewModel.dummy()[indexPath.row]
        cell.bookImage.image = list.bookImage
        cell.bookTitle.text = list.bookTitle
        cell.bookInfo.text = list.bookInfo
        cell.starLabel.text = list.starLabel
        cell.reviewDateLabel.text = list.dateLabel
        cell.reviewLabel.text = list.reviewLabel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        148
    }
    
}
