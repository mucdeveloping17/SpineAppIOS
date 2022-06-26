//
//  AddEventType.swift
//  spine
//
//  Created by Mac on 12/06/22.
//

import SwiftUI

struct AddEventType: View {
    var body: some View {
        VStack {
            Text("").frame(width: 80, height: 4, alignment: .center).background(Color.lightBrown)
            Text("What kind of event is it?").bold().padding()
            List {
                ForEach(EventType.allCases) { event in
                    NavigationLink(destination: EventDetailsView(eventType: event)) {
                        EventTypeRow(eventType: event)
                    }.padding(.vertical, 10)
                }
            }
            //.scrollEnabled(false)
            .listStyle(.plain)
            .frame(height: 320)
        }
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 70)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(Color.white)
        .cornerRadius(25)
    }
    
}

struct EventTypeRow: View {
    let eventType: EventType
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(eventType.getTitle()).font(.custom("Avenir", size: 16)).fontWeight(.bold)
            Text(eventType.getDescription()).font(.custom("Avenir", size: 16)).fontWeight(.regular)
        }.padding(5)
    }
}
