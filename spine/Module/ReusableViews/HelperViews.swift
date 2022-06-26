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
    static let lightGray2 = Color(hex: 0xADADAD)
    static let lightBlackText = Color(hex: 0x707070)
    static let placeHoldertxtClr = Color(hex: 0xA8B6C8)
    static let lightGray3 = Color(hex: 0xBDBDBE)
}

struct Kconstant {
    static let filterPadding: CGFloat = 60
}

struct C {
    struct PlaceHolder {
        static let language = "Select Language"
        static let category = "Select Category"
        static let timeZone = "Select Timezone"
        static let currency = "Currency"
        static let address = "Add address"
        static let dates = "Add dates"
        static let aboutEvent = "Who should join, and why? What will you do at your event? (minimum 50 characters)"
        
        static let aboutEventprvTxt = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
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
    var showShadow = false
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: borderWidth))
            .shadow(color: .gray, radius: showShadow ? 5 : 0)
    }
}


struct LargeButton: View {
    var disable: Bool = false
    let title: String
    let width: CGFloat
    let height: CGFloat
    let bColor: Color
    let fSize: CGFloat
    let fColor: Color
    var font: String = "Avenir"
    var img: String = ""
    var action: ()-> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Text(title)
                if img != "" {
                    Image(systemName: img)
                        .font(.title3)
                }
            }
            .font(.custom(font, size: fSize))
            .frame(width: width , height: height, alignment: .center)
        }.disabled(disable)
        .background(bColor).opacity(disable ? 0.7 : 1)
        .foregroundColor(fColor)
        .cornerRadius(width/2)
    }
}

struct BannerImageView: View {
    let image: String
    var heightF: Double = 2.0
    let screenWidth = UIScreen.main.bounds.size.width
    var body: some View {
        Image(image)
            .resizable()
            //.aspectRatio(contentMode: .fill)
            .frame(width: screenWidth, height: screenWidth/heightF)
    }
}

struct CustomButton: View {
    let image: String
    var onTapped: () -> Void
    var body: some View {
        Button {
            onTapped()
        } label: {
            Image(image)
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}

struct CustomSearchBar: View {
    let placeHolder: String
    @Binding var searchText: String
    var screenWidth = UIScreen.main.bounds.size.width - 120
    
    
    var body: some View {
        ZStack {
            Text("").frame(width: screenWidth, height: 30)
                .padding(5)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.7), radius: 5)
                
            TextField(placeHolder, text: $searchText)
                .padding(.leading, 40)
            
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    .padding(10)
                Spacer()
            }
        }.padding()
    }
}

struct CustomSearchBarDynamic: View {
    let placeHolder: String
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            Rectangle().frame(maxWidth: .infinity)
                .frame(height: 30)
                .padding(5)
                .foregroundColor(.white)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.7), radius: 5)
                
            TextField(placeHolder, text: $searchText)
                .padding(.leading, 40)
            
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    .padding(10)
                Spacer()
            }
        }
    }
}


struct ButtonWithCustomImage: View {
    let image: String
    let size: CGFloat
    var btnTapped: ()-> Void
    var body: some View {
        Button {
            btnTapped()
        } label: {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
        }

    }
}

struct ButtonWithCustomImage2: View {
    let image: String
    let size: CGFloat
    var fColor: Color? = .primary
    var btnTapped: ()-> Void
    var body: some View {
        Button {
            btnTapped()
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .foregroundColor(fColor)
        }

    }
}

struct ButtonWithSystemImage: View {
    let image: String
    let size: CGFloat
    var fColor: Color? = .primary
    var btnTapped: ()-> Void
    var body: some View {
        Button {
            btnTapped()
        } label: {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .foregroundColor(fColor)
        }.foregroundColor(fColor)

    }
}


struct VideoThumbnailImage: View {
    let image: String
    let size: CGFloat
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
            Image("PlayImageThumb")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size/2, height: size/2)
        }
        
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


extension Notification.Name {
    static let clearDates = Notification.Name("cleardates")
}
