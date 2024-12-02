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
//            case 1: // 추천 도서 섹션
//                return createRecommendationSection()
//            case 2: // 인기 도서 섹션
//                return createBestSellerSection()
//            case 3: // 신간 도서 섹션
//                return createNewBookSection()
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
    
    // 추천 섹션 생성
//    private static func createRecommendationSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(312))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
//
//        return section
//    }
    
    // 인기 섹션 생성
//    private static func createBestSellerSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(0.9), heightDimension: .absolute(120))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        section.interGroupSpacing = 12
//        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
//        section.boundarySupplementaryItems = [createHeaderItem()]
//        return section
//    }
    
//    /// 유저 스토리 섹션 생성
//    private static func createUserStorySection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(124), heightDimension: .absolute(165))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(134), heightDimension: .absolute(165))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        group.interItemSpacing = .fixed(8)
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 30, trailing: 10)
//        section.boundarySupplementaryItems = [createHeaderItem(), createFooterItem()]
//        
//        return section
//    }
    
//    /// 푸터 생성(구분선)
//    /// - Returns: 구분선을 가로(동적 사이즈), 세로(고정 사이즈)로 조정하여 각 섹션마다 생성할 수 있도록 푸터 반환
//    private static func createFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
//        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(1))
//        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
//        return footer
//    }
    
    /// 헤더 생성(특정 섹션에 대해 타이틀 헤더)
    /// - Returns: 고정된 헤더 반환
    private static func createHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.pinToVisibleBounds = true
        
        return header
    }
}
