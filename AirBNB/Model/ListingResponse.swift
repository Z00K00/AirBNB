//
//  ListingResponse.swift
//  AirBNB
//
//  Created by Krajg Larson on 3/27/24.
//

import Foundation

struct ListingResponse: Codable {
    let total_count: Int
    let results: [Listing]
}
