//
//  HomeSectionView.swift
//  spine
//
//

import SwiftUI

struct HomeSectionView: View {
    var body: some View {
        VStack {
            HStack {
                HStack {
                    VStack {
                        ZStack {
                            ZStack {
                                Image("sample3")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(30)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(K.appColors.appTheme, lineWidth: 2))
                            }.padding(.bottom, 30)
                                .padding(.leading, 40)
//                                .frame(width:30, height: 30)
                            
                            ZStack {
                                Image("sample2")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(20)
                                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(K.appColors.appTheme, lineWidth: 2))
                            }.padding(.top, 30)
                                .padding(.leading, 40)
                            
                            ZStack {
                                Image("sample1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(50)
                                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(K.appColors.appTheme, lineWidth: 2))

                                CustomDotView(height: 10).padding(.bottom, 40)
                                    .padding(.leading, 30)
                                
                            }.padding(.trailing, 10)
                                .padding(.bottom, 5)
                            
                        }.frame(width:80, height: 70)
//                            .background(Color.green)
                        Text("Discover\nstories")
                            .font(.custom(FontStyle.Montserrat_Medium.rawValue, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(K.appColors.appTheme)
                    }
                    .frame(width:100)
                }.padding(.leading, 20)
                Spacer()
                HStack {
                    VStack {
                        ZStack {
                            ZStack {
                                Image("sample1")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(30)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 1))
                            }
                            .padding(.trailing, 30)
                            
                            ZStack {
                                Image("sample2")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(30)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 1))
                            }
                            ZStack {
                                Image("sample3")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(30)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 1))
                            }
                            .padding(.leading, 30)
                        }.frame(width:80, height: 70)
                        Text("Discover\nmembers")
                            .font(.custom(FontStyle.Montserrat_Medium.rawValue, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(K.appColors.appTheme)
                    }
                    .frame(width:100)
                }
                Spacer()
                HStack {
                    VStack {
                        VStack(alignment: .trailing) {
                            VStack {
                                Text("YOGA")
                                    .frame(height: 25.0)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.white)
                                    .padding([.leading, .trailing], 20)
                            }.background(K.appColors.appTheme).cornerRadius(25.0)
                            
                            VStack {
                                Text("MEDICATIONS")
                                    .frame(height: 25.0)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.white)
                                    .padding([.leading, .trailing], 20)
                            }.background(K.appColors.appTheme).cornerRadius(25.0)
                            
                        }.frame(width:150, height: 70)
                        Text("Discover\nCategories")
                            .font(.custom(FontStyle.Montserrat_Medium.rawValue, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(K.appColors.appTheme)
                    }
                    .frame(width:150)
                }.padding(.trailing, 30)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
//            .frame(height:120)
//            .background(Color.yellow)
    }
}

struct HomeSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSectionView()
    }
}
