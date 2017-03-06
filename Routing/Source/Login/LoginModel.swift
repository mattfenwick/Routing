//
//  LoginModel.swift
//  Routing
//
//  Created by Matt Fenwick on 3/4/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation

enum LoginResult {
    case failure(error: Error)
    case success(username: String)
}

struct LoginCredentials {
    let username: String
    let password: String
}
