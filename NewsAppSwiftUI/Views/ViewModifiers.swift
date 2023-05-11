//
//  ViewModifiers.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/11/23.
//

import Foundation
import SwiftUI


struct CustomText: ViewModifier {
    var  color: Color
    var fontName: Font
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(3)
            .font(fontName)
            .foregroundColor(color)
    }
}

struct CustomImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 220)
            .frame(maxWidth: UIScreen.main.bounds.width - 80)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

extension Text {
    func formatText(_ fontName: Font = Font.title2.bold(), _ color: Color = .black) -> some View {
        return self.modifier(CustomText(color: color, fontName: fontName))
    }
}


extension View {
    func formatImage() -> some View {
        return self.modifier(CustomImage())
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue:  Double(b) / 255, opacity: Double(a) / 255)
    }
}
