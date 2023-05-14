//
//  NewsListTableViewController.swift
//  MVVMPractice
//
//  Created by 김동겸 on 2023/05/12.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}
