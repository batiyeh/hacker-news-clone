//
//  HackerNewsEndpoint.swift
//  HackerNews
//
//  Created by Brian Atiyeh on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation

enum HackerNewsEndpoint: Endpoint {
    case topStories
    case story(id: Int)
    
    var baseUrl: String {
        return "https://hacker-news.firebaseio.com/v0/"
    }
    
    var method: HttpMethod {
        switch self {
        case .topStories:
            return .GET
        case .story:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .topStories:
            return "topstories.json"
        case .story(let id):
            return "item/" + String(id) + ".json"
        }
    }
}
