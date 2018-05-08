//
//  PostLoginFailure.swift
//  Login
//
//  Created by TYRONE AVNIT on 2018/05/07.
//  Copyright © 2018 TYRONE AVNIT. All rights reserved.
//

import Foundation

public enum FailedLogin: Error {
    
    case userNotFound
    
}

public protocol PostLoginFailurePlugin {
    
    func failedLogin(error: FailedLogin)
    
}
