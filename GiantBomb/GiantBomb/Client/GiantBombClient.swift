//
//  GiantBombClient.swift
//  GiantBomb
//
//  Created by Brian Young on 6/12/22.
//

import Foundation

extension GiantBombClient {
    public enum Error: Swift.Error {
        case failedToFormURL
    }
}

public class GiantBombClient {
    private let apiKey: String
    private let host    = "www.giantbomb.com"
    private let session = URLSession.shared

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    private var baseRequestURL: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        let apiKeyItem = URLQueryItem(name: "api_key", value: apiKey)
        let formatItem = URLQueryItem(name: "format", value: "json")
        components.queryItems = [apiKeyItem, formatItem]
        return components
    }

    public func getGame(
        gameId: String,
        limit: Int? = nil,
        offset: Int? = nil,
        // platforms
        sort: GameSort? = nil,
        filter: [GameFilter] = [],
        fieldList: [GameField] = []
    ) async throws -> GameResponse {
        var components = baseRequestURL
        components.path = Endpoint.resource(resource: .game, id: gameId).path
        var queryItems = components.queryItems ?? []

        if let limit = limit {
            let limitItem = URLQueryItem(name: "limit", value: "\(limit)")
            queryItems.append(limitItem)
        }

        if let offset = offset {
            let offsetItem = URLQueryItem(name: "offset", value: "\(offset)")
            queryItems.append(offsetItem)
        }

        if let sort = sort {
            let sortItem = URLQueryItem(name: "sort", value: sort.queryValue)
            queryItems.append(sortItem)
        }

        if !filter.isEmpty {
            let filter = filter.map(\.queryValue).joined(separator: ",")
            let filterItem = URLQueryItem(name: "filter", value: filter)
            queryItems.append(filterItem)
        }

        if !fieldList.isEmpty {
            let fieldList = fieldList.map(\.rawValue).joined(separator: ",")
            let fieldListItem = URLQueryItem(name: "field_list", value: fieldList)
            queryItems.append(fieldListItem)
        }

        components.queryItems = queryItems

        guard let url = components.url else {
            throw Error.failedToFormURL
        }

        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(GameResponse.self, from: data)
    }

    public func search(
        query: String,
        page: Int? = nil,
        limit: Int? = nil,
        resources: [Resource] = [.game]
    ) async throws -> SearchResponse {
        var components = baseRequestURL
        components.path = Endpoint.search.path
        var queryItems = components.queryItems ?? []

        let queryItem = URLQueryItem(name: "query", value: query)
        queryItems.append(queryItem)
        queryItems.append(resources.queryItem)

        if let limit = limit {
            let limitItem = URLQueryItem(name: "limit", value: "\(limit)")
            queryItems.append(limitItem)
        }

        if let page = page {
            let pageItem = URLQueryItem(name: "page", value: "\(page)")
            queryItems.append(pageItem)
        }

        components.queryItems = queryItems

        guard let url = components.url else {
            throw Error.failedToFormURL
        }

        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(SearchResponse.self, from: data)
    }
}
