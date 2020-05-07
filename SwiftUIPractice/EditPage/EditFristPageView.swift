//
//  EditFristPageView.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/10.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct EditFristPageView: View {
    
    @State private var showingSeachBar = false
    
    @State private var inputText = ""
    
    var body: some View {
        VStack {
            QLSearchBar(text: $inputText, cancle: {
                
            }) { (searText) in
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 0)
        }
    }
}

struct EditFristPageView_Previews: PreviewProvider {
    static var previews: some View {
        EditFristPageView()
    }
}
