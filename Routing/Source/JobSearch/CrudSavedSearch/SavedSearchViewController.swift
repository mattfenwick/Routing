//
//  SavedSearchViewController.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import UIKit
import RxSwift

class SavedSearchViewController: UIViewController {

    // MARK: boilerplate

    private let cancelSubject = PublishSubject<Void>()
    private let saveSubject = PublishSubject<Void>()
    private let deleteSubject = PublishSubject<Void>()

    // MARK: output

    lazy private (set) var cancel: Observable<Void> = {
        return self.cancelSubject.asObservable()
    }()
    lazy private (set) var save: Observable<Void> = {
        return self.saveSubject.asObservable()
    }()
    lazy private (set) var delete: Observable<Void> = {
        return self.deleteSubject.asObservable()
    }()

    // MARK: ui elements

    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var deleteButton: UIButton!

    // MARK: private

    private let disposeBag = DisposeBag()

    // MARK: init

    init() {
        super.init(nibName: "SavedSearchViewController", bundle: Bundle(for: SavedSearchViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.leftBarButtonItem = cancelButton

        // boilerplate
        cancelButton.rx.tap
            .subscribe(cancelSubject)
            .addDisposableTo(disposeBag)

        saveButton.rx.tap
            .subscribe(saveSubject)
            .addDisposableTo(disposeBag)

        deleteButton.rx.tap
            .subscribe(deleteSubject)
            .addDisposableTo(disposeBag)
    }
    
}
