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

// 네트워킹에 사용될 정적 함수
extension Order {
    
    static var all: Resource<[Order]> = {
        
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL was incorrect")
        }
        
        return Resource<[Order]>(url: url)
        
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(vm)
        
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL was incorrect")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}

//주문 뷰모델을 모델로
extension Order {
    
    init?(_ vm: AddCoffeeOrderViewModel) {
        
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            
            return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
