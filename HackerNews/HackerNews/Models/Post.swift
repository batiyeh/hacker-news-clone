//
//  Post.swift
//  HackerNews
//
//  Created by Brian Atiyeh on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation

public struct Post: Decodable {
    let by: String
    let id: Int
    let score: Int
    let title: String
    let url: String?
    
    public init(by: String,
                id: Int,
                score: Int,
                title: String,
                url: String?) {
        self.by = by
        self.id = id
        self.score = score
        self.title = title
        self.url = url
    }
}
