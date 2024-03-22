//
//  Model.swift
//  Sample Project
//
//  Created by Dhawal Mahajan on 21/03/24.
//

import Foundation
// MARK: - Welcome
struct Model: Codable {
    let status, copyright: String
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let docs: [Doc]
    let meta: Meta
}

// MARK: - Doc
struct Doc: Codable {
    let abstract: String
    let webURL: String
    let multimedia: [Multimedia]
    let headline: Headline
  

    enum CodingKeys: String, CodingKey {
        case abstract
        case webURL = "web_url"
        case multimedia
        case headline
       
    }
}


// MARK: - Headline
struct Headline: Codable {
    let main: String
    let kicker: String?
    let contentKicker: String?
    let printHeadline: String?
    let name, seo, sub: String?

    enum CodingKeys: String, CodingKey {
        case main, kicker
        case contentKicker = "content_kicker"
        case printHeadline = "print_headline"
        case name, seo, sub
    }
}


enum Major: String, Codable {
    case n = "N"
}

enum Name: String, Codable {
    case glocations = "glocations"
    case organizations = "organizations"
    case persons = "persons"
    case subject = "subject"
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let rank: Int
    let subtype: String
    let caption, credit: String?
    let type: TypeEnum
    let url: String
    let height, width: Int
    let legacy: Legacy
    let subType, cropName: String

    enum CodingKeys: String, CodingKey {
        case rank, subtype, caption, credit, type, url, height, width, legacy, subType
        case cropName = "crop_name"
    }
}


// MARK: - Legacy
struct Legacy: Codable {
    let xlarge: String?
    let xlargewidth, xlargeheight: Int?
    let thumbnail: String?
    let thumbnailwidth, thumbnailheight, widewidth, wideheight: Int?
    let wide: String?
}

enum TypeEnum: String, Codable {
    case image = "image"
}

enum NewsDesk: String, Codable {
    case politics = "Politics"
}

enum SectionName: String, Codable {
    case uS = "U.S."
}

enum Source: String, Codable {
    case theNewYorkTimes = "The New York Times"
}

enum TypeOfMaterial: String, Codable {
    case news = "News"
}

// MARK: - Meta
struct Meta: Codable {
    let hits, offset, time: Int
}
