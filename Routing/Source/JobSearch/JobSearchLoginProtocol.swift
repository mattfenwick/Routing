//
//  JobSearchLoginProtocol.swift
//  Routing
//
//  Created by Matt Fenwick on 3/6/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol JobSearchLoginProtocol {
    var loginViewController: UIViewController { get }
    var didCancelLogin: Observable<Void> { get }
    var loginDidSucceed: Observable<String> { get }
    var loginDidFail: Observable<Void> { get }
}
