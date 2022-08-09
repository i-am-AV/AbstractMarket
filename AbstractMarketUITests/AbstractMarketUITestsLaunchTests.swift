//
//  AbstractMarketUITestsLaunchTests.swift
//  AbstractMarketUITests
//
//  Created by Alex Vasilyev on 08.08.2022.
//

import XCTest

class AbstractMarketUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
