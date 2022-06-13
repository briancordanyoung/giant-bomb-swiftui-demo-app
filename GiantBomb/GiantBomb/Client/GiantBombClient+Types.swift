//
//  GiantBombClient+Types.swift
//  GiantBomb
//
//  Created by Brian Young on 6/12/22.
//

import Foundation

extension GiantBombClient {
    public enum GameSort {
        case ascending(GameSortField)
        case descending(GameSortField)

        internal var queryValue: String {
            switch self {
            case .ascending(let field): return "\(field):asc"
            case .descending(let field): return "\(field):desc"
            }
        }
    }
}

extension GiantBombClient {
    // TODO: Add Date filtering
    // TODO: Protect from spaces and other values? (or will URLComponents encode it properly?)
    public struct GameFilter {
        internal var field: GameFilterField
        internal var value: String

        internal var queryValue: String { "\(field):\(value)" }
    }
}

extension GiantBombClient {
    public enum GameField: String {
        case aliases                = "aliases"
        case apiDetailURL           = "api_detail_url"
        case dateAdded              = "date_added"
        case dateLastUpdated        = "date_last_updated"
        case deck                   = "deck"
        case description            = "description"
        case expectedReleaseDay     = "expected_release_day"
        case expectedReleaseMonth   = "expected_release_month"
        case expectedReleaseQuarter = "expected_release_quarter"
        case expectedReleaseYear    = "expected_release_year"
        case guid                   = "guid"
        case id                     = "id"
        case image                  = "image"
        case imageTags              = "image_tags"
        case name                   = "name"
        case numberOfUserReviews    = "number_of_user_reviews"
        case originalGameRating     = "original_game_rating"
        case originalReleaseDate    = "original_release_date"
        case platforms              = "platforms"
        case siteDetailURL          = "site_detail_url"
    }
}

extension GiantBombClient {
    public enum GameSortField: String {
        case dateAdded              = "date_added"
        case dateLastUpdated        = "date_last_updated"
        case id                     = "id"
        case name                   = "name"
        case numberOfUserReviews    = "number_of_user_reviews"
        case originalGameRating     = "original_game_rating"
        case originalReleaseDate    = "original_release_date"
    }
}

extension GiantBombClient {
    public enum GameFilterField: String {
        case aliases                = "aliases"
        case dateAdded              = "date_added"
        case dateLastUpdated        = "date_last_updated"
        case expectedReleaseMonth   = "expected_release_month"
        case expectedReleaseQuarter = "expected_release_quarter"
        case expectedReleaseYear    = "expected_release_year"
        case id                     = "id"
        case name                   = "name"
        case numberOfUserReviews    = "number_of_user_reviews"
        case originalReleaseDate    = "original_release_date"
        case platforms              = "platforms"
    }
}

extension GiantBombClient {
    public enum Resource: String {
        case game
        case franchise
        case character
        case concept
        case object
        case location
        case person
        case company
        case video
    }
}

extension Array where Element == GiantBombClient.Resource {
    internal var queryItem: URLQueryItem {
        let resourceList = map(\.rawValue).joined(separator: ",")
        return URLQueryItem(name: "resources", value: resourceList)
    }
}

extension GiantBombClient {
    internal enum Endpoint {
        case resource(resource: Resource, id: String)
        case search

        internal var path: String {
            switch self {
            case .resource(resource: let resource, id: let id): return "/api/\(resource)/\(id)"
            case .search: return "/api/search"
            }
        }
    }
}
