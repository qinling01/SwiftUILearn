//
//  QLSquareListCell.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct QLSquareListCell: View {
    var article: Article
    
    var body: some View {
        Text(article.content)
    }
}

struct QLSquareListCell_Previews: PreviewProvider {
    static var previews: some View {
        QLSquareListCell(article: Article())
    }
}
