//
//  HelperViews.swift
//  spine
//
//  Created by Mac on 22/05/22.
//

import Foundation
import SwiftUI

extension Color {
    static let lightBrown = Color(hex: 0xB79888)
    static let lightGray1 = Color(hex: 0xD8D8D8)
}

struct Kconstant {
    static let filterPadding: CGFloat = 60
}

struct C {
    struct PlaceHolder {
        static let language = "Select Language"
        static let category = "Select Category"
        
    }
}


struct SubTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(K.appColors.lightGray)
            .font(.custom("Avenir", size: 14))
            //.fontWeight(.medium)
    }
}


struct Title: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.custom("Avenir", size: 14))
            .fontWeight(.heavy)
            .lineLimit(2)
    }
}

struct CircularBorderedProfileView: View {
    let image: String
    let size: CGFloat
    let borderWidth: CGFloat
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: borderWidth))
    }
}

struct LargeButton: View {
    let title: String
    let width: CGFloat
    let height: CGFloat
    let bColor: Color
    let fSize: CGFloat
    let fColor: Color
    var font: String = "Avenir"
    var action: ()-> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.custom(font, size: fSize))
                .frame(width: width , height: height, alignment: .center)
        }
        .background(bColor)
        .foregroundColor(fColor)
        .cornerRadius(width/2)
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
