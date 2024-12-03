//
//  HomeCollectionLayout.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 12/2/24.
//

import UIKit

class HomeCollectionLayout {

    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in
            switch section {
            case 0: // 검색 섹션
                return createSearchBarSection()
            case 1: // 배너 섹션
                return createBannerSection()
            case 2: // 추천 도서 섹션
                return createRecommendationSection()
            case 3:
                return createFilterSection()
            case 4: // 인기 도서 섹션
                return createBestSellerSection()
            case 5:
                return createFilterSection()
            case 6: // 신간 도서 섹션
                return createNewBookSection()
            default:
                return nil
            }
        }

        return layout

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
    
    // 추천 섹션
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
    
    private static func createFilterSection() -> NSCollectionLayoutSection {
        let filterItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(32)
        )
        let filterItem = NSCollectionLayoutItem(layoutSize: filterItemSize)

        // Filter 그룹
        let filterGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(32)
        )
        let filterGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: filterGroupSize,
            subitems: [filterItem]
        )

        let section = NSCollectionLayoutSection(group: filterGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 20, bottom: 0, trailing: 20)
        
        section.boundarySupplementaryItems = [createHeaderItem()]
        
        return section
    }
    
    // 인기 섹션 생성
    private static func createBestSellerSection() -> NSCollectionLayoutSection {
        // 도서 아이템
        let bookItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(130)
        )
        let bookItem = NSCollectionLayoutItem(layoutSize: bookItemSize)

        let bookGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(130)
        )
        let bookGroup = NSCollectionLayoutGroup.vertical(layoutSize: bookGroupSize, subitems: [bookItem])

        // 섹션 설정
        let section = NSCollectionLayoutSection(group: bookGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 26, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 26
        
        section.boundarySupplementaryItems = [createFooterItem()]
        
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
        section.contentInsets = NSDirectionalEdgeInsets(top: 26, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 26

        section.boundarySupplementaryItems = [createFooterItem()]
        
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
