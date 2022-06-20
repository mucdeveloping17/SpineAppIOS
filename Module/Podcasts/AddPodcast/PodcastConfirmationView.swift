//
//  PodcastConfirmationView.swift
//  spine
//
//  Created by Mac on 05/06/22.
//

import SwiftUI

struct PodcastConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    let screenWidth = UIScreen.main.bounds.size.width
    var body: some View {
        VStack(alignment: .leading) {
            VStack(spacing: 0) {
                HStack {
                    ButtonWithSystemImage(image: "multiply", size: 15) {
                        dismiss()
                    }
                    Spacer()
                    Text("THANK YOU")
                        .font(.custom("Avenir", size: 18))
                    Spacer()
                    
                }.padding()
                LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4)
            }
            
            VStack(spacing: 30) {
                
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .font(Font.title.weight(.light))
                    .frame(width: 35, height: 35)
                    .foregroundColor(.lightBrown)
                Text("Your podcast is live on the Spiritual\n Network App")
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir", size: 16))
                
                LargeButton(title: "GO TO PODCASTS", width: screenWidth - Kconstant.filterPadding, height: 40, bColor: Color.lightBrown, fSize: 15, fColor: .white) {
                    print("Tapped")
                }
                
            }.padding(.horizontal, Kconstant.filterPadding/2)
                .padding(.top, 20)
            
            Spacer()
        }.padding(.vertical, 10)
    }
}

struct PodcastConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastConfirmationView()
    }
}
