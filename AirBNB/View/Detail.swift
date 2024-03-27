//
//  ContentView.swift
//  AirBNB
//
//  Created by Krajg Larson on 3/27/24.
//

import SwiftUI

struct Detail: View {
    let model: Listing

    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    // Picture
                    AsyncImage(url: URL(string: model.xl_picture_url ?? ""))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.frame(in: .global).width, height: proxy.frame(in: .global).width)
                        .clipped()

                    // Info
                    Text(model.name ?? "")
                        .bold()
                        .padding()

                    if let price = model.price {
                        Text("Nightly Rate: \(price.formatted(.currency(code: "USD")))")
                    }

                    Text("Description: \(model.description ?? "")")
                        .padding()
                    Text("Summary: \(model.summary ?? "")")
                        .padding()
                    Text("House Rules: \(model.house_rules ?? "")")
                        .padding()
                    Text("Space: \(model.space ?? "")")
                        .padding()

                    // Host Info
                    Text("About Your Host")
                        .font(.title2)
                        .bold()

                    HStack {
                        AsyncImage(url: URL(string: model.host_thumbnail_url))
                            .frame(width: 75, height: 75)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())

                        Text(model.host_name)
                            .bold()
                    }
                    .padding()

                    Text("Hosting since: "+model.host_since)
                }
                .frame(maxWidth: proxy.frame(in: .global).width)
            }
        }
        .navigationTitle(model.name ?? "Listing")
    }
}

#Preview {
    Detail(model: Listing(id: "1", listing_url: nil, name: "Listing Name", summary: "Summary", space: "Space", description: "Description", house_rules: "House Rules", thumbnail_url: nil, medium_url: nil, xl_picture_url: nil, neighbourhood: nil, amenities: nil, price: 100, host_name: "Host Name", host_since: "Host Since", host_thumbnail_url: "Host Thumbnail URL", host_picture_url: "Host Picture URL"))
}
