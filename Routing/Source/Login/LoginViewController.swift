//
//  LoginViewController.swift
//  Routing
//
//  Created by Matt Fenwick on 3/4/17.
//  Copyright © 2017 mf. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    // MARK: boilerplate

    private let usernameSubject = PublishSubject<String>()
    private let passwordSubject = PublishSubject<String>()
    private let didTapLoginSubject = PublishSubject<Void>()
    private let didTapCancelSubject = PublishSubject<Void>()

    // MARK: output

    lazy private (set) var username: Observable<String> = {
        return self.usernameSubject.asObservable()
    }()

    lazy private (set) var password: Observable<String> = {
        return self.passwordSubject.asObservable()
    }()

    lazy private (set) var didTapLogin: Observable<Void> = {
        return self.didTapLoginSubject.asObservable()
    }()

    lazy private (set) var didTapCancel: Observable<Void> = {
        return self.didTapCancelSubject.asObservable()
    }()

    // MARK: ui elements

    @IBOutlet private weak var usernameField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    // MARK: private

    private let disposeBag = DisposeBag()

    // MARK: init

    init() {
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // nav bar
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.leftBarButtonItem = cancelButton

        // boilerplate
        usernameField.rx.text.orEmpty
            .subscribe(usernameSubject)
            .addDisposableTo(disposeBag)

        passwordField.rx.text.orEmpty
            .subscribe(passwordSubject)
            .addDisposableTo(disposeBag)

        loginButton.rx.tap
            .subscribe(didTapLoginSubject)
            .addDisposableTo(disposeBag)

        cancelButton.rx.tap
            .subscribe(didTapCancelSubject)
            .addDisposableTo(disposeBag)
    }
    
}
