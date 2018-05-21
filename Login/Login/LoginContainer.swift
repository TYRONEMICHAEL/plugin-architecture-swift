//
//  PluginRegistry.swift
//  Login
//
//

import Foundation

public final class LoginContainer {

    private var registry = [String: [() -> Any]]()
    private init() {}
    
}

public extension LoginContainer {
    
    static let instance = LoginContainer()
    
    func register<Plugin>(plugin: Plugin.Type, with implementation: @escaping @autoclosure () -> Plugin) {
        let key = String(describing: plugin)
        let plugins = registry[key] ?? []
        registry[key] = plugins + [implementation]
    }
    
}

internal extension LoginContainer {
    
    func resolve<Plugin>(forPlugin pluginToResolve: Plugin.Type) -> [Plugin] {
        let key = String(describing: pluginToResolve)
        guard let plugins = registry[key]?.compactMap({ $0() as? Plugin }), !plugins.isEmpty else {
            return []
        }
        return plugins
    }
    
}
