import UIKit

class BookDetailViewController: UIViewController {
    private let bookDetailView = BookDetailView()
    private let data = BookDetailModel.dummy()
    private var reviewData = BookDetailPageReviewModel.dummy()
    private var visibleReviewCount = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bookDetailView
        
        bookDetailView.bookDetailCell.configure(with: data)
        
        bookDetailView.reviewTableView.dataSource = self
        bookDetailView.reviewTableView.delegate = self
        
        bookDetailView.showMoreButton.addTarget(self, action: #selector(loadMoreReviews), for: .touchUpInside)
        bookDetailView.filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func filterButtonTapped(_ sender: UIButton) {
        let option1 = UIAction(title: "별점 높은 순") { action in
            self.bookDetailView.filterButton.setTitle(action.title, for: .normal)
        }
        let option2 = UIAction(title: "최신순") { action in
            self.bookDetailView.filterButton.setTitle(action.title, for: .normal)
        }
        let option3 = UIAction(title: "공감 많은 순") { action in
            self.bookDetailView.filterButton.setTitle(action.title, for: .normal)
        }
        
        let menu = UIMenu(children: [option1, option2, option3])
        sender.menu = menu
        sender.showsMenuAsPrimaryAction = true
    }
    
    @objc private func loadMoreReviews() {
        visibleReviewCount += 7
        let newHeight = visibleReviewCount * 200
        bookDetailView.reviewTableView.snp.updateConstraints {
            $0.height.equalTo(newHeight)
        }
        bookDetailView.reviewTableView.reloadData()
    }
}

extension BookDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(visibleReviewCount, reviewData.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookDetailPageReviewViewCell.identifier, for: indexPath) as? BookDetailPageReviewViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: reviewData[indexPath.row])
        return cell
    }
}
