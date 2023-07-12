//
//  LoginViewModelTests.swift
//  crypto-cubeTests
//
//  Created by Maciej Dubowik on 12/07/2023.
//

import XCTest
@testable import crypto_cube

final class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!

    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
    }

    func testUserInitializedCorrectly() {
        XCTAssertEqual(viewModel.user.email, "")
        XCTAssertEqual(viewModel.user.password, "")
    }

    func testMessageInitializedEmpty() {
        XCTAssertTrue(viewModel.message.isEmpty)
    }

    func testIsLoggedInInitializedAsFalse() {
        XCTAssertFalse(viewModel.isLoggedIn)
    }

}
