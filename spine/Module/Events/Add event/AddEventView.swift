//
//  AddEventView.swift
//  spine
//
//  Created by Mac on 11/06/22.
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.dismiss) var dismiss
    @State var showAdd = false
    
    var body: some View {
        ZStack {
            VStack {
                LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.top, 10)
                    .padding(.bottom, 40)
                VStack(spacing: 50) {
                    VStack(alignment: .leading, spacing: 30) {
                        Text("How would you like to start?").fontWeight(.semibold)
                            .font(.custom("Avenir", size: 18))
                        AddEventButton(onTapped: {
                            showAdd = true
                        })
                    }
                    
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Duplicate an existing event").font(.title2)
                        ExistingEventView(onTapped: {
                            
                        })
                        ExistingEventView(publish: true, onTapped: {
                            
                        })
                    }
                }.padding(.horizontal, 20)
                
                Spacer()
            }
            VStack {
                Spacer()
                AddEventType().offset(y: self.showAdd ? 0: UIScreen.main.bounds.height)
            }.background((self.showAdd ? Color.black.opacity(0.3) : Color.clear).onTapGesture {
                self.showAdd.toggle()
            }).edgesIgnoringSafeArea(.all)
        }
        .animation(.default, value: showAdd)
        .navigationBarTitle(Text("ADD EVENT"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.dismiss()
        }){
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        })
    }
}

struct AddEventButton: View {
    var onTapped: ()-> Void
    
    var body: some View {
        Button {
            onTapped()
        } label: {
            HStack {
                Image(systemName: "plus").foregroundColor(Color.lightBrown)
                Text("Add a new event").fontWeight(.heavy)
                    .font(.custom("Avenir", size: 14))
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .padding(.leading, 10)
        .padding(5)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.7), radius: 5)
        .foregroundColor(.primary)
    }
}

struct ExistingEventView: View {
    var publish: Bool = false
    var onTapped: ()-> Void
    var body: some View {
        Button {
            onTapped()
        } label: {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Retreat").fontWeight(.bold)
                    Text("Event name lorm ipsum dolor sit amet sdfsdf sdfsd").fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    Text("9 May - 12 May 2021, 18:00").fontWeight(.regular)
                    Text("Laos").fontWeight(.regular)
                    if publish {
                        Text("Finish & publish event").fontWeight(.semibold)
                            .foregroundColor(.red)
                            //.padding(.vertical, 0.5)
                    }
                }
                .font(.custom("Avenir", size: 14))
                Spacer()
                Image("ic_launch")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 70)
            }.padding(.horizontal, 5)
        }
        .frame(maxWidth: .infinity)
        .padding( 10)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.7), radius: 5)
        .foregroundColor(.primary)
    }
}
