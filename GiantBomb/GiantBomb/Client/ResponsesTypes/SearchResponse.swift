// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

extension GiantBombClient {
    public struct SearchResponse: Codable {
        public var offset, statusCode, numberOfPageResults, limit: Int?
        public var numberOfTotalResults: Int?
        public var results: [Result]?
        public var version, error: String?

        internal enum CodingKeys: String, CodingKey {
            case offset
            case statusCode = "status_code"
            case numberOfPageResults = "number_of_page_results"
            case limit
            case numberOfTotalResults = "number_of_total_results"
            case results, version, error
        }
    }

    // MARK: - Result
    public struct Result: Codable {
        public var resultDescription: String?
//        public var originalGameRating: [OriginalGameRating]?
//        public var guid: String?
//        public var originalReleaseDate: String?
        public var image: Image?
//        public var expectedReleaseQuarter: String?
//        public var deck: String?
//        public var imageTags: [ImageTag]?
//        public var expectedReleaseYear, expectedReleaseDay: String?
//        public var numberOfUserReviews: Int?
//        public var apiDetailURL: String?
        public var name: String?
//        public var aliases: String?
//        public var dateLastUpdated: String?
//        public var resourceType: ResourceType?
        public var id: Int?
//        public var siteDetailURL: String?
//        public var expectedReleaseMonth: String?
//        public var platforms: [Platform]?
//        public var dateAdded: String?

        internal enum CodingKeys: String, CodingKey {
            case resultDescription = "description"
//            case originalGameRating = "original_game_rating"
//            case guid
//            case originalReleaseDate = "original_release_date"
            case image
//            case expectedReleaseQuarter = "expected_release_quarter"
//            case deck
//            case imageTags = "image_tags"
//            case expectedReleaseYear = "expected_release_year"
//            case expectedReleaseDay = "expected_release_day"
//            case numberOfUserReviews = "number_of_user_reviews"
//            case apiDetailURL = "api_detail_url"
            case name
//            case aliases
//            case dateLastUpdated = "date_last_updated"
//            case resourceType = "resource_type"
            case id
//            case siteDetailURL = "site_detail_url"
//            case expectedReleaseMonth = "expected_release_month"
//            case platforms
//            case dateAdded = "date_added"
        }
    }

    public enum ImageTags: String, Codable {
        case allImages = "All Images"
        case allImagesBoxArt = "All Images,Box Art"
    }

    // MARK: - OriginalGameRating
    public struct OriginalGameRating: Codable {
        public var id: Int?
        public var apiDetailURL: String?
        public var name: String?

        internal enum CodingKeys: String, CodingKey {
            case id
            case apiDetailURL = "api_detail_url"
            case name
        }
    }

    // MARK: - Platform
    public struct Platform: Codable {
        public var abbreviation: String?
        public var id: Int?
        public var name: String?
        public var apiDetailURL, siteDetailURL: String?

        internal enum CodingKeys: String, CodingKey {
            case abbreviation, id, name
            case apiDetailURL = "api_detail_url"
            case siteDetailURL = "site_detail_url"
        }
    }

    public enum ResourceType: String, Codable {
        case game = "game"
    }
}
