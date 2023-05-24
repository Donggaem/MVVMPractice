//
//  Webservice.swift
//  MVVMPractice
//
//  Created by 김동겸 on 2023/05/24.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case DomainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class Webservice_Coffee {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.DomainError))
                return
            }
            
            //디코딩
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                //값이 UI로 전달되기 때문에 메인스레드에 전달
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
