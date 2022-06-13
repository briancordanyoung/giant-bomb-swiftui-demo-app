import Foundation

// MARK: - Game Response

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - GameResponse
extension GiantBombClient {
    public struct GameResponse: Codable {
        public var offset, statusCode, numberOfPageResults, limit: Int?
        public var numberOfTotalResults: Int?
        public var results: Results?
        public var version, error: String?

        enum CodingKeys: String, CodingKey {
            case offset
            case statusCode = "status_code"
            case numberOfPageResults = "number_of_page_results"
            case limit
            case numberOfTotalResults = "number_of_total_results"
            case results, version, error
        }
    }

    // MARK: - Results
    public struct Results: Codable {
        public var expectedReleaseYear: JSONNull?
        public var imageTags: [ImageTag]?
        public var firstAppearanceLocations: [Character]?
        public var id: Int?
        public var franchises: [Character]?
        public var deck: String?
        public var people, platforms, genres: [Character]?
        public var dateLastUpdated, resultsDescription, aliases: String?
        public var expectedReleaseQuarter: JSONNull?
        public var originalReleaseDate: String?
        public var killedCharacters: JSONNull?
        public var firstAppearanceConcepts: [Character]?
        public var image: Image?
        public var locations, publishers: [Character]?
        public var name: String?
        public var concepts, firstAppearancePeople, originalGameRating, similarGames: [Character]?
        public var themes: [Character]?
        public var numberOfUserReviews: Int?
        public var images: [ImageElement]?
        public var characters: [Character]?
        public var dateAdded: String?
        public var videos: [JSONAny]?
        public var expectedReleaseMonth: JSONNull?
        public var siteDetailURL: String?
        public var developers, firstAppearanceCharacters: [Character]?
        public var expectedReleaseDay: JSONNull?
        public var releases, firstAppearanceObjects, objects: [Character]?
        public var guid: String?
        public var apiDetailURL: String?

        enum CodingKeys: String, CodingKey {
            case expectedReleaseYear = "expected_release_year"
            case imageTags = "image_tags"
            case firstAppearanceLocations = "first_appearance_locations"
            case id, franchises, deck, people, platforms, genres
            case dateLastUpdated = "date_last_updated"
            case resultsDescription = "description"
            case aliases
            case expectedReleaseQuarter = "expected_release_quarter"
            case originalReleaseDate = "original_release_date"
            case killedCharacters = "killed_characters"
            case firstAppearanceConcepts = "first_appearance_concepts"
            case image, locations, publishers, name, concepts
            case firstAppearancePeople = "first_appearance_people"
            case originalGameRating = "original_game_rating"
            case similarGames = "similar_games"
            case themes
            case numberOfUserReviews = "number_of_user_reviews"
            case images, characters
            case dateAdded = "date_added"
            case videos
            case expectedReleaseMonth = "expected_release_month"
            case siteDetailURL = "site_detail_url"
            case developers
            case firstAppearanceCharacters = "first_appearance_characters"
            case expectedReleaseDay = "expected_release_day"
            case releases
            case firstAppearanceObjects = "first_appearance_objects"
            case objects, guid
            case apiDetailURL = "api_detail_url"
        }
    }

    // MARK: - Character
    public struct Character: Codable {
        public var id: Int?
        public var name: String?
        public var apiDetailURL, siteDetailURL: String?
        public var abbreviation: String?

        enum CodingKeys: String, CodingKey {
            case id, name
            case apiDetailURL = "api_detail_url"
            case siteDetailURL = "site_detail_url"
            case abbreviation
        }
    }

    // MARK: - ImageElement
    public struct ImageElement: Codable {
        public var superURL, screenURL, tinyURL, iconURL: String?
        public var smallURL, thumbURL, mediumURL, original: String?
        public var tags: String?

        enum CodingKeys: String, CodingKey {
            case superURL = "super_url"
            case screenURL = "screen_url"
            case tinyURL = "tiny_url"
            case iconURL = "icon_url"
            case smallURL = "small_url"
            case thumbURL = "thumb_url"
            case mediumURL = "medium_url"
            case original, tags
        }
    }
}
