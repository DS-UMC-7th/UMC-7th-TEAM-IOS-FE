//
//  HomeViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 11/30/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var recommendedBooks: [BookModel] = []
    private var popularBooks: [BookModel] = []
    private var latestBooks: [BookModel] = []
    
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
        
        group.enter()
        HomeService.shared.fetchBooks(sortedBy: "highest", page: 0, size: 3) { [weak self] result in
            defer { group.leave() }
            switch result {
            case .success(let books):
                print("추천 도서 연결 성공")
                self?.recommendedBooks = books
            case .failure(let error):
                print("Error fetching books: \(error.localizedDescription)")
            }
        }
        
        group.enter()
        HomeService.shared.fetchBooks(sortedBy: "popular", page: 0, size: 3) { [weak self] result in
            defer { group.leave() }
            switch result {
            case .success(let books):
                print("인기 도서 연결 성공")
                self?.popularBooks = books
            case .failure(let error):
                print("Error fetching books: \(error.localizedDescription)")
            }
        }
        
        group.enter()
        HomeService.shared.fetchBooks(sortedBy: "latest", page: 0, size: 3) { [weak self] result in
            defer { group.leave() }
            switch result {
            case .success(let books):
                print("최근 도서 연결 성공")
                self?.latestBooks = books
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
        case 4: return latestBooks.count
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
            cell.configure(with: recommendedBooks[indexPath.row])
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCell.identifier, for: indexPath) as! BestSellerCell
            cell.configure(with: popularBooks[indexPath.row], count: indexPath.row + 1)
            return cell
            //            }
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBookCell.identifier, for: indexPath) as! NewBookCell
            cell.configure(with: latestBooks[indexPath.row], count: indexPath.row + 1)
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    
    // 헤더 및 푸터 설정
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