import XCTest
@testable import Plugin

// MARK: - Mock Provider

class MockGuidedAccessProvider: GuidedAccessProvider {
    var guidedAccessEnabled = false
    var shouldSucceed = true

    func requestGuidedAccessSession(enabled: Bool) async -> Bool {
        guard shouldSucceed else { return false }
        guidedAccessEnabled = enabled
        return true
    }

    var isGuidedAccessEnabled: Bool {
        guidedAccessEnabled
    }
}

// MARK: - Tests

class AsamTests: XCTestCase {

    private var mockProvider: MockGuidedAccessProvider!
    private var asam: Asam!

    override func setUp() {
        super.setUp()
        mockProvider = MockGuidedAccessProvider()
        asam = Asam(provider: mockProvider)
    }

    override func tearDown() {
        asam = nil
        mockProvider = nil
        super.tearDown()
    }

    // MARK: - setASAM

    func testSetASAMEnable() {
        let expectation = expectation(description: "setASAM enable completes")

        asam.setASAM(true) { success in
            XCTAssertTrue(success, "setASAM(true) should succeed")
            XCTAssertTrue(self.mockProvider.guidedAccessEnabled, "Guided Access should be enabled")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    func testSetASAMDisable() {
        let expectation = expectation(description: "setASAM disable completes")
        mockProvider.guidedAccessEnabled = true

        asam.setASAM(false) { success in
            XCTAssertTrue(success, "setASAM(false) should succeed")
            XCTAssertFalse(self.mockProvider.guidedAccessEnabled, "Guided Access should be disabled")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    func testSetASAMFailure() {
        let expectation = expectation(description: "setASAM failure completes")
        mockProvider.shouldSucceed = false

        asam.setASAM(true) { success in
            XCTAssertFalse(success, "setASAM should report failure")
            XCTAssertFalse(self.mockProvider.guidedAccessEnabled, "Guided Access should remain disabled on failure")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    // MARK: - enableASAM

    func testEnableASAM() {
        let expectation = expectation(description: "enableASAM completes")

        asam.enableASAM { success in
            XCTAssertTrue(success, "enableASAM should succeed")
            XCTAssertTrue(self.mockProvider.guidedAccessEnabled, "Guided Access should be enabled")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    func testEnableASAMFailure() {
        let expectation = expectation(description: "enableASAM failure completes")
        mockProvider.shouldSucceed = false

        asam.enableASAM { success in
            XCTAssertFalse(success, "enableASAM should report failure")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    // MARK: - disableASAM

    func testDisableASAM() {
        let expectation = expectation(description: "disableASAM completes")
        mockProvider.guidedAccessEnabled = true

        asam.disableASAM { success in
            XCTAssertTrue(success, "disableASAM should succeed")
            XCTAssertFalse(self.mockProvider.guidedAccessEnabled, "Guided Access should be disabled")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    func testDisableASAMWhenAlreadyDisabled() {
        let expectation = expectation(description: "disableASAM when already disabled completes")

        asam.disableASAM { success in
            XCTAssertTrue(success, "disableASAM should succeed even if already disabled")
            XCTAssertFalse(self.mockProvider.guidedAccessEnabled)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    // MARK: - isASAMEnabled

    func testIsASAMEnabledWhenEnabled() {
        let expectation = expectation(description: "isASAMEnabled returns true")
        mockProvider.guidedAccessEnabled = true

        asam.isASAMEnabled { enabled in
            XCTAssertTrue(enabled, "Should report ASAM as enabled")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    func testIsASAMEnabledWhenDisabled() {
        let expectation = expectation(description: "isASAMEnabled returns false")
        mockProvider.guidedAccessEnabled = false

        asam.isASAMEnabled { enabled in
            XCTAssertFalse(enabled, "Should report ASAM as disabled")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }

    // MARK: - Toggle scenario

    func testToggleASAM() {
        let expectation = expectation(description: "Toggle ASAM completes")

        asam.enableASAM { enableSuccess in
            XCTAssertTrue(enableSuccess)
            self.asam.isASAMEnabled { enabledAfterEnable in
                XCTAssertTrue(enabledAfterEnable, "Should be enabled after enable")

                self.asam.disableASAM { disableSuccess in
                    XCTAssertTrue(disableSuccess)
                    self.asam.isASAMEnabled { enabledAfterDisable in
                        XCTAssertFalse(enabledAfterDisable, "Should be disabled after disable")
                        expectation.fulfill()
                    }
                }
            }
        }

        waitForExpectations(timeout: 5)
    }
}
