//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by iremt on 2.06.2023.
//

import Foundation

protocol UserService {
    func fetchUser (completion: @escaping(Result<User,Error>) -> Void)
}
