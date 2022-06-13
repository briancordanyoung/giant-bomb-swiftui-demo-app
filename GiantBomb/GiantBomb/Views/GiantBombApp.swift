//
//  GiantBombApp.swift
//  GiantBomb
//
//  Created by Brian Young on 6/12/22.
//

import SwiftUI

@main
struct GiantBombApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(searchController: SearchController(apiKey: apiKey), rentalController: RentalController())
        }.commands {
            SidebarCommands()
        }
    }

    var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: "giant-bomb-api-key") as? String ?? "no-api-key-found"
    }
}
