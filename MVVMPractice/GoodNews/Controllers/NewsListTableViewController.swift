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
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=5023951c0ed24022966c6b974fe92a7b")!
        
        Webservice().getArticles(url: url) { _ in
            
        }
    }
}
