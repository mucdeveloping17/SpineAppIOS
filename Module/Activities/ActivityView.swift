//
//  ActivityView.swift
//  spine
//
//  Created by Mac on 18/05/22.
//

import SwiftUI

enum ActivityTabType {
    case you
    case following
}

struct ActivityView: View {
    @State var selectedTab: ActivityTabType = .you
    @State var didSelectTab = true
    
    var body: some View {
        VStack {
            
            Text("ACTIVITY").font(.custom("Avenir", size: 16))
                .fontWeight(.semibold)
                .padding(.top,10)
            
            VStack {
                HStack {
                    HStack {
                        VStack {
                            Button {
                                print("DISCOVER Button Pressed")
                                selectedTab = .you
                                //tabTypeCompletion(selectTab)
                                self.didSelectTab = true
                            } label: {
                                Text("YOU")
                                    .font(.custom(FontStyle.Montserrat_Medium.rawValue, size: 14))
                                    .foregroundColor(Color.black)
                                    .padding(.top, 20)
                            }
                            Rectangle().frame(height: 4.0, alignment: .top)
                                .foregroundColor(K.appColors.appTheme)
                                .opacity(selectedTab == .you ? 1.0 : 0.0)
                        }
                        .frame(width:150)
                    }
                    
                    HStack {
                        VStack {
                            Button {
                                print("FOLLOWING Button Pressed")
                                selectedTab = .following
                                //tabTypeCompletion(selectTab)
                                self.didSelectTab = false
                            } label: {
                                Text("FOLLOWING")
                                    .font(.custom(FontStyle.Montserrat_Medium.rawValue, size: 14))
                                    .foregroundColor(Color.black)
                                    .padding(.top, 20)
                            }
                            
                            Rectangle().frame(height: 4.0, alignment: .top)
                                .foregroundColor(K.appColors.appTheme)
                                .opacity(selectedTab == .following ? 1.0 : 0.0)
                        }
                        .frame(width:150)
                    }//.padding(.leading, 10)
                    
                } //hstack
                Divider().frame(width: 310).offset(y: -8)
            }
            
            Spacer()
            if selectedTab == .you {
                ActivityTab1View()
            } else {
                ActivityTab2View()
            }
            //Spacer()
            //.navigationBarHidden(true)
        } //vstack
        //.navigationBarHidden(true)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}


struct ActivityTab1View: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ActivityRow()
               // Divider().padding(.leading, 80).padding(.trailing, 20).padding(.vertical, 10)
                PhotoRow()
                PhotoCommentRow()
            }
        }
    }
}

struct ActivityTab2View: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
               // ActivityRow()
               // Divider().padding(.leading, 80).padding(.trailing, 20).padding(.vertical, 10)
                PhotoRow()
                PhotoCommentRow()
            }
        }
    }
}

struct ActivityRow: View {
    var body: some View {
        HStack {
            Image("ic_launch")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .cornerRadius(44)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text("Cecilla McGee")
                    .font(.custom("Avenir", size: 16)).bold()
                Text("liked 4 of your photos").foregroundColor(.gray)
                    .font(.custom("Avenir", size: 14))
            }
            Spacer()
            Text("10min ago").foregroundColor(.gray)
                .font(.custom("Avenir", size: 14))
        }.padding(.horizontal,20)
    }
}

struct PhotoRow: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                Image("ic_launch")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .cornerRadius(44)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    Text("Cecilla McGee")
                        .font(.custom("Avenir", size: 16)).bold()
                    Text("liked 4 of your photos").foregroundColor(.gray)
                        .font(.custom("Avenir", size: 14))
                }
                
                Spacer()
                Text("10min ago").foregroundColor(.gray)
                    .font(.custom("Avenir", size: 14))
            }.padding(.horizontal,20)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(60), spacing: 0, alignment: .center)], alignment: .center, spacing: 10) {
                    ForEach((1...4), id: \.self) {_ in
                        SquareImage(imgName: "thumbnail1")
                    }
                }
            }.frame(height: 80)
                .padding(.leading, 80) //44+8+8+20 = 80
            
        }
    }
}

struct PhotoCommentRow: View {
    var body: some View {
        VStack(spacing: 0) {
        HStack(alignment: .top) {
            Image("ic_launch")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .cornerRadius(44)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text("Cecilla McGee")
                    .font(.custom("Avenir", size: 16)).bold()
                Text("liked 4 of your photos").foregroundColor(.gray)
                    .font(.custom("Avenir", size: 14))
            }
            
            Spacer()
            Text("10min ago").foregroundColor(.gray)
                .font(.custom("Avenir", size: 14))
        }.padding(.horizontal,20)
            HStack {
                Text("So you are going abroad. You have chosen your destination and you have to choose a hotel").multilineTextAlignment(.leading)
                    .font(.custom("Avenir", size: 14))
                    .padding(.trailing)
                Spacer()
                SquareImage(imgName: "thumbnail1")
                   // .frame(width: 60, height: 60)
            }.padding(.leading, 80)
                .padding(.trailing, 20)
            
        }
    }
}



struct SquareImage: View {
    let imgName: String
    var body: some View {
        Image(imgName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80, height: 80)
    }
}
