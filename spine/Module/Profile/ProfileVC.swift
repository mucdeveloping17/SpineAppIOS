//
//  ProfileVC.swift
//  spine
//
//  Created by OM Apple on 06/05/22.
//

import SwiftUI


struct ProfileVC: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
   @State private var isNavigationBarHidden = true
    @State var closure  : AlertAction?
    @State var isSuccess = true
    @State private var selection : Int? = 0
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                 VStack {
                    VStack {
//                        NavigationLink(destination: LoginVC(), tag: 1, selection: self.$selection) {
//
//                        }
                        AppLoginButton(title: K.appButtonTitle.logout, callback: {
                            //self.selection = 1
                           signInResponseModel.remove()
                          AppUtility.shared.userSettings.islogin = false
                          
                           AppUtility.shared.redirectToLoginScreen()
                           
                            
                        })
                    }.padding(.top, 200)
                        .padding([.leading, .trailing], 30)
                }
                .padding([.leading, .trailing], 35)
                Spacer()
            }
            .onTapGesture {
                self.hideKeyboard()
            }
        }
        .background(
            Image("ic_background")
                .resizable()
                .scaleEffect()
                .edgesIgnoringSafeArea(.all)
        )
        .navigationBarBackButtonHidden(true)
    }
    
   
}


struct ProfileVC_Previews: PreviewProvider {
    static var previews: some View {
        ProfileVC()
     }
}
