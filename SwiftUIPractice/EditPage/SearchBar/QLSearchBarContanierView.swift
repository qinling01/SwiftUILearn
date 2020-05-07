//
//  QLSearchBarContanierView.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/7.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct QLSearchBarContanierView: View {
    @Binding var text: String
    @Binding var isFirstResponder: Bool
    @Binding var showCancleButton: Bool
    
    var search: ((String) -> ())?
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            QLsTextField(text: $text, isFirstResponder: $isFirstResponder, showCancleButton: $showCancleButton) { (searText) in
                self.search?(searText)
            }
            .frame(height: 20)
        }
        .padding(10)
        .background(Color(red: 240/255, green: 240/255, blue: 240/255))
        .cornerRadius(5)
    }
}

struct QLsTextField: UIViewRepresentable {

    @Binding var text: String
    @Binding var isFirstResponder: Bool
    @Binding var showCancleButton: Bool
    
    var search: ((String) -> ())?
    
    func makeUIView(context: UIViewRepresentableContext<QLsTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.tintColor = .gray
        textField.returnKeyType = .search
        textField.delegate = context.coordinator
        return textField
    }

    func makeCoordinator() -> QLsTextField.Coordinator {
        return Coordinator(text: $text,
                           isFirstResponder: $isFirstResponder,
                           showCancleButton: $showCancleButton,
                           search: search)
    }

    func updateUIView(_ uiView: UITextField,
                      context: UIViewRepresentableContext<QLsTextField>) {
        uiView.text = text
        
        if isFirstResponder {
            uiView.becomeFirstResponder()
        } else {
            uiView.resignFirstResponder()
        }
    }
    
    
    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        @Binding var isFirstResponder: Bool
        @Binding var showCancleButton: Bool

        var search: ((String) -> ())?
        
        init(text: Binding<String>,
             isFirstResponder: Binding<Bool>,
             showCancleButton: Binding<Bool>,
             search: ((String) -> ())?) {
            
            _text = text
            _isFirstResponder = isFirstResponder
            _showCancleButton = showCancleButton
            
            guard let search = search else { return }
            self.search = search
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            isFirstResponder = true
            showCancleButton = true
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // 在此处创建了连接关系，`text` 不被赋值，无法溯源激发
            text = textField.text ?? ""
            
            if text.count != 0 {
                search?(text)
            }
            
            return true
        }

    }
}
