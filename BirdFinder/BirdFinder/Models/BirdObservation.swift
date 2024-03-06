//
//  BirdObservationResponse.swift
//  BirdFinder
//
//  Created by Thomas Cowern on 3/5/24.
//

import Foundation

// MARK: - BirdObservation
struct BirdObservation: Codable, Hashable {
    let speciesCode: String
    let comName: String
    let sciName: String
    let locId: String
    let locName: String
    let obsDt: String
    let howMany: Int
    let lat, lng: Double
    let obsValid: Bool
    let obsReviewed: Bool
    let locationPrivate: Bool
    let subId: String
    
    
//    enum CodingKeys: String, CodingKey {
//        case speciesCode
//        case comName = "commonName"
//        case sciName = "scientificName"
//        case locID = "locationId"
//        case locName = "locationName"
//        case obsDt = "observationDate"
//        case howMany = "numberObserved"
//        case lat = "latitude"
//        case lng = "longitude"
//        case obsValid = "observatioValid"
//        case obsReviewed = "observationReviewed"
//        case locationPrivate
//        case subID = "subscriberId"
//    }
}

struct BirdObservationResponse: Codable {
    let response: [BirdObservation]
}
