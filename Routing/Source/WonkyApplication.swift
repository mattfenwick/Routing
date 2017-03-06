//
//  WonkyApplication.swift
//  Routing
//
//  Created by Matt Fenwick on 3/6/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class WonkyApplication: ListSearchInteractor, LoginInteractor {

//    let viewController: UIViewController

    lazy private (set) var viewController: UIViewController = {
        return self.listSearchFlowController.viewController
    }()

    private lazy var listSearchFlowController: ListSearchFlowController = {
        return ListSearchFlowController(interactor: self)
    }()

    private var authToken: String? = nil

    init() {
//        listSearchFlowController = ListSearchFlowController(interactor: self)
//        viewController = listSearchFlowController.viewController
    }

    // MARK: list search interactor

    func isAuthenticated() -> Bool {
        return authToken != nil
    }

    func login() -> JobSearchLoginProtocol {
        return LoginCoordinator(interactor: self)
    }

    // MARK: login interactor

    func login(credentials: LoginCredentials) -> Observable<Void> {
        if (credentials.username.characters.count > 5) {
            authToken = credentials.username
            return Observable.just(Void())
        } else {
            return Observable.error(WonkyApplicationError.loginError)
        }
    }
}

enum WonkyApplicationError: Error {
    case loginError
}

extension LoginCoordinator: JobSearchLoginProtocol {
    var loginViewController: UIViewController {
        return self.viewController
    }
    var didCancelLogin: Observable<Void> {
        return self.didTapCancel
    }
    var loginDidSucceed: Observable<String> {
        return self.didLogin
    }
    var loginDidFail: Observable<Void> {
        return Observable.empty()
    }
}
