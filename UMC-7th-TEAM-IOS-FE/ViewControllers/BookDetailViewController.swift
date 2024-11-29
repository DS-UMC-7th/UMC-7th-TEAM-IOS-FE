//
//  BookDetailViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 11/29/24.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    private let bookDetailView = BookDetailView()
    
    private var isSortMenuVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = bookDetailView
        setupActions()
    }
    private func setupActions() {
        bookDetailView.sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
    }
    @objc private func sortButtonTapped() {
        isSortMenuVisible.toggle()
        bookDetailView.toggleSortMenu(isVisible: isSortMenuVisible)
    }
}
