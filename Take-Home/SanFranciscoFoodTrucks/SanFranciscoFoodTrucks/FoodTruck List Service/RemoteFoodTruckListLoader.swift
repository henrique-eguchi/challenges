//
//  FoodTruckListService.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 11/02/24.
//

import Foundation

public final class RemoteFoodTruckListLoader: FoodTruckListLoader {
    private let url: URL
    private let client: HTTPClient

    public enum Error: Swift.Error {
        case invalidUrl
        case connectivity
        case invalidData
    }

    public init(
        url: URL,
        client: HTTPClient
    ) {
        self.url = url
        self.client = client
    }

    private func makeFoodTrucksURL(for queryString: String) -> URL? {
        URL(string: "\(url)?\(queryString)")
    }

    private func makeCurrentlyOpenedFoodTrucksQueryString(
        _ page: Int,
        _ pageSize: Int
    ) -> String {
        let date = Date()
        let currentTime = date.current24HourTimeString
        let currentIntDay = date.integerBasedDayOfWeek
        let offset = PaginationHelper.getOffsetBy(page, pageSize)

        return "$where=start24<='\(currentTime)' AND end24>='\(currentTime)'&$select=applicant,location,locationdesc,starttime,endtime&$limit=\(pageSize)&$offset=\(offset)&dayorder=\(currentIntDay)"
    }

    public func getCurrentlyOpenedFoodTrucks(page: Int, pageSize: Int, completion: @escaping (FoodTruckListLoader.Result) -> Void) {
        let queryString = makeCurrentlyOpenedFoodTrucksQueryString(page, pageSize)

        guard let url = makeFoodTrucksURL(for: queryString) else {
            completion(.failure(Error.invalidUrl))
            return
        }
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }

            switch result {
            case let .success((data, response)):
                completion(FoodTruckListMapper.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
}
