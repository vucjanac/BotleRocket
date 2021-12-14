//
//  RestaurantModel.swift
//  BottleRocket
//
//  Created by Aleksandar Stojanovic on 12/10/21.
//

import Foundation

struct Restaurants: Codable {
    let restaurants: [RestaurantModel]
}

struct RestaurantModel: Codable {
    let name: String
    let backgroundImageURL: String?
    let category: String
    let contact: RestaurantContact?
    let location: RestaurantLocation
}

struct RestaurantContact: Codable {
    let phone: String
    let formattedPhone: String
    let twitter: String?
    let facebook: String?
    let facebookUsername: String?
    let facebookName: String?
}
struct RestaurantLocation: Codable {
    let address: String
    let crossStreet: String?
    let lat: Double
    let lng: Double
    let postalCode: String?
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
}
