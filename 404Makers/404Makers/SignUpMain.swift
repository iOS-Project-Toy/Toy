//
//  SignUpMain.swift
//  404Makers
//
//  Created by 김우경 on 5/16/24.
//

import SwiftUI

struct SignUpMain: View {
    let images = ["Github-Light", "Github-Dark"]
    
    var body: some View {
        VStack {
            // 상단 멘트
            Text("개발자들의 커뮤니티\n404 Makers에 오신 것을 환영해요")
                .font(.system(size: 22, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            Spacer()
            
            // 인디케이터 UI (이미지 슬라이더)
            TabView {
                ForEach(images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 500)
                        .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 400) // 슬라이더 높이
            
            // Bottom buttons
            VStack(spacing: 16) {
                Button(action: {
                    // 여기 로그인 동작 추가
                }) {
                    HStack {
                        Image("Github-Light")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 22)
                        Text("GitHub 로그인")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "#55DB82"))
                    .foregroundColor(.black)
                    .cornerRadius(18)
                }
                
                Button(action: {
                    // Switch account action
                }) {
                    Text("다른 계정으로 시작하기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
        .onAppear {
            setupPageControl()
        }
    }
    private func setupPageControl() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.6)
    }
}

#Preview {
    SignUpMain()
}
