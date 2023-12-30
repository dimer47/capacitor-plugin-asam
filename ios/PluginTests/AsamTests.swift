import XCTest
@testable import Plugin

class AsamTests: XCTestCase {

    func testSetASAM() {
        // This is an example of a functional test case for a plugin.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let implementation = Asam()
        let enable = true
        let completion: (Bool) -> Void = { success in
            XCTAssertTrue(success)
        }

        implementation.setASAM(enable, completion: completion)
    }

    func testEnableASAM() {
        let implementation = Asam()
        let completion: (Bool) -> Void = { success in
            XCTAssertTrue(success)
        }

        implementation.enableASAM(completion: completion)
    }

    func testDisableASAM() {
        let implementation = Asam()
        let completion: (Bool) -> Void = { success in
            XCTAssertTrue(success)
        }

        implementation.disableASAM(completion: completion)
    }

    func testIsASAMEnabled() {
        let implementation = Asam()
        implementation.enableASAM(completion: { success in
            let enabled = implementation.isASAMEnabled { enabled in
                XCTAssertEqual(enabled, success)
            }
        })
    }

    func testIsASAMEnabledFalse() {
        let implementation = Asam()
        implementation.disableASAM(completion: { success in
            let enabled = implementation.isASAMEnabled { enabled in
                XCTAssertEqual(enabled, success)
            }
        })
    }
}
