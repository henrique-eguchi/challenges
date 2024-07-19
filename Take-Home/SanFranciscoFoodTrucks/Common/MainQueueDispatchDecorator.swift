//
//  MainQueueDispatchDecorator.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 12/02/24.
//

import Foundation

public final class MainQueueDispatchDecorator<T> {
    public let decoratee: T

    public init(decoratee: T) {
        self.decoratee = decoratee
    }

    public func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async(execute: completion)
        }

        completion()
    }
}
