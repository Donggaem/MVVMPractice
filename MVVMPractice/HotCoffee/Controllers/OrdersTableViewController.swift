//
//  OrdersTableViewController.swift
//  MVVMPractice
//
//  Created by 김동겸 on 2023/05/22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeeOrdersURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL was incorrect")
            return
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        
        Webservice_Coffee().load(resource: resource) { result in
            
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
