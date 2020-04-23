//
//  CardAnimationView.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/4/23.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct CardAnimationView: View {
    @State var isBlur: Bool = false
    @State var isRotation: Bool = false
    @State var dragGestureTranslation  = CGSize.zero
    var body: some View {
        ZStack {
            CarPageView(imgaeName: "back0")
            //设置偏移量
            .offset(x: 0, y: -30)
            //设置旋转角度
//            .rotationEffect(Angle.init(degrees: 20))
            //设置旋转角度与旋转中心
                .rotationEffect(Angle.init(degrees: isRotation ? 60 : 0), anchor: .topTrailing)
            //缩放
            .scaleEffect(0.85)
            //动画时长
            .animation(Animation.easeInOut(duration: 0.75))
            .offset(self.dragGestureTranslation)
            
            CarPageView(imgaeName: "back1")
                .offset(x: 0, y: -15)
//                .rotationEffect(Angle.init(degrees: 10))
                .rotationEffect(Angle.init(degrees: isRotation ? 30 : 0), anchor: .topTrailing)
                .scaleEffect(0.85)
                .animation(Animation.easeInOut(duration: 0.5))
                .offset(self.dragGestureTranslation)
            
            CarPageView(imgaeName: "back2")
                .offset(x: 0, y: 0)
                .scaleEffect(0.85)
//                .animation(Animation.easeIn(duration: 0.5))
                .animation(Animation.easeInOut(duration: 0.25))
                .offset(self.dragGestureTranslation)
                .onTapGesture {
                    self.isRotation = !self.isRotation
            }
            .gesture(DragGesture().onChanged({ (value) in
                if !self.isRotation {
                    self.dragGestureTranslation = value.translation
                }
            }).onEnded({ (value) in
                if !self.isRotation {
                    self.dragGestureTranslation = CGSize.zero
                }
            }))
        }.padding(.bottom, 100)
    }
}

struct CarPageView: View {
    @State var imgaeName: String
    var body: some View {
        ZStack (alignment: .topLeading) {
            Image(imgaeName)
                .resizable()
            
            HStack {
                Text("Car")
                    .foregroundColor(.red)
                    .padding(.all, 8)
                    .background(Color.orange)
                    .padding(.leading, 30)
            }
        }
        .frame(width: 300, height: 200)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 10, x: 5, y: 5)
    }
}

struct CardAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CardAnimationView()
    }
}
