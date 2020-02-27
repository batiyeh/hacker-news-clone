//
//  PostsService.swift
//  HackerNews
//
//  Created by Atiyeh, Brian (B.) on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation
import RxSwift

public protocol PostsServicable {
    func getPosts() -> Observable<PostList>
    func getPostDetails(id: Int) -> Observable<Post>
}

class PostsService: PostsServicable {
    private let networking: Networkable
    
    public init(networking: Networkable) {
        self.networking = networking
    }
    
    public convenience init() {
        self.init(networking: Networking())
    }
    
    public func getPosts() -> Observable<PostList> {
        return networking.request(request: HackerNewsEndpoint.topStories.buildUrlRequest())
    }
    
    public func getPostDetails(id: Int) -> Observable<Post> {
        return networking.request(request: HackerNewsEndpoint.story(id: id).buildUrlRequest())
    }
}
