//
//  TagCreateUI.swift
//  404Makers
//
//  Created by YeongHo Ha on 5/30/24.
//

import SwiftUI

struct TagCreateUI: View {
    // 텍스트필드 내용을 저장할 textFieldText와 생성된 태그를 저장할 tags 변수
    @State private var textFieldText: String = ""
    @State private var tags: [String] = []
    
    // 각 뷰에서 적용 시킬때, 플레이스홀더 내용과 추가 버튼 색상 지정가능
    var placehoder: String
    var buttonColor: Color
    
    init(placehoder: String, buttonColor: Color) {
        self.placehoder = placehoder
        self.buttonColor = buttonColor
    }
    
    var body: some View {
        VStack {
            HStack {
                // text: $textFieldText => 텍스트필드에 작성된 데이터를 textFieldText에 바인딩.
                TextField(placehoder, text: $textFieldText)
                    .padding(.bottom, 5) // 여백을 아래에만 5포인트 설정
                    .overlay( // 텍스트필드 위에 다른 뷰를 겹쳐 표시하는데 사용
                        Rectangle() // 직사각형 모양의 뷰를 생성
                            .frame(height: 2)
                            .padding(.top, 35)
                            .foregroundColor(.gray)
                    )
                Button(action: addTag) {
                    Text("추가")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(buttonColor)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            .padding(.horizontal) // 수평(왼쪽, 오른쪽)방향으로 여백
            //태그 리스트
            FlowLayout(tags: tags, removeTag: removeTag)
            .padding()
        }
    }
    
    private func addTag() {
        if !textFieldText.isEmpty {
            tags.append(textFieldText)
            textFieldText = ""
        }
    }
    
    private func removeTag(_ tag: String) {
        tags.removeAll { $0 == tag }
    }
}


struct FlowLayout: View {
    let tags: [String]
    let removeTag: (String) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) {tag in
                self.tagView(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > geometry.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 //last item
                        }
                        return result
                    })
            }
        }
    }
    
    private func tagView(for text: String) -> some View {
        HStack {
            Text("#\(text)")
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(7)
            Button(action: {
                removeTag(text)
            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.white)
                    .padding(.leading, -12)
                    .padding(.trailing, 5)
            }
        }
        .background(Color.gray)
        .cornerRadius(7)
    }
}

#Preview {
    TagCreateUI(placehoder: "테스트", buttonColor: Color(hex: "#55DB82"))
}
