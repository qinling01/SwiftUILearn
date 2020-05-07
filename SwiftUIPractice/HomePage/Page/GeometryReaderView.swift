//
//  GeometryReaderView.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/7.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct Thumbnail : View {
    var body : some View {
        VStack {
            HStack(spacing: 50) {
                ForEach(1..<8) { item in
                    GeometryReader { geometry in
                        Image("back0")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 10) / 20), axis: (x: 10, y: 10, z: 10))
                    }
                    .frame(width: 370, height: 400)
                    .padding(20)
                }
            }
        }
    }
}

struct GeometryReaderView: View {
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Circle()
                    .fill(Color.blue)
                    .overlay(Circle().strokeBorder(Color.white).padding(3))
                    .overlay(Text("Start").foregroundColor(.white))
                    .frame(width:75,height:75)

                Divider()
                
                Text("我爱北京")
                    .foregroundColor(.white)
                .padding(10)
                .background(
                    GeometryReader { proxy in
                        Circle()
                            .fill(Color.blue)
                            .frame(width:proxy.size.width,height:proxy.size.width)
                    }
                
                )
            }
            Spacer()
            VStack{
                Text("SwiftUI2020教程")
                    .font(.largeTitle)
                    .padding()
                        
                Text("教程包括实时资讯和基础技能两部分")
                    .font(.system(size: 22))
            }
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    Thumbnail()
                }
            }
            Spacer()
        }.background(
            Image("back1")
                .resizable()
//                .scaledToFit()
        )
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
