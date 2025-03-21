//
//  country.swift
//  wrkSpot
//
//  Created by Tarun Upadhyay on 21/03/25.
//

import Foundation
struct country : Codable {
    let abbreviation : String?
    let capital : String?
    let currency : String?
    let name : String?
    let phone : String?
    let population : Int?
    let media : Media?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case abbreviation = "abbreviation"
        case capital = "capital"
        case currency = "currency"
        case name = "name"
        case phone = "phone"
        case population = "population"
        case media = "media"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        abbreviation = try values.decodeIfPresent(String.self, forKey: .abbreviation)
        capital = try values.decodeIfPresent(String.self, forKey: .capital)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        population = try values.decodeIfPresent(Int.self, forKey: .population)
        media = try values.decodeIfPresent(Media.self, forKey: .media)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }

}


struct Media : Codable {
    let flag : String?
    let emblem : String?
    let orthographic : String?

    enum CodingKeys: String, CodingKey {

        case flag = "flag"
        case emblem = "emblem"
        case orthographic = "orthographic"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flag = try values.decodeIfPresent(String.self, forKey: .flag)
        emblem = try values.decodeIfPresent(String.self, forKey: .emblem)
        orthographic = try values.decodeIfPresent(String.self, forKey: .orthographic)
    }

}
