//
//  File.swift
//  Login
//
//  Created by TYRONE AVNIT on 2018/05/07.
//  Copyright © 2018 TYRONE AVNIT. All rights reserved.
//

import Foundation

public typealias UserId = String

public protocol PostLoginSuccessPlugin {
    
    func successfulLogin(userId: UserId)
    
}
