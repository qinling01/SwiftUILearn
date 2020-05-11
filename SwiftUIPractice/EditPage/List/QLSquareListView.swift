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
    
    var onDelete: ((Int) -> ())?
    
    var body: some View {
        List {
            ForEach(articles) { article in
                QLSquareListCell(article: article)
            }.onDelete {
                guard let index = Array($0).first else { return }
                self.onDelete?(index)
            }
        }
    }
}

struct QLSquareListView_Previews: PreviewProvider {
    static var previews: some View {
        QLSquareListView(articles: .constant([]))
    }
}
