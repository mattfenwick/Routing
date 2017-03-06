//
//  LoginInteractor.swift
//  Routing
//
//  Created by Matt Fenwick on 3/4/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginInteractor {
    // TODO success = Void event, error = error event?
    func login(credentials: LoginCredentials) -> Observable<Void>
}
