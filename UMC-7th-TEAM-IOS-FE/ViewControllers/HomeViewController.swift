//
//  HomeViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 선가연 on 11/30/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
    }


}
