//
//  Webservice.swift
//  MVVMPractice
//
//  Created by 김동겸 on 2023/05/16.
//

import Foundation

class Webservice {
     
    //기사 가져오기
    func getArticles(url: URL, completion: @escaping ([Any]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
           
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                print(data)
            }
        }.resume()
    }
}
