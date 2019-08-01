//
//  PostViewModel.swift
//  MoyaEx
//
//  Created by Endtry on 1/8/2562 BE.
//  Copyright © 2562 Endtry. All rights reserved.
//

import Moya
import SwiftUI
import Combine

class PostViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    @Published var isLoading = true
    
    func load() {
        self.isLoading = true
        let provider = MoyaProvider<PostService>()
        provider.request(.getPosts) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let posts = try filteredResponse.map([Post].self)
                    self.isLoading = false
                    self.posts = posts
                    self.objectWillChange.send()
                }
                catch let error {
                     print("Error: \(error)")
                }
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
}
