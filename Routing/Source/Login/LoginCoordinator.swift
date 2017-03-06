//
//  LoginCoordinator.swift
//  Routing
//
//  Created by Matt Fenwick on 3/4/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import RxSwift

class LoginCoordinator {

    let viewController: LoginViewController

    private let presenter: LoginPresenter

    // MARK: output

    let didTapCancel: Observable<Void>
    let didLogin: Observable<String> // username

    // MARK: boilerplate

    private let disposeBag = DisposeBag()

    private let errorsSubject = PublishSubject<String>()

    // MARK: init

    init(interactor: LoginInteractor) {
        viewController = LoginViewController()
        presenter = LoginPresenter(
            interactor: interactor,
            username: viewController.username,
            password: viewController.password,
            didTapLogin: viewController.didTapLogin)

        didTapCancel = viewController.didTapCancel

        didLogin = presenter.loginResult
            .map { (result: LoginResult) -> String? in
                switch result {
                case .failure: return nil
                case .success(let username): return username
                }
            }
            .filterNil()
    }
}
