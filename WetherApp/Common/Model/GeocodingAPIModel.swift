//
//  GeocodingAPIModel.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

struct GeocodingAPIModelElement: Codable {
    let name: String
    let localNames: [String: String]?
    let lat, lon: Double
    let country, state: String

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}
