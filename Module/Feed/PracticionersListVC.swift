//
//  PracticionersListVC.swift
//  spine
//
//  Created by OM Apple on 27/05/22.
//


import SwiftUI



struct PracticionersListVC: View {
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
                
                Text("YOUR SELECTION Of PRACTICIONERS")
                    .font(AppUtility.shared.appAvenirFont(type: .regular, size: 16))
                    .padding(.leading,10)
                Spacer()
                
                // Image("ic_close")
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("ic_close")
                }
                
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
                        VStack {
                            Image(x)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60, alignment: .center)
                                .cornerRadius(30)
                                .padding(.top,5)
                                .onTapGesture {
                                    DispatchQueue.main.async { // maybe even with some delay
                                        self.isActive = true
                                    }
                                }
                            Text("Peter")
                                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 14))
                                .padding(.bottom,5)
                        }
                        VStack {
                            Text("Naturheilpraxis Peter Feigel")
                                .font(AppUtility.shared.appAvenirFont(type: .book, size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(K.appColors.appTheme)
                               
                            Text("Mari Dietrich")
                                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 14))
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            Text("Lorem Ipsum dolor sit amet det lorem Ipsum dolor ")
                                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color.black)
                            
                            Text("Berlin, Germany")
                                .font(AppUtility.shared.appAvenirFont(type: .regular, size: 12))
                                .foregroundColor(Color.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        
                        Button(action: {
                            print("ic_heart pressed")
                        }) {
                            Image("ic_bookmark")
                                .padding(.trailing,-10)
                        }
                        //                        Button {
                        //                            print("Button tapped!")
                        //                        } label: {
                        //                            Text("+ FOLLOWING").frame(width: 110,height:40)
                        //                                .font(AppUtility.shared.appFont(type: .regular, size: 14))
                        //                                .background(K.appColors.appTheme)
                        //                                .foregroundColor(Color.white)
                        //                                .cornerRadius(20)
                        //                                .padding(.leading,20)
                        //                        }
                        
                        
                    }
                }
            }
            .listStyle(.plain)
        }
        
    }
}

struct PracticionersListVC_Previews: PreviewProvider {
    static var previews: some View {
        PracticionersListVC()
        
    }
}

