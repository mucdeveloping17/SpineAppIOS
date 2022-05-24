//
//  MainTabView.swift
//  spine


import SwiftUI

struct TabBarView: View {
//    @State private var currentView: Tab = .Ballots
    @State private var selection = 0
    
    init() {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    
    var body: some View {
//        VStack {
//            CurrentScreen(currentView: self.$currentView)
//            Spacer()
//            TabBar(currentView: self.$currentView)
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//        .navigationBarHidden(true)
//        .edgesIgnoringSafeArea(.all)
//        NavigationView {
            TabView(selection: $selection) {
    //            Text("Feed Tab")
    //                .font(.system(size: 30, weight: .bold, design: .rounded))
//                FeedListVC()
                FeedVC()
                    .tabItem {
                        Image("ic_home").renderingMode(.template)
                        Text("Feed")
                    }
                    .tag(0)

                Text("Event Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                 
                    .tabItem {
                        Image("ic_event").renderingMode(.template)
                        Text("Event")
                    }
                    .tag(1)

                Text("Podcasts Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image("ic_podcast").renderingMode(.template)
                        Text("Podcasts")
                    }
                    .tag(2)

                Text("Activities Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image("ic_activites").renderingMode(.template)
                        Text("Activities")
                    }
                    .tag(3)
                
               // Text("Profile Tab")
//                    .font(.system(size: 30, weight: .bold, design: .rounded))
                ProfileVC()
                    .tabItem {
                        Image("ic_profile").renderingMode(.template)
                        Text("Profile")
                    }
                    .tag(4)
            }
            .accentColor(K.appColors.appTheme)
//        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
