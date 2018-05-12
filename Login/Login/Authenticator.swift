//
//  Authenticator.swift
//  Login
//
//  Created by TYRONE AVNIT on 2018/05/05.
//  Copyright © 2018 TYRONE AVNIT. All rights reserved.
//

import Foundation

public final class Authenticator {
    
    public init() {}
    
    public func authenticateSuccessfully() {
        print("Logging in...")
        print("Logged in successfully...")
        LoginContainer.instance.resolve(forPlugin: PostLoginSuccessPlugin.self).forEach(successfulLogin)
    }
    
    public func authenticateUnsuccessfully() {
        print("Logging in...")
        print("Logged in unsuccessfully...")
        LoginContainer.instance.resolve(forPlugin: PostLoginFailurePlugin.self).forEach(failedLogin)
    }
    
}

private extension Authenticator {
    
    func successfulLogin(plugin: PostLoginSuccessPlugin) {
        plugin.successfulLogin(userId: "1234")
    }
    
    func failedLogin(plugin: PostLoginFailurePlugin) {
        plugin.failedLogin(error: FailedLogin.userNotFound)
    }
    
}
