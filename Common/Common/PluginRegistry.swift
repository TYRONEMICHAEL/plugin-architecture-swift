//
//  Plugins.swift
//  PluginArchitecture
//
//  Created by TYRONE AVNIT on 2018/05/07.
//  Copyright © 2018 TYRONE AVNIT. All rights reserved.
//

import Foundation

public protocol PluginRegistry {
    
    var registry: [String: [() -> Any]] { get set }
    func register<Plugin>(plugin: Plugin.Type, with implementation: @escaping @autoclosure () -> Plugin)
    
}

extension PluginRegistry {
    
    mutating func register<Plugin>(plugin: Plugin.Type, with implementation: @escaping @autoclosure () -> Plugin) {
        let key = String(describing: plugin)
        let plugins = registry[key] ?? []
        registry[key] = plugins + [implementation]
    }
    
}

internal extension PluginRegistry {
    
    func resolve<T>(forPlugin pluginToResolve: T.Type) -> [T] {
        let key = String(describing: pluginToResolve)
        guard let plugins = registry[key]?.compactMap({ $0() as? T }), !plugins.isEmpty else {
            return []
        }
        return plugins
    }
    
}
