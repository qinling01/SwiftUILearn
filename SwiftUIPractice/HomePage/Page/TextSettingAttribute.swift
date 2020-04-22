//
//  TextSettingAttribute.swift
//  SwiftUIPractice
//
//  Created by 灵 Q on 2020/4/13.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct TextSettingAttribute: View {
    var body: some View {
        VStack {
            //设置字体之间的间隙
            Text("Hello, World!,哈哈哈，")
                .tracking(10.0)
            
            Text("Hello, World!,哈哈哈，")
                .kerning(10.0)
            
            //设置字体模糊效果 radius模糊半径
            Text("Hello, World!,哈哈哈哈哈哈哈哈哈")
                .blur(radius: 1.0)
            
            //设置字体间距与行间距，并不限制行数
        Text("这是设置字体的h行间距，这是设置字体的h行间距，这是设置字体的h行间距,这是设置字体的h行间距,这是设置字体的h行间距，这是设置字体的h行间距,这是设置字体的h行间距")
            .tracking(5.0)
            .lineSpacing(10.0)
            .lineLimit(nil)
            
            //设置字体偏移量
            Text("Hello, World!")
                .offset(x: 40, y: 0.0)
                .background(Color.red)
            Divider()
            Text("Hello, World!")
                //横线
                .strikethrough(true, color: Color.blue)
                //下划线
                .underline(true, color: Color.black)
                //斜体
                .italic()
                //字体大小
                .font(.system(size: 25))
                //设置粗体样式
                .fontWeight(.bold)
                //字体颜色
                .foregroundColor(.yellow)
                //圆角
                .cornerRadius(30)
                .background(Color.red)
                // 如果要设置文字的背景阴影, 一般还是要包裹起来
                .shadow(color: Color.green, radius: 10)
                //添加单击手势
                .onTapGesture {
                    print("...点击了....")
            }
                //添加长按手势
            .onLongPressGesture(minimumDuration: 2, maximumDistance: 4, pressing: { (result) in
                print("\(result ? "开始按压" : "按压结束")")
            }) {
                print("触发长按")
            }
            // 添加其他手势
            .gesture(
                // 比如这里添加一个拖动手势
                DragGesture()
                    // 拖动改变了
                    .onChanged({ (value) in
                        print(value)
                    })
                    // 拖动结束
                    .onEnded({ (value) in
                        print(value)
                    })
            )
            VStack {
                Divider()
                Text("Hello, World!")
                    //注意：会使对齐属性失效
                    .position(CGPoint(x: 40, y: 10))
                    .frame(width: 200, height: 50, alignment: .bottomTrailing)
                    .background(Color.red)
                
                //设置多行对齐方式
                Text("Hello, World!\n这是\nthis\n哈哈哈哈哈哈")
                    .multilineTextAlignment(.trailing)
                
            }
            Spacer()
        }
        .navigationBarTitle("Text")
    }
}

struct TextSettingAttribute_Previews: PreviewProvider {
    static var previews: some View {
        TextSettingAttribute()
    }
}
