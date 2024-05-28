//
//  TermsView.swift
//  404Makers
//
//  Created by YeongHo Ha on 5/27/24.
//

import SwiftUI

struct TermsView: View {
    @State private var isOver14: Bool = false
    @State private var agreeTerms: Bool = false
    @State private var agreePrivacy: Bool = false
    @State private var agreeAll: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // 뒤로 가기 액션
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("이용 약관")
                    .font(.headline)
                Spacer()
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("404 Makers가 처음이라면,\n먼저 약관에 동의해주세요")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 16)
                
                Toggle(isOn: $agreeAll) {
                    Text("[모두 동의합니다.]")
                        .font(.body)
                        .fontWeight(.bold)
                }
                .toggleStyle(CheckboxToggleStyle(style: .green))
                .onChange(of: agreeAll) { value in
                    isOver14 = value
                    agreeTerms = value
                    agreePrivacy = value
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                Toggle(isOn: $isOver14) {
                    Text("[필수] 만 14세 이상입니다.")
                        .font(.body)
                }
                .toggleStyle(CheckboxToggleStyle(style: .green))
                
                Toggle(isOn: $agreeTerms) {
                    Text("[필수] 이용 약관 및 동의")
                        .font(.body)
                }
                .toggleStyle(CheckboxToggleStyle(style: .green))
                
                Toggle(isOn: $agreePrivacy) {
                    Text("[필수] 개인정보 수집 이용 동의")
                        .font(.body)
                }
                .toggleStyle(CheckboxToggleStyle(style: .green))
                
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
            .padding(.horizontal, 24)
        }
        //.background(Color(UIColor.systemGray6))
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    var style: Style
    
    enum Style {
        case gray
        case green
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? .green : .gray)
                .onTapGesture { configuration.isOn.toggle() }
            configuration.label
        }
    }
}

#Preview {
    TermsView()
}
