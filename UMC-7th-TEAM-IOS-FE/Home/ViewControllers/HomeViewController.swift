//
//  HomeViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 11/30/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var recommendedBooks: [BookModel] = []
    
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
        HomeService.shared.fetchRecommendedBooks(sortedBy: "highest", page: 0, size: 3) { [weak self] result in
            switch result {
            case .success(let books):
                print("Books fetched: \(books)")
                self?.recommendedBooks = books
                DispatchQueue.main.async {
                    self?.homeView.homeCollectionView.reloadData() // 데이터 가져온 후 UI 갱신
                }
            case .failure(let error):
                print("Error fetching books: \(error.localizedDescription)")
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
        print("HomeView set as main view")
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("Item at index \(indexPath.row) frame: \(cell.frame)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: // 검색 섹션
            return 1
        case 1: // 배너 섹션
            return HomeCellModel.bannerData.count
        case 2: // 추천 섹션
            print("Recommended books count: \(recommendedBooks.count)")
            return recommendedBooks.count
        case 3:
            return HomeCellModel.bestSellerData.count
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCell.identifier, for: indexPath) as! BestSellerCell
            let data = HomeCellModel.bestSellerData[indexPath.row]
            cell.configure(model: data, count: indexPath.row + 1)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    // 헤더 설정
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BaseCellHeader.identifier, for: indexPath) as! BaseCellHeader
            
            if indexPath.section == 2 {
                header.configure(title: "오늘의 추천 도서")
            } else if indexPath.section == 3 {
                header.configure(title: "지금 인기 있어요")
            }
            
            return header
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
