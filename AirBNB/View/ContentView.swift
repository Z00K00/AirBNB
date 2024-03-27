//
//  ContentView.swift
//  AirBNB
//
//  Created by Krajg Larson on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Listings()
                .tabItem {
                    Label("Listings", systemImage: "list.bullet")
                }

            SavedListings()
                .tabItem {
                    Label("Saved", systemImage: "heart.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ListingsViewModel())  // Provide the view model
    }
}
