//
//  PostUIView.swift
//  MoyaEx
//
//  Created by Endtry on 1/8/2562 BE.
//  Copyright © 2562 Endtry. All rights reserved.
//

import SwiftUI
import Moya

struct PostListView : View {
    
    @ObservedObject var viewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.posts, id: \.id) { (post: Post) in
                VStack(alignment: .leading) {
                    HStack {
                        Group {
                            Text("\(post.id)")
                        }
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color.secondary)
                    
                        Text(post.title).font(.headline)
                    }
                    Text(post.body).font(.subheadline)
                }
            }
            .onAppear(perform: self.viewModel.load)
            .navigationBarTitle(Text("All Posts"))
        }
    }
}

#if DEBUG
struct PostListView_Previews : PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
#endif
