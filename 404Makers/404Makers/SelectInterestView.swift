//
//  SelectInterestView.swift
//  404Makers
//
//  Created by YeongHo Ha on 5/31/24.
//

import SwiftUI

struct SelectInterestView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    // 뒤로 가기 액션
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                }
//                Spacer()
//                Text("닉네임 설정")
//                    .font(.headline)
                Spacer()
                Text("2/3")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("관심 분야를 작성해주세요.")
                    .font(.title2)
                    .bold()
                    .padding(.top, 10)
                
                Text("메이커님의 관심사를 추가해 활동 목적을 간결하게 나타냅니다.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                TagCreateUI(placehoder: "ex) 플루터, swift, ios 등등..", buttonColor: Color(hex: "#55DB82"))
                    .padding(.bottom, 20)
            }
            .padding()
            
            Spacer()
            
            ActionButton(title: "dadf", buttonColor: .gray, textColor: .white) {
                
            }
        }
    }
}

#Preview {
    SelectInterestView()
}
