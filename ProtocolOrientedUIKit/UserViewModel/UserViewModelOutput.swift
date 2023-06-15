//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by iremt on 15.06.2023.
//

import Foundation

protocol UserViewModelOutput : AnyObject{
    func updateView(name: String, email: String, userName: String)
}
