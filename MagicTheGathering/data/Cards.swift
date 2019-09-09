//
//  Cards.swift
//  MagicTheGathering
//
//  Created by Ivan Kramarchuk on 09/09/2019.
//  Copyright © 2019 i0532386223.me. All rights reserved.
//

import Foundation

// MARK: - Cards
struct Cards: Codable {
    let totalCards: Int
    let hasMore: Bool
    let object: String
    let data: [Datum]
    let nextPage: String?
    
    enum CodingKeys: String, CodingKey {
        case totalCards = "total_cards"
        case hasMore = "has_more"
        case object, data
        case nextPage = "next_page"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let datumSet: String?
    let cmc: Int?
    let games: [String]?
    let illustrationID: String?
    let multiverseIDS: [Int]?
    let manaCost: String?
    let rulingsURI: String?
    let collectorNumber: String?
    let textless: Bool?
    let id: String?
    let promo, nonfoil, booster: Bool?
    let colorIndicator: [String]?
    let setName: String?
    let lang: String?
    let setType: String?
    let setURI: String?
    let cardBackID: String?
    let foil, oversized: Bool?
    let imageUris: ImageUris?
    let artist: String?
    let storySpotlight: Bool?
    let scryfallURI: String?
    let layout: String?
    let object: DatumObject?
    let oracleID: String?
    let setSearchURI: String?
    let relatedUris: RelatedUris?
    let legalities: Legalities?
    let rarity: String?
    let tcgplayerID: Int?
    let digital: Bool?
    let power, toughness: String?
    let frame: String?
    let uri: String?
    let colorIdentity: [String]?
    let releasedAt, name: String?
    let scryfallSetURI: String?
    let artistIDS: [String]?
    let purchaseUris: PurchaseUris?
    let variation: Bool?
    let colors: [String]?
    let fullArt: Bool?
    let typeLine: String?
    let reprint: Bool?
    let borderColor: String?
    let printsSearchURI: String?
    let oracleText: String?
    let reserved: Bool?
    let prices: [String: String?]
    let highresImage: Bool?
    let edhrecRank: Int?
    let flavorText: String?
    let frameEffects: [String]?
    let frameEffect: String?
    let cardFaces: [CardFace]?
    let mtgoID, mtgoFoilID, arenaID: Int?
    let watermark: String?
    let preview: Preview?
    let promoTypes: [String]?
    let allParts: [AllPart]?
    
    enum CodingKeys: String, CodingKey {
        case datumSet = "set"
        case cmc, games
        case illustrationID = "illustration_id"
        case multiverseIDS = "multiverse_ids"
        case manaCost = "mana_cost"
        case rulingsURI = "rulings_uri"
        case collectorNumber = "collector_number"
        case textless, id, promo, nonfoil, booster
        case colorIndicator = "color_indicator"
        case setName = "set_name"
        case lang
        case setType = "set_type"
        case setURI = "set_uri"
        case cardBackID = "card_back_id"
        case foil, oversized
        case imageUris = "image_uris"
        case artist
        case storySpotlight = "story_spotlight"
        case scryfallURI = "scryfall_uri"
        case layout, object
        case oracleID = "oracle_id"
        case setSearchURI = "set_search_uri"
        case relatedUris = "related_uris"
        case legalities, rarity
        case tcgplayerID = "tcgplayer_id"
        case digital, power, toughness, frame, uri
        case colorIdentity = "color_identity"
        case releasedAt = "released_at"
        case name
        case scryfallSetURI = "scryfall_set_uri"
        case artistIDS = "artist_ids"
        case purchaseUris = "purchase_uris"
        case variation, colors
        case fullArt = "full_art"
        case typeLine = "type_line"
        case reprint
        case borderColor = "border_color"
        case printsSearchURI = "prints_search_uri"
        case oracleText = "oracle_text"
        case reserved, prices
        case highresImage = "highres_image"
        case edhrecRank = "edhrec_rank"
        case flavorText = "flavor_text"
        case frameEffects = "frame_effects"
        case frameEffect = "frame_effect"
        case cardFaces = "card_faces"
        case mtgoID = "mtgo_id"
        case mtgoFoilID = "mtgo_foil_id"
        case arenaID = "arena_id"
        case watermark, preview
        case promoTypes = "promo_types"
        case allParts = "all_parts"
    }
}

// MARK: - AllPart
struct AllPart: Codable {
    let name: String?
    let uri: String?
    let typeLine, id: String?
    let object: String?
    let component: String?
    
    enum CodingKeys: String, CodingKey {
        case name, uri
        case typeLine = "type_line"
        case id, object, component
    }
}

// MARK: - CardFace
struct CardFace: Codable {
    let toughness: String?
    let illustrationID, artistID: String?
    let cmc: Int?
    let colors: [String]?
    let flavorText: String?
    let manaCost, name: String?
    let power: String?
    let imageUris: ImageUris?
    let typeLine, artist, oracleText: String?
    let object: String?
    let colorIndicator: [String]?
    
    enum CodingKeys: String, CodingKey {
        case toughness
        case illustrationID = "illustration_id"
        case artistID = "artist_id"
        case cmc, colors
        case flavorText = "flavor_text"
        case manaCost = "mana_cost"
        case name, power
        case imageUris = "image_uris"
        case typeLine = "type_line"
        case artist
        case oracleText = "oracle_text"
        case object
        case colorIndicator = "color_indicator"
    }
}

// MARK: - ImageUris
struct ImageUris: Codable {
    let normal: String?
    let png: String?
    let artCrop, small, large, borderCrop: String?
    
    enum CodingKeys: String, CodingKey {
        case normal, png
        case artCrop = "art_crop"
        case small, large
        case borderCrop = "border_crop"
    }
}

// MARK: - Legalities
struct Legalities: Codable {
    let modern, penny, future, oldschool: String?
    let legacy, brawl, standard, vintage: String?
    let duel, commander, pauper: String?
}

enum DatumObject: String, Codable {
    case card = "card"
}

// MARK: - Preview
struct Preview: Codable {
    let sourceURI: String?
    let previewedAt, source: String?
    
    enum CodingKeys: String, CodingKey {
        case sourceURI = "source_uri"
        case previewedAt = "previewed_at"
        case source
    }
}

// MARK: - PurchaseUris
struct PurchaseUris: Codable {
    let cardhoarder, cardmarket, tcgplayer: String?
}

// MARK: - RelatedUris
struct RelatedUris: Codable {
    let gatherer: String?
    let tcgplayerDecks, edhrec, mtgtop8: String?
    
    enum CodingKeys: String, CodingKey {
        case gatherer
        case tcgplayerDecks = "tcgplayer_decks"
        case edhrec, mtgtop8
    }
}



