//
//  ServiceModel.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import Foundation

struct ServiceModel: Identifiable {
    var id: Int
    var name: String
    var thumbnail: String
    var details: ServiceDetailsModel
}
