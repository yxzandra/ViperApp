//
//  CategoryResponse.swift
//  ViperApp
//
//  Created by Yxzandra Cordero on 14-12-20.
//

import Foundation

// MARK: - CategoryResponse
struct CategoryResponse: Codable {
    var id: Int
    var links: Links

    enum CodingKeys: String, CodingKey {
        case id
        case links = "_links"
    }

    // MARK: - Links
    struct Links: Codable {
        var linksSelf: [SelfElement]

        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
        }
    }

    // MARK: - SelfElement
    struct SelfElement: Codable {
        var href: String
    }
}
