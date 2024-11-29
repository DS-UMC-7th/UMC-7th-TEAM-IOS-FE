//
//  BookDetailView.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 11/29/24.
//

import UIKit
import SnapKit
import Then

class BookDetailView: UIView {
    var onSortOptionSelected: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupSubviews()
        setupGraphUI()
        setupSortButton()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 컴포넌트 추가
    private func setupSubviews() {
        self.addSubview(blueBackgroundView)
        blueBackgroundView.addSubview(profileImageView)
        blueBackgroundView.addSubview(lightBlueBackgroundView)
        blueBackgroundView.addSubview(bookTitleLabel)
        blueBackgroundView.addSubview(bookDescriptionLabel)
        
        self.addSubview(bookInfoBackgroundView)
        bookInfoBackgroundView.addSubview(bookInfoTitleLabel)
        bookInfoBackgroundView.addSubview(bookInfoContentLabel)
        
        self.addSubview(ratingContainerView)
        ratingContainerView.addSubview(averageRatingLabel)
        ratingContainerView.addSubview(totalReviewsLabel)
        ratingContainerView.addSubview(ratingGraphStackView)
        
        self.addSubview(sortButton)
        self.addSubview(sortMenuView)
    }
    
    // 남색 배경 영역
    private let blueBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 33/255, green: 56/255, blue: 86/255, alpha: 1)
    }
    
    //책 표지 이미지
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "book_image.png")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = CGSize(width: 3, height: 4)
        $0.layer.shadowRadius = 4
    }
    
    //책 제목 레이블
    private let bookTitleLabel = UILabel().then {
        $0.text = "작별하지 않는다"
        $0.font = UIFont(name: "MaruBuriOTF-Bold", size: 17) ?? UIFont.systemFont(ofSize: 17)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //소라색 배경 뷰(책 제목 아래)
    private let lightBlueBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
    }
    
    //책 소개 레이블
    private let bookDescriptionLabel = UILabel().then {
        $0.text = " 학살 이후 실종된 가족을 찾기 위한 생존자의 길고 고요한 투쟁의 서사가 있다. 공간적으로는 제주에서 경산에 이르고, 시간적으로는 반세기를 넘긴다. 폭력에 훼손되고 공포에 짓눌려도 인간은 포기하지 않는다. 작별할 수 없다는 것이다."
        $0.font = UIFont(name: "Pretendard", size: 15) ?? UIFont.systemFont(ofSize: 15)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
        
    }
    
    // 책 정보 배경 뷰
    private let bookInfoBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 249/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 12
    }
    
    // 책 정보 타이틀 레이블
    private let bookInfoTitleLabel = UILabel().then {
        $0.text = "작가\n출판사\n발행 일자\n쪽수"
        $0.font = UIFont(name: "Pretendard", size: 15) ?? UIFont.systemFont(ofSize: 15)
        $0.textColor = UIColor(red: 117/255, green: 148/255, blue: 193/255, alpha: 1)
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    // 책 정보 내용 레이블
    private let bookInfoContentLabel = UILabel().then {
        $0.text = "한강\n문학동네\n2021년 09월 09일\n332쪽"
        $0.font = UIFont(name: "Pretendard", size: 15) ?? UIFont.systemFont(ofSize: 15)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.lineBreakMode = .byCharWrapping
        $0.numberOfLines = 0
    }
    
    
    //별점 및 리뷰 수 그래프 컴포넌트
    // 별점 및 리뷰 UI를 포함하는 큰 컨테이너
    private let ratingContainerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    // 별점 레이블
    private let averageRatingLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 40)
        $0.textColor = .black
        $0.text = "0.0"
    }
    
    // 리뷰 수 레이블
    private let totalReviewsLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .gray
        $0.text = "0개의 리뷰"
    }
    
    // 별점 그래프를 담을 스택뷰
    private lazy var ratingGraphStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    // 별점 그래프 UI 구성
    private func setupGraphUI() {
        for i in (1...5).reversed() {
            let barContainer = UIView()
            
            // 별점 (5, 4, 3, ...)을 표시하는 레이블
            let starLabel = UILabel().then {
                $0.text = "\(i)"
                $0.font = UIFont.systemFont(ofSize: 14)
                $0.textColor = .black
            }
            
            // 막대 바 그래프 뷰
            let bar = UIView().then {
                $0.backgroundColor = UIColor.systemBlue
                $0.layer.cornerRadius = 4
            }
            
            // 각 별점 비율을 텍스트로 표시하는 레이블
            let percentageLabel = UILabel().then {
                $0.text = "0%"
                $0.font = UIFont.systemFont(ofSize: 12)
                $0.textColor = .gray // 텍스트 색상: 회색
            }
            // 서브뷰 추가
            barContainer.addSubview(starLabel)
            barContainer.addSubview(bar)
            barContainer.addSubview(percentageLabel)
            
            // 레이아웃
            starLabel.snp.makeConstraints {
                $0.leading.centerY.equalToSuperview()
                $0.width.equalTo(30)
            }
            bar.snp.makeConstraints {
                $0.height.equalTo(8)
                $0.centerY.equalToSuperview()
                $0.leading.equalTo(starLabel.snp.trailing).offset(8)
                $0.width.equalTo(0) // 초기 너비는 0
            }
            percentageLabel.snp.makeConstraints {
                $0.leading.equalTo(bar.snp.trailing).offset(8)
                $0.trailing.centerY.equalToSuperview()
                $0.width.equalTo(30)
            }
        
            ratingGraphStackView.addArrangedSubview(barContainer)
        }
    }
    
    
    // 정렬 버튼 뷰
    let sortButton = UIButton().then {
        $0.setTitle("별점 높은 순", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.contentHorizontalAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 4
        $0.backgroundColor = .white
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    // 정렬 메뉴 컨테이너
    private let sortMenuView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 4
        $0.isHidden = true
    }
    
    // 정렬 메뉴 항목
    private let sortOptions = ["별점 높은 순", "최신 순", "공감 많은 순"]
    private var sortOptionButtons: [UIButton] = []
    
    //정렬 버튼 UI
    private func setupSortButton() {
            // 정렬 버튼 추가
            self.addSubview(sortButton)
            
            // 정렬 메뉴 옵션 추가
            self.addSubview(sortMenuView)
            sortOptions.forEach { option in
                let button = UIButton().then {
                    $0.setTitle(option, for: .normal)
                    $0.setTitleColor(.black, for: .normal)
                    $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                    $0.contentHorizontalAlignment = .left
                    $0.backgroundColor = .white
                }
                sortMenuView.addSubview(button)
                sortOptionButtons.append(button)
            }
        }
    
    // 정렬 메뉴 버튼이 눌렸을 때 호출
    @objc private func sortOptionTapped(_ sender: UIButton) {
        guard let option = sender.title(for: .normal) else { return }
        onSortOptionSelected?(option)
        toggleSortMenu(isVisible: false)
    }
    
    // 정렬 메뉴 보이기/숨기기
    func toggleSortMenu(isVisible: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.sortMenuView.isHidden = !isVisible
            self.sortMenuView.alpha = isVisible ? 1.0 : 0.0
        }
    }
    
    
    //레이아웃 설정
    private func setupConstraints() {
        //프로필 이미지 UI 구성
        blueBackgroundView.snp.makeConstraints {
            $0.width.equalTo(360)
            $0.height.equalTo(380)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(49)
        }
        
        profileImageView.snp.makeConstraints {
            $0.width.equalTo(84)
            $0.height.equalTo(124)
            $0.top.equalTo(blueBackgroundView).offset(75)
            $0.left.equalTo(blueBackgroundView).offset(138)
        }
        
        bookTitleLabel.snp.makeConstraints {
            $0.width.equalTo(121)
            $0.height.equalTo(24)
            $0.top.equalTo(profileImageView.snp.bottom).offset(16)
            $0.left.equalTo(blueBackgroundView).offset(120)
            $0.centerX.equalTo(lightBlueBackgroundView)
        }
        
        lightBlueBackgroundView.snp.makeConstraints {
            $0.width.equalTo(132)
            $0.height.equalTo(14.61)
            $0.top.equalTo(bookTitleLabel.snp.bottom).offset(-13)
            $0.centerX.equalTo(blueBackgroundView)
        }
        
        bookDescriptionLabel.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(90)
            $0.top.equalTo(bookTitleLabel.snp.bottom).offset(19)
            $0.left.equalTo(blueBackgroundView).offset(20)
            $0.centerX.equalTo(blueBackgroundView)
        }
        
        //책 정보 레이아웃 구성
        bookInfoBackgroundView.snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(112)
            $0.top.equalToSuperview().offset(396)
            $0.left.equalToSuperview().offset(20)
            $0.centerX.equalTo(blueBackgroundView)
        }
        
        bookInfoTitleLabel.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.height.equalTo(88)
            $0.top.equalTo(bookInfoBackgroundView).offset(12)
            $0.left.equalTo(bookInfoBackgroundView).offset(12)
        }
        
        bookInfoContentLabel.snp.makeConstraints {
            $0.width.equalTo(130)
            $0.height.equalTo(88)
            $0.top.equalTo(bookInfoBackgroundView).offset(12)
            $0.left.equalTo(bookInfoTitleLabel.snp.right).offset(20)
        }
        
        ratingContainerView.snp.makeConstraints {
            $0.top.equalTo(bookInfoBackgroundView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        
        averageRatingLabel.snp.makeConstraints {
            $0.top.equalTo(ratingContainerView.snp.top).offset(16)
            $0.left.equalTo(ratingContainerView).offset(16)
        }
        
        totalReviewsLabel.snp.makeConstraints {
            $0.top.equalTo(averageRatingLabel.snp.bottom).offset(8)
            $0.left.equalTo(averageRatingLabel)
        }
        
        ratingGraphStackView.snp.makeConstraints {
            $0.top.equalTo(totalReviewsLabel.snp.bottom).offset(16)
            $0.left.right.equalTo(ratingContainerView).inset(16)
        }
        
        // 정렬 버튼 레이아웃
        sortButton.snp.makeConstraints {
            $0.width.equalTo(96)
            $0.height.equalTo(20)
            $0.top.equalTo(ratingContainerView.snp.bottom).offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        
        // 정렬 메뉴 옵션 레이아웃
        for (index, button) in sortOptionButtons.enumerated() {
            button.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(8)
                $0.height.equalTo(20)
                $0.top.equalToSuperview().offset(index * 25)
            }
        }
        
        // 정렬 메뉴 컨테이너 레이아웃
        sortMenuView.snp.makeConstraints {
            $0.width.equalTo(sortButton)
            $0.top.equalTo(sortButton.snp.bottom).offset(8)
            $0.right.equalTo(sortButton)
            $0.height.equalTo(sortOptions.count * 25)
        }
    }
}
