//
//  LoginPresenter.swift
//  Routing
//
//  Created by Matt Fenwick on 3/4/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import RxSwift

class LoginPresenter {

    let loginResult: Observable<LoginResult>

    init(interactor: LoginInteractor,
         username: Observable<String>,
         password: Observable<String>,
         didTapLogin: Observable<Void>) {
        let credentials = Observable.combineLatest(
            username,
            password,
            resultSelector: LoginCredentials.init)
        loginResult = didTapLogin
            .withLatestFrom(credentials)
            .flatMap { (credentials: LoginCredentials) -> Observable<LoginResult> in
                interactor.login(credentials: credentials)
                    .map { _ in LoginResult.success(username: credentials.username) }
                    .catchError { error in Observable.just(LoginResult.failure(error: error)) }
            }
            .shareReplay(1)
    }
}
