//
//  MyPageView.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 30/11/2024.
//

import UIKit
import SnapKit
import Then

class MyPageView: UIView {
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        makeStackView()
        setView()
        setScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - layout
    // MARK: - 사용자 정보
    // 배경
    private let infoBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 249/255, blue: 255/255, alpha: 1)
    }
    
    // 상단 바
    private let logoImage = UIImageView().then {
        $0.image = UIImage.logo
    }
    
    private let logoTitle = UIImageView().then {
        $0.image = UIImage.logoText
    }
    
    private let logoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
    }
    
    private let alertButton = UIButton().then {
        $0.setImage(UIImage.iconAlert, for: .normal)
    }
    
    private let menuButton = UIButton().then {
        $0.setImage(UIImage.iconMenu, for: .normal)
    }
    
    private let menuStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.alignment = .center
    }
    
    // 프로필
    private let profileImage = UIImageView().then {
        $0.image = UIImage.imageProfile
    }
    
    private let nameBackground = UIView().then {
        $0.backgroundColor = UIColor(red: 33/255, green: 56/255, blue: 86/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    private let nameLabel = UILabel().then {
        let partLabel = UILabel()
        partLabel.text = "책책책참새 님"
        
        let attributedString = NSMutableAttributedString(string: partLabel.text ?? "")
        attributedString.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 17) ?? .systemFont(ofSize: 17), range: (partLabel.text! as NSString).range(of: "책책책참새"))
        attributedString.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 15) ?? .systemFont(ofSize: 15), range: (partLabel.text! as NSString).range(of: " 님"))
        
        $0.attributedText = attributedString
        $0.textColor = .white
    }
    
    
    private let emailLabel = UILabel().then {
        $0.text = "ks18mskd9@naver.com"
        $0.font = UIFont(name: "Pretendard-Medium", size: 15)
        $0.textColor = .black
    }
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
    }
    
    // 메뉴
    private let menuBackground = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
    }
    
    public let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.estimatedItemSize = .init(width: 115, height: 40)
        $0.minimumLineSpacing = 2
    }).then {
        $0.backgroundColor = UIColor(red: 227/255, green: 241/255, blue: 255/255, alpha: 1)
        $0.isScrollEnabled = false
        $0.register(MyPageMenuCollectionViewCell.self, forCellWithReuseIdentifier: MyPageMenuCollectionViewCell.identifier)
    }
    
    // 스크롤뷰
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = true
    }
    
    
    // MARK: - 내가 쓴 리뷰
    // 타이틀
    private let reviewLabelBackground = UIView().then {
        $0.backgroundColor = UIColor(red: 194/255, green: 221/255, blue: 248/255, alpha: 1)
    }
    
    private let reviewLabel = UILabel().then {
        $0.text = "내가 쓴 리뷰"
        $0.font = UIFont(name: "MaruBuri-Bold", size: 20)
        $0.textColor = .black
    }
    
    // 필터링
    public let filterButton = UIButton().then {
        $0.setTitle("별점 높은 순", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 15)
        $0.setImage(UIImage.iconDrop, for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
    }
    
    // 테이블뷰
    public let reviewTableView = UITableView().then {
        $0.register(MyPageReviewTableViewCell.self, forCellReuseIdentifier: MyPageReviewTableViewCell.identifier)
        $0.separatorStyle = .singleLine
        $0.separatorColor = UIColor(red: 227/255, green: 241/255, blue: 255/255, alpha: 1)
        $0.separatorInset.left = 0
        $0.showsVerticalScrollIndicator = false
    }
    
    // 더보기
    public let moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        $0.titleLabel?.textColor = .white
        
        $0.backgroundColor = UIColor(red: 33/255, green: 55/255, blue: 86/255, alpha: 1)
        $0.layer.cornerRadius = 24
    }
    
    
    // MARK: - 이 책은 어땠나요?
    // 타이틀
    
    // 슬라이드
    
    // 리뷰 작성
    
    
    // MARK: - function
    private func makeStackView() {
        [logoImage, logoTitle].forEach { logoStackView.addArrangedSubview($0) }
        [alertButton, menuButton].forEach { menuStackView.addArrangedSubview($0) }
        [nameBackground, emailLabel].forEach { infoStackView.addArrangedSubview($0) }
    }
    
    private func setView() {
        [
            infoBackgroundView,
            logoStackView,
            menuStackView,
            profileImage,
            infoStackView,
            nameLabel,
            menuBackground,
            menuCollectionView,
            scrollView
        ].forEach {
            addSubview($0)
        }
        
        infoBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(menuBackground.snp.bottom).offset(20)
        }
        
        logoStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(9)
            $0.left.equalToSuperview().offset(16)
        }
        
        menuStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(13)
            $0.right.equalToSuperview().offset(-16)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(logoStackView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(16)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.top)
            $0.left.equalTo(profileImage.snp.right).offset(12)
        }
        
        nameBackground.snp.makeConstraints {
            $0.width.equalTo(108)
            $0.height.equalTo(32)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.top).offset(5)
            $0.left.equalTo(infoStackView.snp.left).offset(9)
        }
        
        emailLabel.snp.makeConstraints {
            $0.height.equalTo(24)
        }
        
        menuBackground.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(68)
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(menuBackground.snp.top).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(349)
            $0.height.equalTo(40)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(infoBackgroundView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    private func setScrollView() {
        let contentView = UIView()
        scrollView.addSubview(contentView)

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        [
            reviewLabelBackground, reviewLabel,
            filterButton,
            reviewTableView,
            moreButton
        ].forEach {
            contentView.addSubview($0)
        }

        reviewLabelBackground.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.bottom.equalTo(reviewLabel.snp.bottom).offset(1)
            $0.width.equalTo(121)
            $0.height.equalTo(18)
        }

        reviewLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.left.equalToSuperview().offset(21)
            $0.height.equalTo(27)
        }

        filterButton.snp.makeConstraints {
            $0.top.equalTo(reviewLabelBackground.snp.bottom).offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(20)
        }

        reviewTableView.snp.makeConstraints {
            $0.top.equalTo(filterButton.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(444)
        }

        moreButton.snp.makeConstraints {
            $0.top.equalTo(reviewTableView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(scrollView.snp.bottom).offset(-16)
            $0.height.equalTo(44)
        }
    }

    
    
}