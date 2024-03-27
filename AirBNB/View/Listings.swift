//
//  Listings.swift
//  AirBNB
//
//  Created by Krajg Larson on 3/27/24.
//

import SwiftUI
import Combine

struct Listings: View {
    @ObservedObject var viewModel = ListingsViewModel()
    @State private var fetched = false

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.listings.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.listings) { listing in
                        NavigationLink(destination: Detail(model: listing)) {
                            ListingCard(model: listing)
                        }
                    }
                }
            }
            .navigationTitle("Airbnb")
        }
        .onAppear {
            if !fetched {
                viewModel.fetchListings()
                fetched = true
            }
        }
    }
}

struct Listings_Previews: PreviewProvider {
    static var previews: some View {
        Listings()
    }
}


#Preview {
    Listings()
}
