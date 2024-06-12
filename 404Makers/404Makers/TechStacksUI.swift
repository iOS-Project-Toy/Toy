//
//  TechSkillsUI.swift
//  404Makers
//
//  Created by YeongHo Ha on 5/22/24.
//

import SwiftUI

struct TechStack: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    var isSelected: Bool = false
}

class TechStackViewModel: ObservableObject {
    @Published var techStacks: [TechStack] = [
        TechStack(name: "C", imageName: "C"),
        TechStack(name: "REACT", imageName: "React-Light"),
        TechStack(name: "PYTHON", imageName: "Python-Light"),
        TechStack(name: "RUBY", imageName: "Ruby"),
        TechStack(name: "JULIA", imageName: "Julia-Light"),
        TechStack(name: "LUA", imageName: "Lua-Light"),
        TechStack(name: "SPRING-DARK", imageName: "Spring-Dark"),
        TechStack(name: "NUXTJS", imageName: "NuxtJS-Light"),
        TechStack(name: "FLUTTER", imageName: "Flutter-Light"),
        TechStack(name: "JAVASCRIPT", imageName: "JavaScript"),
        TechStack(name: "VUE", imageName: "Vue"),
        TechStack(name: "RUST", imageName: "Rust"),
        TechStack(name: "JQUERY", imageName: "JQuery"),
        TechStack(name: "REACTIVEX", imageName: "ReactiveX-Light"),
        TechStack(name: "PHP", imageName: "PHP-Light"),
        TechStack(name: "AISCRIPT", imageName: "AiScript-Light"),
        TechStack(name: "ANGULAR", imageName: "Angular-Light"),
        TechStack(name: "CPP", imageName: "CPP"),
        TechStack(name: "KOTLIN", imageName: "Kotlin-Light"),
        TechStack(name: "SPRING-LIGHT", imageName: "Spring-Light"),
        TechStack(name: "MATLAB", imageName: "Matlab-Light"),
        TechStack(name: "ANDROIDSTUDIO", imageName: "AndroidStudio-Light"),
        TechStack(name: "UNITY-DARK", imageName: "Unity-Dark"),
        TechStack(name: "UNITY-LIGHT", imageName: "Unity-Light"),
        TechStack(name: "NODEJS", imageName: "NodeJS"),
        TechStack(name: "HASKELL", imageName: "Haskell-Light"),
        TechStack(name: "CSS", imageName: "CSS"),
        TechStack(name: "NODEJS-LIGHT", imageName: "NodeJS-Light"),
        TechStack(name: "MYSQL", imageName: "MySQL-Light"),
        TechStack(name: "CS", imageName: "CS"),
        TechStack(name: "VUEJS-DARK", imageName: "VueJS-Dark"),
        TechStack(name: "NESTJS", imageName: "NestJS-Light"),
        TechStack(name: "SCALA", imageName: "Scala-Light"),
        TechStack(name: "VUEJS-LIGHT", imageName: "VueJS-Light"),
        TechStack(name: "KTOR", imageName: "Ktor-Light"),
        TechStack(name: "ELIXIR", imageName: "Elixir-Light"),
        TechStack(name: "JAVA", imageName: "Java-Light"),
        TechStack(name: "SWIFT", imageName: "Swift"),
        TechStack(name: "HTML", imageName: "HTML"),
        TechStack(name: "NEXTJS", imageName: "NextJS-Light"),
        TechStack(name: "ATOM", imageName: "Atom"),
        TechStack(name: "R", imageName: "R-Light"),
        TechStack(name: "DART", imageName: "Dart-Light")
    ]
    
    @Published var selectedTechStacks: [TechStack] = []

    func toggleSelection(for techStack: TechStack) {
        if let index = techStacks.firstIndex(where: { $0.id == techStack.id }) {
            techStacks[index].isSelected.toggle()
            
            if techStacks[index].isSelected {
                selectedTechStacks.append(techStacks[index])
            } else {
                selectedTechStacks.removeAll { $0.id == techStack.id }
            }
        }
    }
}

struct TechStackSelectionView: View {
    @StateObject private var viewModel = TechStackViewModel()
    @State private var totalWidth: CGFloat = 0
    @State private var rowWidths: [CGFloat] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tech Stack 선택")
                .font(.headline)
                .padding(.top, 20)
            
            Text("첫번째 기술스택이 대표기술로 설정됩니다")
                .font(.subheadline)
                .padding(.bottom, 20)
            
            ScrollView {
                VStack(alignment: .leading) {
                    GeometryReader { geometry in
                        generateRows(for: viewModel.techStacks, geometry: geometry)
                    }
                }
                .padding(.horizontal)
            }
            
            Text("선택한 Tech Stack")
                .font(.headline)
                .padding(.top, 20)
            
            ScrollView {
                VStack(alignment: .leading) {
                    GeometryReader { geometry in
                        generateRows(for: viewModel.selectedTechStacks, geometry: geometry, isSelected: true)
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func generateRows(for stacks: [TechStack], geometry: GeometryProxy, isSelected: Bool = false) -> some View {
        var width: CGFloat = 0
        var rows: [[TechStack]] = [[]]
        
        for stack in stacks {
            let stackWidth = calculateTextWidth(for: stack.name) + 40 // Approximation for padding and image
            if width + stackWidth > geometry.size.width {
                width = 0
                rows.append([stack])
            } else {
                rows[rows.count - 1].append(stack)
            }
            width += stackWidth + 15 // Adding spacing
        }
        
        return VStack(alignment: .leading) {
            ForEach(0..<rows.count, id: \.self) { rowIndex in
                HStack(spacing: 15) {
                    ForEach(rows[rowIndex]) { stack in
                        if isSelected {
                            SelectedTechStackItemView(stack: stack)
                                .onTapGesture {
                                    viewModel.toggleSelection(for: stack)
                                }
                        } else {
                            TechStackItemView(stack: stack)
                                .onTapGesture {
                                    viewModel.toggleSelection(for: stack)
                                }
                        }
                    }
                }
                .padding(.bottom, 10)
            }
        }
    }
    
    private func calculateTextWidth(for text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 17, weight: .bold)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}

struct TechStackItemView: View {
    let stack: TechStack
    
    var body: some View {
        HStack {
            Image(stack.imageName)
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.trailing, 4)
            
            Text(stack.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(stack.isSelected ? .black : .black)
                .fixedSize(horizontal: true, vertical: false) // Fixed size to prevent wrapping
        }
        .padding(6)
        .background(Color(hex: "#eceff1"))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(stack.isSelected ? Color(hex: "#55DB82") : Color.clear, lineWidth: 3)
        )
    }
}

struct SelectedTechStackItemView: View {
    let stack: TechStack
    
    var body: some View {
        HStack {
            Image(stack.imageName)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing, 4)
            
            Text(stack.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .fixedSize(horizontal: true, vertical: false) // Fixed size to prevent wrapping
        }
        .padding(6)
        .background(Color(hex: "#eceff1"))
        .cornerRadius(8)
        // Removed the overlay to eliminate the border
    }
}



extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
#Preview {
    TechStackSelectionView()
}
/*
 LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 16) {
 // 그리드 항목
 }
 -> 수직으로 쌓인 아이템을 효율적으로 배치하는 그리드 레이아웃을 제공. 필요할 때만 뷰를 로드하여 메모리 사용을 최적화.
 효과: 적응형 그리드는 화면 크기에 따라 유연하게 아이템을 배치. 예를 들어, 넓은 화면에서는 더 많은 아이템이 한 행에 배치되고, 좁은 화면에서는 적은 아이템이 배치돔.
 */
