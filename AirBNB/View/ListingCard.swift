//
//  ListingCard.swift
//  AirBNB
//
//  Created by Krajg Larson on 3/27/24.
//

import SwiftUI

struct ListingCard: View {
    @StateObject var viewModel = ListingsViewModel()
    let model: Listing

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.thumbnail_url ?? ""))
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
            
            VStack {
                Text(model.name ?? "Listing")
                    .lineLimit(1)
                    .font(.title3)
                    .bold()
                
                Text(model.description ?? "Listing")
                    .foregroundColor(Color(.secondaryLabel))
                    .lineLimit(3)
                    .font(.body)
            }
            
            Spacer()
            
            // Button to toggle favorite status
            Button(action: {
                viewModel.toggleFavorite(for: model)
            }) {
                Image(systemName: model.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(model.isFavorite ? .red : .gray)
            }
        }
    }
}

struct SavedListings: View {
    @StateObject var viewModel = ListingsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.listings.filter { $0.isFavorite }) { listing in
                NavigationLink(destination: Detail(model: listing)) {
                    Text(listing.name ?? "Listing")
                }
            }
            .navigationTitle("Saved Listings")
        }
        .onAppear {
            viewModel.fetchSavedListings()
        }
    }
}

#Preview {
    ListingCard(model: Listing(id: "1", listing_url: nil, name: "Listing Name", summary: "Summary", space: "Space", description: "Description", house_rules: "House Rules", thumbnail_url: "Thumbnail URL", medium_url: nil, xl_picture_url: nil, neighbourhood: nil, amenities: nil, price: 100, host_name: "Host Name", host_since: "Host Since", host_thumbnail_url: "Host Thumbnail URL", host_picture_url: "Host Picture URL"))
}
