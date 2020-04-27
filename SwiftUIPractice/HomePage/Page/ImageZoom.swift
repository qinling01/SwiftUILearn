//
//  ImageZoom.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/4/27.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct ImageZoom: View {
    @State private var scale: CGFloat = 1.0
    @State private var isDoubleClick = false
    @State private var iSZoom: Bool = false
    @State private var isAnmation: Bool = false
    
    @State private var dragGestureTranslation = CGPoint.zero
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
        Image("back1")
            //自适应大小
            .resizable()
            //保持原始比例
            .aspectRatio(contentMode: .fit)
            .offset(x: 0.0, y: 0.0)
//            .frame(width: 300, height: 200, alignment: .center)
            //缩放比例
            .scaleEffect(isDoubleClick ? 2.0 : 1.0)
            
            .scaleEffect(self.scale)
            
            .animation(Animation.easeIn(duration: 0.15))
            
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            
            .gesture(
                TapGesture(count: 2).onEnded({ (_) in
                    printL("..........")
                    self.isDoubleClick.toggle()
                    })
            )
            
            // 拖拽
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { (value, state, transaction) in
                        printL("+++++++++",value.location.x,value.location.y,value.translation)
                        state = value.translation

                        transaction.animation = Animation.easeIn(duration: 3.0)
                        transaction.isContinuous = true
                    })
                    
                    .onEnded({ (value) in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    })
            )
            
            // 缩放
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        self.scale = value.magnitude
                    }
            )
            
        .navigationBarTitle("ImageZoom")
    }
}

struct ImageZoom_Previews: PreviewProvider {
    static var previews: some View {
        ImageZoom()
    }
}
