//
//  Article.swift
//  MVVMPractice
//
//  Created by 김동겸 on 2023/05/16.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
