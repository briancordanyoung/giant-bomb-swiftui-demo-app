//
//  SearchController.swift
//  GiantBomb
//
//  Created by Brian Young on 6/12/22.
//

import Foundation

@MainActor
class SearchController: ObservableObject {
    private let client: GiantBombClient
    @Published
    public var results: [Result] = []

    init(apiKey: String) {
        self.client = GiantBombClient(apiKey: apiKey)
    }

    public func search(for searchTerm: String) async throws {
        let response = try await client.search(query: searchTerm)

        guard let results = response.results else {
            print("No Results")
            return
        }

       let newResults: [Result] = results.compactMap { item in
            guard
                let id = item.id,
                let name = item.name
            else { return nil }


           return Result(
            id: id,
            name: name,
            image: item.image?.iconURL
           )
        }

        self.results = newResults
    }
}

extension SearchController {
    public struct Result: Identifiable, Hashable {
        public var id: Int
        public var name: String
        public var image: String?
    }
}
