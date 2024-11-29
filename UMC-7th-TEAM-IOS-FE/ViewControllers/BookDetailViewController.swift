//
//  BookDetailViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 신연주 on 11/29/24.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    private let bookDetailView = BookDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = bookDetailView
    }
}
