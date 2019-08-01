//
//  PostService.swift
//  MoyaEx
//
//  Created by Endtry on 1/8/2562 BE.
//  Copyright © 2562 Endtry. All rights reserved.
//

import Foundation
import Moya

enum PostService {
    case getPosts
    case createPost
}

extension PostService : TargetType {
    var baseURL: URL { return URL(string: "https://jsonplaceholder.typicode.com")! }
    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case .createPost:
            return "/posts"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getPosts:
            return .get
        case .createPost:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .getPosts:
            return .requestPlain
        case .createPost:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
}
