//
//  MyPageViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 30/11/2024.
//

import UIKit

class MyPageViewController: UIViewController {
    private let myPageView = MyPageView()
    private let menuData = MyPageMenuModel.dummy()
    private let bookData = MyPageBookModel.dummy()
    private var isExpanded = false
    private var visibleReviewCount = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPageView
        setDataSource()
        setAction()
        updateCenterBookInfo()
    }
    
    // MARK: - function
    private func setDataSource() {
        myPageView.menuCollectionView.dataSource = self
        myPageView.reviewTableView.dataSource = self
        myPageView.reviewTableView.delegate = self
        myPageView.bookSlideCollectionView.dataSource = self
        myPageView.bookSlideCollectionView.delegate = self
    }
    
    private func setAction() {
        myPageView.filterButton.addTarget(self, action: #selector(filterButtonTapped(_ :)), for: .touchUpInside)
        myPageView.moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func updateCenterBookInfo() {
        // 초기 중앙 셀 데이터 가져오기
        let initialIndex = 0
        let book = bookData[initialIndex]
        myPageView.bookSlideTitleLabel.text = book.bookTitle
        myPageView.bookSlideInfoLabel.text = book.bookInfo
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

extension MyPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === myPageView.menuCollectionView {
            return menuData.count
        }
        else if collectionView === myPageView.bookSlideCollectionView {
            return bookData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView === myPageView.menuCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageMenuCollectionViewCell.identifier, for: indexPath) as? MyPageMenuCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = menuData[indexPath.row]
            cell.menuIcon.image = list.menuIcon
            cell.menuLabel.text = list.menuLabel
            return cell
        }
        else if collectionView === myPageView.bookSlideCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageBookCollectionViewCell.identifier, for: indexPath) as? MyPageBookCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = bookData[indexPath.row]
            cell.bookImage.image = list.bookImage
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let layout = myPageView.bookSlideCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let centerX = scrollView.contentOffset.x + myPageView.bookSlideCollectionView.frame.size.width / 2
        var currentCenterIndexPath: IndexPath? = nil
        
        for cell in myPageView.bookSlideCollectionView.visibleCells {
            guard let indexPath = myPageView.bookSlideCollectionView.indexPath(for: cell),
                  let attributes = myPageView.bookSlideCollectionView.layoutAttributesForItem(at: indexPath) else { continue }
            
            let cellCenterX = attributes.frame.midX
            
            // 중앙에 있는 셀인지 확인
            if abs(cellCenterX - centerX) < layout.itemSize.width / 2 {
                currentCenterIndexPath = indexPath
                break // 중앙 셀을 찾았으므로 루프 종료
            }
        }
        
        // 중앙 셀에 해당하는 제목과 정보 업데이트
        if let indexPath = currentCenterIndexPath {
            let book = bookData[indexPath.row]
            myPageView.bookSlideTitleLabel.text = book.bookTitle
            myPageView.bookSlideInfoLabel.text = book.bookInfo
        } else {
            // 중앙 셀이 없을 경우 제목/정보 초기화
            myPageView.bookSlideTitleLabel.text = ""
            myPageView.bookSlideInfoLabel.text = ""
        }
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
