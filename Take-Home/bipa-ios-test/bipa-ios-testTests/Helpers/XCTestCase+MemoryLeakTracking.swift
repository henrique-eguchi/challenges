//
//  XCTestCase+MemoryLeakTracking.swift
//  bipa-ios-testTests
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
