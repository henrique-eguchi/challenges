import UIKit

// MARK: - Zip Output

zip([1,2,3,4,5,6,7,8],["a", "b", "c"])
// Result: [(1: "a"), (2, "b"), (3, "c")]


// MARK: - Extension & protocol conformance Output

protocol Foo {
    var moo: String { get}
}

extension Foo {
    var moo: String {
        return "Moo"
    }

    func test() {
        print("Foo \(moo)")
    }
}

class Bar: Foo {
    var moo: String {
        return "Mooo"
    }

    func test() {
        print("Bar \(moo)")
    }
}

let b: Foo = Bar()
b.test() // Result: "Foo Mooo" - test from Foo is called

