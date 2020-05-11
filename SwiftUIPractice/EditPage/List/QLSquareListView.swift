//
//  QLSquareListView.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct QLSquareListView: View {
    @Binding var articles: [Article]
    
    var body: some View {
        List {
            ForEach(articles) { article in
                QLSquareListCell(article: article)
            }
        }
    }
}

struct QLSquareListView_Previews: PreviewProvider {
    static var previews: some View {
        QLSquareListView(articles: .constant([]))
    }
}
