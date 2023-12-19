//
//  Secrets.swift
//  Biba
//
//  Created by Andy Wu on 2023/12/18.
//

import Foundation

enum Secrets {

    enum CI {
        static let githubId = "{GITHUBID}"
        static let githubSecret = "{GITHUBSECRET}"
        static let imgurId = "{IMGURID}"
    }

    enum GitHub {
        static let clientId = Secrets.environmentVariable(named: "GITHUB_CLIENT_ID") ?? CI.githubId
        static let clientSecret = Secrets.environmentVariable(named: "GITHUB_CLIENT_SECRET") ?? CI.githubSecret
    }

    enum Imgur {
        static let clientId = Secrets.environmentVariable(named: "IMGUR_CLIENT_ID") ?? CI.imgurId
    }

    fileprivate static func environmentVariable(named: String) -> String? {

        guard let value = ProcessInfo.processInfo.environment[named] else {
            print("‼️ Missing Environment Variable: '\(named)'")
            return nil
        }

        return value
    }

}
