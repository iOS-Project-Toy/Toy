//
//  NicknameSettingsView.swift
//  404Makers
//
//  Created by YeongHo Ha on 5/26/24.
//

import SwiftUI

struct NicknameSettingsView: View {
    @State private var nickname: String = ""
    @State private var isNicknameValid: Bool = false
    @State private var validationMessage: String = "중복된 닉네임입니다."
    
    var body: some View {
        VStack {
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
                Text("1/3")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("닉네임을 설정해주세요.")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack {
                    TextField("닉네임", text: $nickname)
                        .padding()
                        .background(Color.white)
                        .overlay(
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.gray)
                            }
                                .padding(.horizontal, 8)
                        )
                    if !nickname.isEmpty {
                        Button(action: {
                            nickname = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                // 다음으로 액션
            }) {
                Text("다음으로")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "#55DB82"))
                    .foregroundColor(.black)
                    .cornerRadius(17)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        //.background(Color(UIColor.systemGray6))
    }
    
    private func validateNickname() {
        // 닉네임 유효성 검사 로직
        isNicknameValid = nickname.count > 2 && nickname.count < 10 // 예시 유효성 검사
    }
}

#Preview {
    NicknameSettingsView()
}
