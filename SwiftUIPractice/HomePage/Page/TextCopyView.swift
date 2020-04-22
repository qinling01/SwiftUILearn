//
//  TextCopyView.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/4/21.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

struct TextCopyView: View {
    @State var selectableText: Bool = true
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Toggle("Title", isOn: $selectableText)
            
            CustomTextField(.constant("哈哈哈哈哈哈哈哈啊哈"), isEditable: selectableText)
                .background(Color.yellow)
            
            SelectableText("这样子就可以复制了吗？", selectable: selectableText)
                .background(selectableText ? Color.red : .gray)
            
            Spacer()
            
        }.padding()
    }
}

class CustomUITexTField: UITextField, UITextFieldDelegate {
    fileprivate var _textBinging: Binding<String>!
    fileprivate var _isEditable = true
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return self._isEditable ? super.caretRect(for: position) : .zero
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if (!_isEditable) {
            switch action {
            case #selector(cut(_:)),
                 #selector(delete(_:)),
                 #selector(paste(_:)):
                return false
            default:
                if (action == Selector(("_promptForReplace:"))) {
                    return false
                }
            }
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self._textBinging.wrappedValue = textField.text ?? ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return self._isEditable
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return true
    }
}

struct CustomTextField: UIViewRepresentable {
    @Binding private var text: String
    private var isEditable: Bool

    init(_ text: Binding<String>, isEditable: Bool = true) {
        self._text = text
        self.isEditable = isEditable
    }

    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> CustomUITexTField {
        let textField = CustomUITexTField(frame: .zero)
        textField.delegate = textField
        textField.text = self.text
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return textField
    }

    func updateUIView(_ uiView: CustomUITexTField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = self.text
        uiView._textBinging = .constant(self.text)
        uiView._isEditable = false
        uiView.isEnabled = self.isEditable
    }
}

struct SelectableText: UIViewRepresentable {
    private var text: String
    private var selectable: Bool
    
    init(_ text: String, selectable: Bool) {
        self.text = text
        self.selectable = selectable
    }
    
    func makeUIView(context: Context) -> CustomUITexTField {
        let textField = CustomUITexTField(frame: .zero)
        textField.delegate = textField
        textField.text = self.text
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return textField
    }
    
    func updateUIView(_ uiView: CustomUITexTField, context: Context) {
        uiView.text = self.text
        uiView._textBinging = .constant(self.text)
        uiView._isEditable = false
        uiView.isEnabled = self.selectable
    }
}

struct TextCopyView_Previews: PreviewProvider {
    private let selectableText: Bool = true
    static var previews: some View {
        TextCopyView()
    }
}
