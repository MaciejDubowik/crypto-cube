//
//  crypto_cubeTests.swift
//  crypto-cubeTests
//
//  Created by Maciej Dubowik on 25/06/2023.
//

import XCTest
@testable import crypto_cube

final class RegistrationViewModelTests: XCTestCase {

    var viewModel: RegistrationViewModel!

    override func setUpWithError() throws {
        viewModel = RegistrationViewModel()
    }

    func testValidateAndRegister_EmptyName() {
        viewModel.user.name = ""
        viewModel.validateAndRegister()
        XCTAssertEqual(viewModel.message, "Name is empty.")
    }

    func testValidateAndRegister_PasswordMismatch() {
        viewModel.user.name = "Test User"
        viewModel.user.password = "password"
        viewModel.repeatedPassword = "differentPassword"
        viewModel.validateAndRegister()
        XCTAssertEqual(viewModel.message, "Passwords do not match.")
    }

}
