//
//  CircularActivityIndicatory.swift
//  MoyaEx
//
//  Created by Endtry on 1/8/2562 BE.
//  Copyright © 2562 Endtry. All rights reserved.
//

import SwiftUI

struct CircularActivityIndicatory<Content>:View where Content: View {
    
    @State var spinCircle = false
    var content: () -> Content
       
    var body: some View {
        Group {
            if spinCircle {
                ZStack {
                    Circle()
                        .trim(from: 0.5, to: 1)
                        .stroke(Color.blue, lineWidth:4)
                        .frame(width:100)
                        .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                }
                .onAppear {
                    self.spinCircle = true
                }
            } else {
                self.content()
            }
        }
   }
}

#if DEBUG
struct CircularActivityIndicatory_Previews: PreviewProvider {
    static var previews: some View {
        CircularActivityIndicatory(spinCircle: true) {
            NavigationView {
                Text("Hello World")
                    .navigationBarTitle(Text("List"), displayMode: .large)
            }
        }
    }
}
#endif
