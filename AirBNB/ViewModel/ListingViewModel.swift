//
//  Listing.swift
//  AirBNB
//
//  Created by Krajg Larson on 3/27/24.
//

import Foundation
import Combine

final class ListingsViewModel: ObservableObject {
    @Published var listings: [Listing] = []

    private let savedListingsKey = "SavedListings"  // Key for UserDefaults
    
    init() {
        fetchListings()
    }
    
    func fetchListings() {
        guard listings.isEmpty else { return } 
    }

    
    func toggleFavorite(for listing: Listing) {
        if let index = listings.firstIndex(where: { $0.id == listing.id }) {
            listings[index].isFavorite.toggle()
            saveListings()  // Save updated listings
        }
    }

    private func saveListings() {
        do {
            let encodedData = try JSONEncoder().encode(listings)
            UserDefaults.standard.set(encodedData, forKey: savedListingsKey)
        } catch {
            print("Error saving listings: \(error)")
        }
    }

    func fetchSavedListings() {
        if let savedData = UserDefaults.standard.data(forKey: savedListingsKey) {
            do {
                listings = try JSONDecoder().decode([Listing].self, from: savedData)
            } catch {
                print("Error fetching saved listings: \(error)")
            }
        }
    }
}
