//
//  Order.swift
//  MVVMPractice
//
//  Created by 김동겸 on 2023/05/25.
//

import Foundation

enum CoffeeType: String, Codable,CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
