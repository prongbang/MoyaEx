//
//  Post.swift
//  MoyaEx
//
//  Created by Endtry on 1/8/2562 BE.
//  Copyright © 2562 Endtry. All rights reserved.
//

import Foundation

// MARK: - Post
struct Post: Decodable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
