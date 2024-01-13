//
//  ServicesViewModel.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import Foundation

final class ServicesViewModel: ObservableObject {
    @Published var services: [ServiceModel] = [
        ServiceModel(id: 1, name: "Cleaning", thumbnail: "Service1", details: ServiceDetailsModel(image: "Service1", description: "Cleaning description")),
        ServiceModel(id: 2, name: "Handyman", thumbnail: "Service2", details: ServiceDetailsModel(image: "Service2", description: "Handyman description")),
        ServiceModel(id: 3, name: "Package Delivery", thumbnail: "Service3", details: ServiceDetailsModel(image: "Service3", description: "Package Deliver description")),
        ServiceModel(id: 4, name: "Cleaning", thumbnail: "Service1", details: ServiceDetailsModel(image: "Service1", description: "Cleaning description")),
        ServiceModel(id: 5, name: "Handyman", thumbnail: "Service2", details: ServiceDetailsModel(image: "Service2", description: "Handyman description")),
    ]
}
