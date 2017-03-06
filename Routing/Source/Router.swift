//
//  Router.swift
//  Routing
//
//  Created by Matt Fenwick on 3/4/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation

class Router {

    static func resolve(url: URL) -> Bool? { // TODO what should this return?
        guard let host = url.host, let components = URLComponents(url: url, resolvingAgainstBaseURL:  false) else {
            return nil
        }

        print("resolving url \(url)\nhost and components: \(host) \(components)")

        switch host {
        case "login":
            break
        case "dashboard":
            break
        case "job-search":
            break
        case "job-details":
//            if let idItem = components.queryItems?.filter({ return $0.name == "jobId" }).first, let id = idItem.value {
//                self = .jobDetails(jobId: id)
//            } else {
//                fallthrough
//            }
            break
        case "map-search":
            break
        default:
            break
        }
        return nil
    }

}
