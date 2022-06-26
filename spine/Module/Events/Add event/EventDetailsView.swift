//
//  EventDetailsView.swift
//  spine
//
//  Created by Mac on 12/06/22.
//

import SwiftUI

struct EventDetailsView: View {
    let eventType: EventType
    @Environment(\.dismiss) var dismiss
    @State var eventTitle: String = ""
    @State var startDate: Date = Date()
    @State var startTime: Date = Date()
    @State var endDate: Date = Date()
    @State var endTime: Date = Date().addingTimeInterval(3600)
    @State var selectedTimeZone = ""
    @State var selectedLocation = ""
    @State var eventWebsiteLink: String = ""
    @State var onlineEventLink: String = ""
    @State var aboutText: String = ""
    @State var isPaid = false
    @State var bookEventLink: String = ""
    @State var selectedCurrency: String = ""
    @State var amount: String = "0"
    @State var attendees: String = ""
    @State var selectedLanguage = ""
    @State var acceptParticipants = false
    @State var allowComments = false
    @State var selectedCategory = ""
    @State var categories = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6","Item 7"]
    @State var selectedCategories: [String] = []
    @State var showPreview = false
    @State private var images = [UIImage]()
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 0) {
                LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.top, 10)
                AddImageView(images: $images)
            }
            
            VStack(spacing: 30) {
                VStack(alignment: .leading) {
                    EventDetailTitle(text: "Event Title*")
                    CustomTextFieldWithCount(searchText: $eventTitle, placeholder: "Enter title", count: 40)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        EventDetailTitle(text: "Start*")
                        DateSelectionView(type: .date, selectedDate: $startDate, size: 15).padding(.vertical,2)
                        DateSelectionView(type: .time, selectedDate: $startTime, size: 15).padding(.vertical,2)
                    }.frame(width: 160)
                    Spacer()
                    VStack(alignment: .leading) {
                        EventDetailTitle(text: "End*")
                        DateSelectionView(type: .date, selectedDate: $endDate, size: 15).padding(.vertical,2)
                        DateSelectionView(type: .time, selectedDate: $endTime, size: 15).padding(.vertical,2)
                    }.frame(width: 160)
                    
                }
                
                VStack(alignment: .leading) {
                    EventDetailTitle(text: "Timezone*")
                    NavigationLink(destination: ItemSelectionView(selectedItem: $selectedTimeZone, itemType: .timezone)) {
                        CustomNavigationView(selectedItem: $selectedTimeZone, placeholder: C.PlaceHolder.timeZone)
                    }
                }
                
                if eventType == .local {
                    VStack(alignment: .leading) {
                        EventDetailTitle(text: "Location*")
                        NavigationLink(destination: ItemSelectionView(selectedItem: $selectedLocation, itemType: .location)) {
                            CustomNavigationView(selectedItem: $selectedLocation, placeholder: C.PlaceHolder.address)
                        }
                    }
                } else {
                    VStack(alignment: .leading) {
                        EventDetailTitle(text: "Add link to join \(eventType.rawValue) event")
                        CustomTextFieldDynamic(searchText: $onlineEventLink, placeHolder: "e.g. http://zoom...")
                    }
                }
                
                
                VStack(alignment: .leading) {
                    EventDetailTitle(text: "Add link to event website")
                    CustomTextFieldDynamic(searchText: $eventWebsiteLink, placeHolder: "e.g. http://facebook...")
                }
                
                VStack(alignment: .leading) {
                    EventDetailTitle(text: "About the event*")
                    NavigationLink(destination: AboutEventView(aboutTxt: $aboutText)) {
                        CustomNavigationView(selectedItem: $aboutText, placeholder: "Enter description")
                    }
                }
                
                HStack {
                    EventDetailTitle2(text: "Paid event*")
                    Toggle("", isOn: $isPaid)
                        .tint(Color.lightBrown)
                }
                
                if isPaid {
                    VStack(spacing: 30) {
                        
                        HStack {
                            EventDetailTitle(text: "Fee*")
                            Spacer()
                            CustomTextFieldDynamic(searchText: $amount, placeHolder: "")
                                .frame(width: 80)
                            NavigationLink(destination: ItemSelectionView(selectedItem: $selectedCurrency, itemType: .currency)) {
                                CustomNavigationView(selectedItem: $selectedCurrency, placeholder: C.PlaceHolder.currency)
                                    .frame(width: 120)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            EventDetailTitle(text: "Where to book the event")
                            CustomTextFieldDynamic(searchText: $bookEventLink, placeHolder: "e.g. http://www...")
                        }
                    }
                }
                
                VStack(spacing: 30)  {
                    VStack(alignment: .leading) {
                        EventDetailTitle(text: "Max. number of attendees")
                        CustomTextFieldDynamic(searchText: $attendees, placeHolder: "Add")
                    }
                    
                    VStack(alignment: .leading) {
                        EventDetailTitle(text: "Language the event is hosted in*")
                        NavigationLink(destination: ItemSelectionView(selectedItem: $selectedLanguage, itemType: .language)) {
                            CustomNavigationView(selectedItem: $selectedLanguage, placeholder: "Select")
                        }
                    }
                    
                    if eventType != .local {
                        HStack {
                            VStack(alignment: .leading) {
                                EventDetailTitle2(text: "Want to accept participants?*")
                                EventDetailDesc(text: "(Your event link will then only be shared with\n people you accepted)")
                            }.frame(width: 250)
                                .offset(x: -6)
                            Spacer()
                            Toggle("", isOn: $acceptParticipants)
                                .tint(Color.lightBrown)
                        }
                    }
                    
                    HStack {
                        EventDetailTitle2(text: "Allow comments*")
                        Toggle("", isOn: $allowComments)
                            .tint(Color.lightBrown)
                    }
                    
                    VStack(alignment: .leading) {
                        EventDetailTitle(text: "Event category*")
                        NavigationLink(destination: ItemSelectionView(selectedItem: $selectedCategory, itemType: .category)) {
                            CustomNavigationView(selectedItem: $selectedCategory, placeholder: "Select")
                        }
                    }
                    
                    if selectedCategory != "" {
                        SubCategoryView(mainCategory: selectedCategory, categories: $categories, selectedCategories: $selectedCategories)
                    }
                    
                    VStack(spacing: 10) {
                        LargeButton(title: "PREVIEW", width: UIScreen.main.bounds.width - 40, height: 40, bColor: Color.lightBrown, fSize: 15, fColor: .white) {
                            showPreview = true
                        }
                        
                        HStack {
                            Button("Delete") {
                                
                            }.font(.custom("Avenir", size: 14))
                                .foregroundColor(Color.lightBrown)
                                .padding(.leading, 10)
                            Spacer()
                        }
                    }
                }
            }.padding(20)
            Spacer()
        }
        .fullScreenCover(isPresented: $showPreview, content: {
            EventDetailPreviewView(eventType: eventType, images: images)
        })
        
        .navigationBarTitle(Text(eventType.getTitle().capitalized), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.dismiss()
        }){
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        })
    }
}


struct AddImageView: View {
    @Binding  var images: [UIImage]
    @State private var isShowPhotoLibrary = false
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack {
            if images.isEmpty {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 185)
                    .foregroundColor(Color(hex: 0xD7C7B5))
                    .opacity(0.5)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.fixed(screenWidth))]) {
                        ForEach(images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: screenWidth, height: 185)
                                .edgesIgnoringSafeArea(.all)
                        }
                    }
                }.frame( height: 185)
            }
            
            Button {
                isShowPhotoLibrary = true
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "camera.fill")
                    Text("Add photo(s)").font(.custom("Avenir", size: 14)).fontWeight(.regular)
                        .foregroundColor(.lightBrown)
                }
            }
        }.offset(y: -1)
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(sourceType: .photoLibrary, selectedImages: self.$images)
            }
    }
}


struct EventDetailTitle: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.custom("Avenir", size: 14)).fontWeight(.heavy)
    }
}

struct EventDetailTitle2: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.custom("Avenir", size: 16)).fontWeight(.heavy)
    }
}

struct EventDetailDesc: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.custom("Avenir", size: 12)).fontWeight(.regular)
    }
}
