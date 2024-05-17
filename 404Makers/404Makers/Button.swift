//
//  Button.swift
//  404Makers
//
//  Created by 김우경 on 5/16/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var backgroundColor: Color = .blue
    var textColor: Color = .white
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(textColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(10)
        }
    }
}
#Preview {
    CustomButton(title: "Click Me", action: {
        print("Button was tapped")
    })
}

//struct CustomButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButton(title: "Click Me", action: {
//            print("Button was tapped")
//        })
//        .previewLayout(.sizeThatFits)
//        .padding()
//    }
//}
