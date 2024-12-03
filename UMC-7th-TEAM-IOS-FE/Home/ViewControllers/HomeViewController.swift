//
//  HomeViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 11/30/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var recommendedBooks: [BookModel] = []
    private lazy var popularBooks: [BookModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        fetchBooks()
    }
    
    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.backgroundColor = .white
        homeView.homeCollectionView.delegate = self
        homeView.homeCollectionView.dataSource = self
        return homeView
    }()
    
    private func fetchBooks() {
        let group = DispatchGroup()
        
        HomeService.shared.fetchBooks(sortedBy: "highest", page: 0, size: 3) { [weak self] result in
            switch result {
            case .success(let books):
//                print("Books fetched: \(books)")
                self?.recommendedBooks = books
            case .failure(let error):
                print("Error fetching books: \(error.localizedDescription)")
            }
        }
    
        HomeService.shared.fetchBooks(sortedBy: "popular", page: 0, size: 3) { [weak self] result in
            switch result {
            case .success(let books):
                print("Books fetched: \(books)")
                self?.popularBooks = books
            case .failure(let error):
                print("Error fetching books: \(error.localizedDescription)")
            }
        }
        
        // 로딩 종료 및 UI 갱신
        group.notify(queue: .main) {
            self.homeView.homeCollectionView.reloadData()
        }
        
    }
    
    override func loadView() {
        self.view = homeView
        print("HomeView set as main view")
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return HomeCellModel.bannerData.count
        case 2: return recommendedBooks.count
        case 3: return popularBooks.count
        case 4: return HomeCellModel.bestSellerData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchBarCell.identifier, for: indexPath) as! SearchBarCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdBannerCell.identifier, for: indexPath) as! AdBannerCell
            let data = HomeCellModel.bannerData[indexPath.row]
            cell.configure(model: data)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationCell.identifier, for: indexPath) as! RecommendationCell
            let centerPoint = CGPoint(x: collectionView.bounds.midX, y: collectionView.bounds.midY)
            let isCentered = collectionView.indexPathForItem(at: centerPoint) == indexPath
            cell.configure(with: recommendedBooks[indexPath.row], isCentered: isCentered)
            return cell
        case 3:
//            if indexPath.row == 0 {
//                // 필터 아이템
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCell.identifier, for: indexPath) as! FilterCell
//                return cell
//            } else {
//                // 책 아이템
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCell.identifier, for: indexPath) as! BestSellerCell
            cell.configure(with: popularBooks[indexPath.row], count: indexPath.row + 1)
            return cell
//            }
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBookCell.identifier, for: indexPath) as! NewBookCell
            cell.configure(model: HomeCellModel.bestSellerData[indexPath.row], count: indexPath.row + 1)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    // 헤더 설정
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MoreButtonFooter.identifier, for: indexPath) as! MoreButtonFooter
            return footer
        case UICollectionView.elementKindSectionHeader:
            let baseHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: BaseCellHeader.identifier,
                for: indexPath
            ) as! BaseCellHeader
            
            // 섹션별 타이틀 설정
            if indexPath.section == 2 {
                baseHeader.configure(title: "오늘의 추천 도서")
            } else if indexPath.section == 3 {
                baseHeader.configure(title: "지금 인기 있어요")
            } else if indexPath.section == 4 {
                baseHeader.configure(title: "새로 나왔어요")
            }
            return baseHeader
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else { return }
        let centerPoint = CGPoint(x: collectionView.bounds.midX, y: collectionView.bounds.midY)
        if let centerIndexPath = collectionView.indexPathForItem(at: centerPoint) {
            collectionView.visibleCells.forEach { cell in
                if let indexPath = collectionView.indexPath(for: cell),
                   let recommendationCell = cell as? RecommendationCell {
                    let isCentered = indexPath == centerIndexPath
                    recommendationCell.configure(with: recommendedBooks[indexPath.row], isCentered: isCentered)
                }
            }
        }
    }
}
