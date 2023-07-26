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

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

extension Resource {
    init(url: URL) {
        self.url = url
    }
}

class Webservice_Coffee {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
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
