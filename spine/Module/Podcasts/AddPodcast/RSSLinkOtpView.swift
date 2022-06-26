//
//  RSSLinkOtpView.swift
//  spine
//
//  Created by Mac on 31/05/22.
//

import SwiftUI

struct RSSLinkOtpView: View {
    @Environment(\.dismiss) var dismiss
    @State var verificationCode = ""
    @State var isValidCode = false
    var body: some View {
        VStack {
            LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.top, 10)
                .padding(.bottom, 20)
            VStack(spacing: 30) {
                Text("A verification code has been sent to the\n email address of the entered RSS feed\n (a_***@gmx.de).\n\n Enter this code to verify you are the\n owner of the podcast. Please check junk\n folder in case code is not received.")
                    .font(.custom("Avenir", size: 16)).fontWeight(.light)
                    .multilineTextAlignment(.center)
                HStack {
                    OTPWithKAPin(numberofElement: 4, color: .black) { currentCode in
                        print("currentCode =====> \(currentCode)")
                        print("userID")
                    } didFinishCallback: { OTPNumber in
                        if verificationCode == OTPNumber {
                            //self.verifyOTP(OTPNumber)
                        } else {
                            ShowToast.show(toatMessage: "Please enter correct OTP.")
                        }
                    }
                }.frame(height: 40)
                    .padding()
                LargeButton(title: "NEXT", width: UIScreen.main.bounds.size.width - 60, height: 40, bColor: Color.lightBrown, fSize: 15, fColor: .white) {
                    isValidCode = true
                }.padding(.top, 20)
                Button("Resend code") {
                    
                }
                NavigationLink("", isActive: $isValidCode) {
                    PodcastInfoView()
                }
            }
            Spacer()
        }
        .navigationBarTitle(Text("ENTER CODE"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.dismiss()
        }){
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        })
    }
}

struct RSSLinkOtpView_Previews: PreviewProvider {
    static var previews: some View {
        RSSLinkOtpView()
    }
}
