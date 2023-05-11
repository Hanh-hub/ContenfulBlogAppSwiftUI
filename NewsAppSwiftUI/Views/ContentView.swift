//
//  ContentView.swift
//  NewsAppSwiftUI
//
//  Created by Hanh Vo on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        
        TabView {
            MainView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .environmentObject(viewModel)
            AllPosts()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("See all")
                }
                .environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
