import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "Remote Config Service"
    }
    
    router.get("ios", String.parameter) { req -> AppConfig in
        var content: [String: String] = [:]
        content["TARGET_EPC"] = "2.29"
        content["MODE"] = "all"
        
        let version = try req.parameters.next(String.self)
        switch version {
        case "0.25.26":
            content["MODE"] = "basic"
        default: break
        }
        
        return AppConfig(
            config: content
        )
    }
}
