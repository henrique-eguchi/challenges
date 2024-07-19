//
//  FoodTruckListMapper.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 11/02/24.
//

import Foundation

final class FoodTruckListMapper {
    private typealias RemoteFoodTrucksModel = [RemoteFoodTruckModel]

    private struct RemoteFoodTruckModel: Decodable {
        let applicant: String
        let location: String
        let locationDesc: String?
        let startTime: String
        let endTime: String

        enum CodingKeys: String, CodingKey {
            case applicant
            case location
            case locationDesc = "locationdesc"
            case startTime = "starttime"
            case endTime = "endtime"
        }

        var foodTruck: FoodTruck {
            FoodTruck(
                name: applicant,
                address: location,
                description: locationDesc ?? "",
                startTime: startTime,
                endTime: endTime
            )
        }
    }

    private static var OK_200: Int { return 200 }

    static func map(_ data: Data, from response: HTTPURLResponse) -> FoodTruckListLoader.Result {
        guard response.statusCode == OK_200,
              let foodTruckList = try? JSONDecoder().decode(RemoteFoodTrucksModel.self, from: data) else {
            return .failure(RemoteFoodTruckListLoader.Error.invalidData)
        }
        return .success(foodTruckList.map { $0.foodTruck })
    }
}
