//
//  MyPageViewController.swift
//  UMC-7th-TEAM-IOS-FE
//
//  Created by 김미주 on 30/11/2024.
//

import UIKit

class MyPageViewController: UIViewController {
    private let myPageView = MyPageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPageView

        // Do any additional setup after loading the view.
    }

}
