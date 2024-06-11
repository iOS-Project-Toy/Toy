//
//  TechSkillsUI.swift
//  404Makers
//
//  Created by YeongHo Ha on 5/22/24.
//

import SwiftUI
//import SVGKit

struct TechSkill: Identifiable {
    let id = UUID() // 각 항목을 고유하게 식별
    let name: String // 기술 이름
    let iconName: String // svg파일 이름
}
