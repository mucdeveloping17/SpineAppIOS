//
//  MemberListVC.swift
//  spine
//
//  Created by OM Apple on 25/05/22.
//


import SwiftUI

var memberimg = ["ic_launch","ic_launch","ic_launch","ic_launch","ic_launch","ic_launch","ic_launch","ic_launch","ic_launch","ic_launch","ic_launch"]

var membername = ["Craig Warner","Craig Warner","Craig Warner","Craig Warner","Craig Warner","Craig Warner","Craig Warner","Craig Warner","Craig Warner","Craig Warner","Craig Warner",]



struct MemberListVC: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isActive = false
    
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
           
            
            Text("Discover moments of People's life and get inspired by them.")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 14))
            
            NavigationLink(destination: MemberGalleryVC(), isActive: self.$isActive){
            }   .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            List(0..<2){items in
               
                ForEach(memberimg,id:\.self){x in
                    
                    HStack {
                      
                            Image(x)
                            .resizable()
                            .scaledToFill()
                            //.frame(minWidth: 0, maxWidth: .infinity,minHeight: 60)
                            .frame(width: 70, height: 70, alignment: .center)
                            .cornerRadius(35)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                            .overlay(
                                            RoundedRectangle(cornerRadius: 35).stroke(K.appColors.appTheme, lineWidth: 5)
                                            
                                        )
                            .padding(.top,5)
                            .onTapGesture {
                                            DispatchQueue.main.async { // maybe even with some delay
                                                self.isActive = true
                                            }
                                        }
                        VStack {
                            Text("Craig Warner")
                                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 14))
                                .padding(.bottom,5)
                            
                            Text("Lorem Ipsum")
                                .foregroundColor(Color.gray)
                                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 12))
                                .padding(.bottom,5)
                        }
                        .padding()
                        Button {
                            print("Button tapped!")
                        } label: {
                            Text("+ FOLLOWING").frame(width: 110,height:40)
                                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 14))
                                .background(K.appColors.appTheme)
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                                .padding(.leading,20)
                        }
                        
                    }
                }
            }
            .listStyle(.plain)
        }
       
    }
}

struct MemberListVC_Previews: PreviewProvider {
    static var previews: some View {
        MemberListVC()
       
    }
}

