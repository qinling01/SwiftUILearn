//
//  QLSearchBar.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/7.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct QLSearchBar: View {
    @Binding var text: String
    @State var isFirstResponder = false
    @State var showCancleButton = false
    
    var cancle: (() -> ())?
    var search: ((String) -> ())?
    
    var body: some View {
        HStack {
            QLSearchBarContanierView(text: $text, isFirstResponder: $isFirstResponder, showCancleButton: $showCancleButton) { (searText) in
                self.search?(searText)
            }
            
            Button("取消") {
                self.text = ""
                self.isFirstResponder = false
                self.showCancleButton = false

                self.cancle?()
            }
            .padding(.trailing, showCancleButton ? 10 : -60)
            .foregroundColor(.black)
        }
        .animation(.default)
    }
}
