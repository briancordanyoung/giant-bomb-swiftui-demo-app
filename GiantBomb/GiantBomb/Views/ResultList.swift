//
//  ResultList.swift
//  GiantBomb
//
//  Created by Brian Young on 6/12/22.
//

import SwiftUI
struct ResultList: View {
    @ObservedObject var searchController: SearchController
    @ObservedObject var rentalController: RentalController
    @State private var selectedResult: SearchController.Result? = nil

    var body: some View {
        VStack {
            Text("Games").font(.title)
            List(searchController.results) { result in
                NavigationLink(
                    destination: GameRental(rentalController: rentalController, gameResult: result),
                    tag: result,
                    selection: $selectedResult
                ) {
                    Text(result.name)
                }
            }
        }
    }
}

struct ResultList_Previews: PreviewProvider {
    static var previews: some View {
        ResultList(
            searchController: SearchController(apiKey: "No API Key"),
            rentalController: RentalController()
        )
    }
}
