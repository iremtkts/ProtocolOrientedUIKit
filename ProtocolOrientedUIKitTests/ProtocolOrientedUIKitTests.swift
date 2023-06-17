//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by iremt on 2.06.2023.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    private var userViewModel: UserViewModel!
    private var userService: MockUserService!
    private var output: MockUserViewModelOutput!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        userService = nil
        userViewModel = nil
    }
    
    func testUpdateView_whenAPISuccess_showEmailNameUserName() throws {
       let mockUser = User(id: 1, name: "İrem", username: "iremt", email: "i@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        userService.fetchUserMockResult = .success(mockUser)
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "iremt")
    }
    
    func testUpdateView_whenAPIFailure_showNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "No user")
    }

  

}

class MockUserService: UserService {
    var fetchUserMockResult: Result<ProtocolOrientedUIKit.User, Error>?
    
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult{
            completion(result)
        }
    }
    
    
}

class MockUserViewModelOutput: UserViewModelOutput {
    var updateViewArray : [(name: String, email: String, userName: String)] = []
    
    func updateView(name: String, email: String, userName: String) {
        updateView(name: name, email: email, userName: userName)
    }
    
    

}
