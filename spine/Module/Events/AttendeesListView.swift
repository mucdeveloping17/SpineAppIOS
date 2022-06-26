//
//  AttendeesListView.swift
//  spine
//
//  Created by Mac on 24/06/22.
//

import SwiftUI

struct AttendeesListView: View {
    @Environment(\.dismiss) var dismiss
    @State var attendeeList: [Attendee] = []
    @State var filterdAttendeeList: [Attendee] = []
    @State var searchTxt = ""
    
    var body: some View {
        VStack {
            CustomSearchBarDynamic(placeHolder: "Search attendees", searchText: $searchTxt).padding()
                .padding(.top, 15)
            
            LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.bottom, 5)

            List {
                ForEach(self.filterdAttendeeList, id: \.self) { attendee in
                    VStack {
                        if attendee.msgEn {
                            ZStack(alignment: .leading) { //removed arrow from navlink
                                NavigationLink(
                                    destination: MsgAttendeeView(attendee: attendee)) {
                                        EmptyView()
                                    }.opacity(0)
                                AttendeeRow(attendee: attendee)
                            }
                        } else {
                            AttendeeRow(attendee: attendee)
                        }
                        Divider().opacity(0.3)
                    }
                    .listRowSeparator(.hidden)
                }
            }.listStyle(.plain)
        }
        .onChange(of: searchTxt, perform: { newTxt in
            if newTxt.isEmpty {
                self.filterdAttendeeList = self.attendeeList
            } else {
                self.filterdAttendeeList = self.attendeeList.filter {$0.name.uppercased().contains(newTxt.uppercased())}
            }
            
        })
        
        .onAppear(perform: {
            self.attendeeList = attendeeLst.sorted{$0.name.uppercased() < $1.name.uppercased()}
            self.filterdAttendeeList = attendeeList
        })
            .navigationBarTitle("ATTENDEES (\(attendeeList.count))", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .foregroundColor(.primary)
            })
    }
    
}

struct AttendeesListView_Previews: PreviewProvider {
    static var previews: some View {
        AttendeesListView()
    }
}

struct AttendeeRow: View {
    let attendee: Attendee
    @State var showProfile = false
    var body: some View {
        HStack {
            HStack {
                CircularBorderedProfileView(image: attendee.img, size: 44, borderWidth: 0, showShadow: false)
                Text(attendee.name)
                    .font(.custom("Avenir", size: 14))
                    .padding(.leading, 20)
                Spacer()
            }.onTapGesture {
                showProfile = true
            }
            
            if attendee.msgEn {
                Image(systemName: "message.fill")
                    .foregroundColor(.lightGray1)
            }
        }
//        .sheet(isPresented: $showProfile) {
//            Text(attendee.name)
//        }
    }
}

struct MsgAttendeeView: View {
    let attendee: Attendee
    @Environment(\.dismiss) var dismiss
    @State var txtMsg = ""
    var body: some View {
        ScrollView {
            LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.vertical, 5)
            VStack {
                CustomTextEditorWithPH(txt: $txtMsg, placeHolder: "Type message here")
                Button {
                  dismiss()
                } label: {
                    Text("Send")
                        .font(.custom("Avenir", size: 15)).fontWeight(.heavy)
                }.padding(.trailing, 10)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }.padding(.horizontal, 20)
            
            Spacer()
        }
        
        .navigationBarTitle("\(attendee.name.uppercased())", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.dismiss()
        }){
            Image(systemName: "chevron.left")
                .foregroundColor(.primary)
        })
    }
}

struct CustomTextEditorWithPH: View {
    @Binding var txt: String
    var placeHolder: String = "Enter"
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $txt)
                .foregroundColor(.lightGray2)
                //.frame(height: 200)
            Text(placeHolder)
                .foregroundColor(.black.opacity(0.25)).padding(8).hidden(!txt.isEmpty)
                .allowsHitTesting(false)
        }.font(.custom("Avenir", size: 14))
            //.padding(.horizontal, 20)
    }
}




