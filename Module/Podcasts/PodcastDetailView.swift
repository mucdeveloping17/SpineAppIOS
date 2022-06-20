//
//  PodcastDetailView.swift
//  spine
//
//  Created by Mac on 23/05/22.
//

import SwiftUI

struct PodcastDetailView: View {
    //let num: Int = 1
    let screenWidth = UIScreen.main.bounds.size.width
    let imageSize: CGFloat = 120
    @Environment(\.dismiss) var dismiss
    @State var showMoreAction = false
    
    init() {
           // UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isHidden = true
        }
    
    var body: some View {
        // ScrollView {
        VStack {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    Image("podcastDetailBanner")
                        .resizable()
                    //.aspectRatio(contentMode: .fit)
                        .frame(width: screenWidth, height: screenWidth/1.5)
                    ZStack {
                        Text("")
                            .frame(width: screenWidth, height: screenWidth/2.5)
                            .background(Color.lightBrown)
                        VStack(alignment: .leading) {
                            PodcastTitle(title: "Oliver Reese", fSize: 14, linelimit: 1, fontWeight: .heavy, fColor: .white)
                            PodcastTitle(title: "From American University Texas, Test sample", fSize: 20, linelimit: 2, fontWeight: .heavy, fColor: .white)
                            HStack {
                                PodcastTitle(title: "4 Episodes", fSize: 14, linelimit: 1, fontWeight: .heavy, fColor: .white)
                                Spacer()
                                LargeButton(title: "SUBSCRIBE", width: 100, height: 30, bColor: .white, fSize: 12, fColor: Color.lightBrown, font: "Poppins") {
                                    print("Tapped")
                                }
                            }
                        }.padding(.horizontal, 20)
                    }
                    
                }
                
                CircularBorderedProfileView(image: "Oval 57", size: imageSize, borderWidth: 5)
                    .offset(y: screenWidth/1.5 - (imageSize - 20))
            }
            
            PodcastDetailList()
        }.edgesIgnoringSafeArea(.all)
            .confirmationDialog("", isPresented: $showMoreAction, actions: {
                Button("Follow"){
                    
                }
                Button("Report Post"){
                    
                }
            })
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            })
            .navigationBarItems(trailing: Button(action : {
                print("More")
                showMoreAction = true
            }){
                NavBarButtonImage(image: "More")
            })
            .navigationBarItems(trailing: Button(action : {
                print("Share")
            }){
                NavBarButtonImage(image: "directArrow")
            })
        
    }
}

//struct PodcastDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PodcastDetailView()
//    }
//}

struct PodcastDetailList: View {
    var body: some View {
        List {
               Divider().padding(.leading, 10)
                .listRowSeparator(.hidden)

                ForEach((1...4), id: \.self) { item in
                    VStack {
                        ZStack {
                            PodcastDetailListRow()//.padding(.vertical, 5)
                            NavigationLink(destination: MusicPlayerView()) {
                                EmptyView()
                            }.buttonStyle(PlainButtonStyle())
                                .opacity(0.0)
                        }
                        Divider().padding(.leading, 10)
                    }.listRowSeparator(.hidden)
                }
        }//.edgesIgnoringSafeArea(.all)
        .padding(.leading, -20)
        .padding(.bottom, 70) // fix- list hides below tab bar
        .listStyle(.plain)
    }
}


struct PodcastDetailListRow: View {
    var body: some View {
        HStack(alignment: .center) {
            
            VStack(alignment: .leading, spacing: 5) {
                
                HStack {
                    ButtonWithSystemImage(image: "mic", size: 8) {
                        print("mic tapped")
                    }.foregroundColor(.primary).offset(y: -3)
                        
                    Text("En  |")
                        .modifier(SubTitleModifier())
                    
                    ButtonWithCustomImage(image: "CircleClock", size: 15) {
                        print("mic tapped")
                    }.foregroundColor(.primary).offset(y: -3)
                    
                    Text("1h 17min")
                        .modifier(SubTitleModifier())
                }
               
                Text("Universal law From Friend of Indins american for ")
                    .fontWeight(.heavy)
                    .lineLimit(2)
                    .font(.custom("Avenir", size: 14))
                    
                HStack(spacing: 10) {
                    ButtonWithSystemImage(image: "play.fill", size: 8, fColor: K.appColors.lightGray) {
                        print("Play tapped")
                    }
                    Text("45").modifier(SubTitleModifier())
                    ButtonWithSystemImage(image: "heart.fill", size: 12, fColor: K.appColors.lightGray) {
                        print("Heart tapped")
                    }
                }//.foregroundColor(K.appColors.lightGray)
                
            }.padding(.leading, 10)
            Spacer()
            
            
            HStack(spacing: 20) {
                ButtonWithCustomImage(image: "Bookmark", size: 18) {
                    print("share tapped")
                }
                
                ButtonWithSystemImage(image: "play.circle", size: 40, fColor: Color.lightBrown) {

                }.font(.system(size: 20, weight: .ultraLight))
                    
            }
            
            
        }.padding(.leading, 10)
            .padding(.vertical, 5)
    }
}

struct PodcastFontStyle: ViewModifier {
    let fSize: CGFloat
    func body(content: Content) -> some View {
        content
            //.fontWeight(.medium)
            .foregroundColor(.primary)
            .font(.custom("Avenir", size: fSize))
            
    }
}


struct PodcastTitle: View {
    let title: String
    let fSize: CGFloat
    let linelimit: Int
    let fontWeight: Font.Weight
    let fColor: Color
    var body: some View {
        Text(title)
            .foregroundColor(fColor)
            .font(.custom("Avenir", size: fSize))
            .fontWeight(fontWeight)
            .lineLimit(linelimit)
    }
}

struct NavBarButtonImage: View {
    let image: String
    var body: some View {
        Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18)
    }
}
