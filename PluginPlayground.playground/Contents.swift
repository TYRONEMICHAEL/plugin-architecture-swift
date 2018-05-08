//: Playground - noun: a place where people can play

import Login

final class UserProfilePostLoginPluginImplementation: PostLoginSuccessPlugin {

    func successfulLogin(userId: String) {
        print("Fetching user profile with id \(userId)...")
    }

}

final class UserFeedPostLoginPluginImplementation: PostLoginSuccessPlugin {

    func successfulLogin(userId: String) {
        print("Fetching user feed with id \(userId)...")
    }

}

final class LocalStoragePostLoginPluginImplementation: PostLoginSuccessPlugin, PostLoginFailurePlugin {

    func successfulLogin(userId: String) {
        print("Storing user with id \(userId)...")
    }

    func failedLogin(error: FailedLogin) {
        print("Clear data because of error \(String.init(describing: error))")
    }

}

let authenticator = Authenticator()

LoginContainer.instance.register(plugin: PostLoginSuccessPlugin.self, with: UserProfilePostLoginPluginImplementation())
LoginContainer.instance.register(plugin: PostLoginSuccessPlugin.self, with: UserFeedPostLoginPluginImplementation())
LoginContainer.instance.register(plugin: PostLoginSuccessPlugin.self, with: LocalStoragePostLoginPluginImplementation())
LoginContainer.instance.register(plugin: PostLoginFailurePlugin.self, with: LocalStoragePostLoginPluginImplementation())

authenticator.authenticateSuccessfully()
//authenticator.authenticateUnsuccessfully()
