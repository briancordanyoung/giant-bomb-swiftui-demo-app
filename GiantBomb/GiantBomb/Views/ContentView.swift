//
//  ContentView.swift
//  GiantBomb
//
//  Created by Brian Young on 6/12/22.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var searchController: SearchController
    @ObservedObject var rentalController: RentalController
    @State private var text = ""
    @State private var task: Task<Void, Never>?

    var body: some View {
        NavigationView {
            ResultList(searchController: searchController, rentalController: rentalController)
            GameRental(rentalController: rentalController, gameResult: nil)
        }
        .searchable(text: $text, placement: .automatic, prompt: "Search")
        .onChange(of: text) {
            performSearch(text: $0)
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.leading")
                })
            }
        }
    }

    private func performSearch(text: String)  {
        // TODO: Add debouncing at about 300 milliseconds

        if let task = task {
            task.cancel()
            self.task = nil
        }

        task = Task {
            do {
                try await searchController.search(for: text)
            } catch {
                let nserror = error as NSError
                if let description = nserror.userInfo["NSLocalizedDescription"] as? String,
                    description == "cancelled" {
                    () // Do thing
                } else {
                    print(error)
                }
            }
        }
    }

    private func toggleSidebar() {
    #if os(iOS)
    #else
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            searchController: SearchController(apiKey: "No API Key"),
            rentalController: RentalController()
        )
    }
}
