//
//  HomePageView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
//        NavigationView {
//            NavigationLink.init("Home", destination: HomePageView())
//                .navigationBarTitle("master")
//        }
        
        List {
            ForEach(0 ..< 12) { index in
                Text("Home")
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
