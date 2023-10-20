import Foundation
class TestAssertions {
    func assertEquals(expected: String, actual: String, message: String) {
        if expected == actual {
            print("PASSED" + message)
        }
        else {
            print("FAILED" + message)
        }
    }
    func assertEquals(expected: Int, actual: Int, message: String) {
        if expected == actual {
            print("PASSED" + message)
        }
        else {
            print("FAILED" + message)
        }
    }
    func assertEquals(expected: Array<String>, actual: Array<String>, message: String) {
        if expected == actual {
            print("PASSED" + message)
        }
        else {
            print("FAILED" + message)
        }
    }
    func assertEquals(expected: Bool, actual: Bool, message: String) {
        if expected == actual {
            print("PASSED" + message)
        }
        else {
            print("FAILED" + message)
        }
    }
}
