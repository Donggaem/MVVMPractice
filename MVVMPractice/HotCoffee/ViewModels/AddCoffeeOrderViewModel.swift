//
//  AddCoffeeOrderViewModel.swift
//  MVVMPractice
//
//  Created by 김동겸 on 2023/07/22.
//

import Foundation

struct AddCoffeeOrderViewModel {
    
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeeType.allCases.map {$0.rawValue.capitalized}
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized}
    }
}
