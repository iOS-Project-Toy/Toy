//
//  Button.swift
//  404Makers
//
//  Created by 김우경 on 5/16/24.
//

import SwiftUI

struct ActionButton: View {
    var title: String
    var buttonColor: Color
    var textColor: Color
    var action: () -> Void

    init(title: String = "다음으로", buttonColor: Color = Color(hex: "#55DB82"), textColor: Color = .black, action: @escaping () -> Void) {
        self.title = title
        self.buttonColor = buttonColor
        self.textColor = textColor
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(buttonColor)
                .foregroundColor(textColor)
                .cornerRadius(17)
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
    }
}

/*
 사용방법:
 이미 init으로 타이틀, 버튼색상, 텍스트 색상를 지정했기 때문에
 지정된 속성 그대로 적용시킬 때는
 
 ActionButton {
    // 액션추가
 }
 
 로 코드를 작성하면 되고,
 타이틀, 버튼색상, 텍스트색상을 변경하고자 할 경우
 
 ActionButton(title: "바꿀내용", buttonColor: .변경할 색상, textColor: .변경할 색상) {
     // 등록하기 액션
 }
 
 위 코드 처럼 ()괄호안에 속성과 변경 내용을 작성하면 됩니다.
 
 */


#Preview {
    ActionButton() {
        
    }
}
