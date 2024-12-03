//
//  HomeCollectionLayout.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import UIKit

class HomeCollectionLayout {

    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in
            switch section {
            case 0: // 검색 섹션
                return createSearchBarSection()
            case 1: // 배너 섹션
                return createBannerSection()
            case 2: // 추천 도서 섹션
                return createRecommendationSection()
            case 3: // 인기 도서 섹션
                return createBestSellerSection()
            case 4: // 신간 도서 섹션
                return createNewBookSection()
            default:
                return nil
            }
        }
    }
    
    // 검색 섹션
    private static func createSearchBarSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(36))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(36))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        return section
    }
    
    
    // 배너 섹션 생성
    private static func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    private static func createRecommendationSection() -> NSCollectionLayoutSection {
        // 아이템 크기 설정
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(260)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(260)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        // 섹션 설정
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 20, bottom: 0, trailing: 20)

        section.boundarySupplementaryItems = [createHeaderItem()]
        
        return section
    }
    
    // 인기 섹션 생성
    private static func createBestSellerSection() -> NSCollectionLayoutSection {
        // 필터 아이템
//        let filterItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
//        let filterItem = NSCollectionLayoutItem(layoutSize: filterItemSize)
//        
//        let filterGroupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(40)
//        )
//        let filterGroup = NSCollectionLayoutGroup.vertical(layoutSize: filterGroupSize, subitems: [filterItem])
        
        // 도서 아이템
        let bookItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(130))
        let bookItem = NSCollectionLayoutItem(layoutSize: bookItemSize)

        let bookGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(160)
        )
        let bookGroup = NSCollectionLayoutGroup.vertical(layoutSize: bookGroupSize, subitems: [bookItem])

        // 전체 그룹 (필터 + 도서 그룹)
//        let overallGroupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .estimated(300) // 필터 높이 + 예상 도서 그룹 높이
//        )
//        let overallGroup = NSCollectionLayoutGroup.vertical(layoutSize: overallGroupSize, subitems: [filterGroup, bookGroup])

        // 섹션 설정
        let section = NSCollectionLayoutSection(group: bookGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 26

        // 헤더와 푸터 추가
        section.boundarySupplementaryItems = [createHeaderItem(), createFooterItem()]
        
        return section
    }
    
    // 신간 섹션 생성
    private static func createNewBookSection() -> NSCollectionLayoutSection {
        
        // 도서 아이템
        let bookItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(130))
        let bookItem = NSCollectionLayoutItem(layoutSize: bookItemSize)

        let bookGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(160)
        )
        let bookGroup = NSCollectionLayoutGroup.vertical(layoutSize: bookGroupSize, subitems: [bookItem])

        // 섹션 설정
        let section = NSCollectionLayoutSection(group: bookGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 26

        // 헤더와 푸터 추가
        section.boundarySupplementaryItems = [createHeaderItem(), createFooterItem()]
        
        return section
    }

    // 헤더 생성
    private static func createHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(35))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.pinToVisibleBounds = false
        
        return header
    }
    
    // 푸터 생성
    private static func createFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return footer
    }

}
