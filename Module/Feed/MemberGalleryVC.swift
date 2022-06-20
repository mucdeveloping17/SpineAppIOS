//
//  MemberGalleryVC.swift
//  spine
//
//  Created by OM Apple on 27/05/22.
//

import SwiftUI
import WaterfallGrid
struct GallerItem {
    var image: String
    var label: String
}

let gallerItem = [
    GallerItem(image: "ic_launch", label: "Up"),
    GallerItem(image: "sample1", label: "Tortoise"),
    GallerItem(image: "sample2", label: "Forward"),
    GallerItem(image: "sample3", label: "Down"),
    GallerItem(image: "sample1", label: "Hare"),
    GallerItem(image: "sample2", label: "Backward"),
    GallerItem(image: "sample3", label: "Up"),
    GallerItem(image: "sample2", label: "Tortoise"),
    GallerItem(image: "ic_launch", label: "Forward"),
    GallerItem(image: "sample1", label: "Down"),
    GallerItem(image: "ic_launch", label: "Hare"),
    GallerItem(image: "sample3", label: "Backward"),
    GallerItem(image: "sample1", label: "Up"),
    GallerItem(image: "ic_launch", label: "Tortoise"),
    GallerItem(image: "sample2", label: "Forward")
   
    
]
struct MemberGalleryVC: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)

    var body: some View {
        VStack {
            
            
            HStack {
                Button(action: {
                          self.presentationMode.wrappedValue.dismiss()
                       }) {
                           Image("ic_back")
                               .renderingMode(.template)
                                             .foregroundColor(.black)
                                              .aspectRatio(contentMode: .fit)
                                              .padding(.leading, -5)
                       }
                       .navigationBarHidden(true)
                Spacer()
              
                Text("MEMBERS")
                    .font(AppUtility.shared.appAvenirFont(type: .regular, size: 20))
                    .padding(.leading,10)
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
            
            }
            .frame(width: UIScreen.main.bounds.width-40)
            .padding()
            .padding(.top,0)
           
            
            Text("Discover people on Spine you might want to follow.")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 14))
                .padding(.all, 10)
            ScrollView {
                WaterfallGrid((0..<15), id: \.self) { index in
                    Image(gallerItem[index].image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }
        }
    }
    }
}

struct MemberGalleryVC_Previews: PreviewProvider {
    static var previews: some View {
        MemberGalleryVC()
    }
}

