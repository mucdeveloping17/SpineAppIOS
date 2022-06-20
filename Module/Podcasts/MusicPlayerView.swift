//
//  MusicPlayerView.swift
//  spine
//
//  Created by Mac on 26/05/22.
//

import SwiftUI

struct MusicPlayerView: View {
    @State var sliderValue: CGFloat = 10
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Image("musicPlayerBG")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.72)
                    //.mask(Color.white.opacity(0.9))
                VStack(alignment: .leading, spacing: 8) {
                    Text("EPISODE-#3")
                        .foregroundColor(.white)
                        .font(.custom("Poppins", size: 14)).fontWeight(.regular)
                    Text("Universal Laws from Friend of the Indian")
                        .foregroundColor(.white)
                        //.font(.custom("Poppins", size: 22)).fontWeight(.heavy)
                        .font(.system(size: 22, weight: .heavy))
                        .lineLimit(2)
                    Text("Eospace mit dem ganzen Universum")
                        .foregroundColor(.white)
                        .font(.custom("Poppins", size: 14)).fontWeight(.regular)
                        .lineLimit(2)
                    HStack(spacing: 10) {
                        CircularBorderedProfileView(image: "Oval 57", size: 45, borderWidth: 3)
                        Text("Tom Reese")
                            .foregroundColor(.white)
                            .font(.custom("Avenir", size: 14)).fontWeight(.regular)
                        Spacer()
                        LargeButton(title: "ALL EPISODES", width: 140, height: 30, bColor: Color.lightBrown, fSize: 12, fColor: .white, font: "Poppins") {
                            dismiss()
                        }
                        
                    }.padding(.top, 10)
                }.padding(.horizontal, 30)
                    .padding(.bottom, 20)
                
            }
           
            ZStack(alignment: .top) {
                Text("")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.28)
                //.background(Color.lightBrown)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.lightBrown.opacity(0.4), Color.lightBrown]), startPoint: .top, endPoint: .bottom)
                    )
//                Image("ic_background")
//                    .resizable()
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.28)
//                    .scaleEffect()
//                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    Slider(value: $sliderValue, in: 0...100) { _ in
                        print("")
                    }.tint(Color.lightBrown)
                        .padding()
                    
                    HStack {
                        
                        ButtonWithSystemImage(image: "heart.fill", size: 18, fColor: Color.lightGray1) {
                            print("Heart tapped")
                        }
                        Spacer()
                        ButtonWithSystemImage(image: "backward.fill", size: 20, fColor: Color.lightBrown) {
                            
                        }
                        Spacer()
                        ZStack {
                            Text("")
                                .frame(width: 70, height: 70)
                                .background(Color.lightBrown)
                                .clipShape(Circle())
                            ButtonWithSystemImage(image: "play.fill", size: 20, fColor: .white) {
                                
                            }.padding(.leading,3)
                        }
                        Spacer()
                        ButtonWithSystemImage(image: "forward.fill", size: 20, fColor: Color.lightBrown) {
                            
                        }
                        Spacer()
                        ButtonWithCustomImage(image: "directArrow", size: 18) {
                            print("share tapped")
                        }
                        
                    }.padding(.horizontal, 20)
                    Color(hex: 0xD7C7B5)
                        .frame(width: 60, height: 2)
                }
            }
        }.edgesIgnoringSafeArea(.all)
        //.padding(.bottom, 170) //tab bar height
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            })
            .navigationBarItems(trailing: Button(action : {
                print("More")
            }){
                NavBarButtonImage(image: "More")
            })
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
