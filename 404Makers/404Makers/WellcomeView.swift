//
//  WellcomeView.swift
//  404Makers
//
//  Created by YeongHo Ha on 5/28/24.
//

import SwiftUI

struct WellcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("topImage")
                .resizable()
                .scaledToFit()
                .frame(width: 266, height: 264)
                .padding(.bottom, 16)
            
            Text("환영합니다.\n이제 활동할 프로필을 만들어주세요.")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
            
            GeometryReader { geometry in
                Image("bottomImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 340, height: 397)
                    .position(x: geometry.size.width - 170, y: geometry.size.height - 198.5)
                    .offset(x: 70, y: 100) // 더 오른쪽 하단으로 이동
            }
            
            Spacer()
            
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    WellcomeView()
}
