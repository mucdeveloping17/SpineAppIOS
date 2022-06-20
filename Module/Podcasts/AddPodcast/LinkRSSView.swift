//
//  LinkRSSView.swift
//  spine
//
//  Created by Mac on 30/05/22.
//

import SwiftUI

enum RssStaus {
    case success
    case failure
}

struct LinkRSSView: View {
    @Environment(\.dismiss) var dismiss
    let screenWidth = UIScreen.main.bounds.size.width
    @State var searchText = ""
    @State var status: RssStaus? = .failure
    
    var body: some View {
        VStack(spacing: 20) {
            if status == .failure {
                ZStack {
                    Color(hex: 0x2C2C2C)
                        .frame(width: screenWidth, height: 130)
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()
                            ButtonWithSystemImage(image: "multiply", size: 14, fColor: .white) {
                                status = nil
                            }.padding(.trailing, 10)
                        }
                        Text("! Make sure your RSS feed contains atleast\n one episode and the following tags:\n title, author, email").foregroundColor(.white)
                            .font(.custom("Avenir", size: 14))
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                }.padding(.top, 10)
            } else {
                LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.top, 10)
            }
            
            VStack(spacing: 20) {
                Text("What's the link to your podcast's RSS feed?")
                    .font(.custom("Avenir", size: 14)).fontWeight(.bold)
                Text("Only add a podcast you own the right to and\n make sure it meats our guidlines. You only\n have to do this once. After your podcast is on\n the Spiritual Network, it will update\n automatically")
                    .font(.custom("Avenir", size: 16)).fontWeight(.ultraLight)
                    .multilineTextAlignment(.center)
            }.padding(.horizontal, 20)
            
            VStack(alignment: .center) {
                HStack {
                    Text("Link to RSS feed")
                        .font(.custom("Avenir", size: 14)).fontWeight(.bold)
                        .padding(.leading, 30)
                    Spacer()
                }
                CustomTextField(searchText: $searchText)
            }
            LargeButton(title: "VALIDATE RSS FEED", width: screenWidth - 60, height: 40, bColor: Color.lightBrown, fSize: 15, fColor: .white) {
                print("Tapped")
                status = .success
            }.padding(.top, 30)
            Spacer()
            NavigationLink("", tag: RssStaus.success, selection: $status) {
                RSSLinkOtpView()
            }
        }
        
        .navigationBarTitle(Text("ADD PODCAST"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.dismiss()
        }){
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        })
    }
}

struct LinkRSSView_Previews: PreviewProvider {
    static var previews: some View {
        LinkRSSView()
    }
}

struct CustomTextField: View {
    @Binding var searchText: String
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text("").frame(width: screenWidth - 60, height: 30)
                .padding(5)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.7), radius: 5)
                
            TextField("https://www.mydomain.com/path/to/podcast_rss.xml", text: $searchText)
                .font(Font.system(size: 14))
                .padding(.leading, 5)
        }.padding(.horizontal, 30)
    }
}
