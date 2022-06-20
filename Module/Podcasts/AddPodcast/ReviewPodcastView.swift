//
//  ReviewPodcastView.swift
//  spine
//
//  Created by Mac on 01/06/22.
//

import SwiftUI

struct ReviewPodcastView: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let imageSize: CGFloat = 120
    @Environment(\.dismiss) var dismiss
    @State var showConfirm = false
    let heightRatio: CGFloat = 1.7
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    Image("podcastDetailBanner")
                        .resizable()
                    //.aspectRatio(contentMode: .fit)
                        .frame(width: screenWidth, height: screenWidth/heightRatio)
                    ZStack {
                        Text("")
                            .frame(width: screenWidth, height: screenWidth/2.5)
                            .background(Color.lightBrown)
                        VStack(alignment: .leading, spacing: 10) {
                            PodcastTitle(title: "Oliver Reese", fSize: 14, linelimit: 1, fontWeight: .heavy, fColor: .white)
                            PodcastTitle(title: "From American University Texas, Test sample", fSize: 20, linelimit: 2, fontWeight: .heavy, fColor: .white)
                            HStack {
                                PodcastTitle(title: "4 Episodes", fSize: 14, linelimit: 1, fontWeight: .heavy, fColor: .white)
                                Spacer()
                            }
                        }.padding(.horizontal, 20)
                    }
                    
                }
                
                CircularBorderedProfileView(image: "Oval 57", size: imageSize, borderWidth: 5)
                    .offset(y: screenWidth/heightRatio - (imageSize - 20))
            }
            
            PodcastReviewDetailList()
        }//.edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showConfirm, content: {
            PodcastConfirmationView()
        })
        .navigationTitle("REVIEW PODCAST")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
            .navigationBarItems(trailing: LargeButton(title: "SUBMIT", width: 60, height: 22, bColor: Color.lightBrown, fSize: 12, fColor: .white) {
                showConfirm = true
            }//.opacity(0.3).disabled(true)
            )
    }
}

struct PodcastReviewDetailList: View {
    var body: some View {
        List {
               Divider().padding(.leading, 10)
                .listRowSeparator(.hidden)

                ForEach((1...4), id: \.self) { item in
                    VStack {
                        ZStack {
                            PodcastDetailListRow()//.padding(.vertical, 5)
//                            NavigationLink(destination: MusicPlayerView()) {
//                                EmptyView()
//                            }.buttonStyle(PlainButtonStyle())
//                                .opacity(0.0)
                        }
                        Divider().padding(.leading, 10)
                    }.listRowSeparator(.hidden)
                }
        }//.edgesIgnoringSafeArea(.all)
        .padding(.leading, -20)
        //.padding(.bottom, 70) // fix- list hides below tab bar
        .listStyle(.plain)
    }
}

struct ReviewPodcastView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewPodcastView()
    }
}
