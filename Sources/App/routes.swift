import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    router.get { req in
        return "Remote Config Service"
    }
    
    router.get("ios", String.parameter, String.parameter) { req -> AppConfig in
        var content: [String: String] = [:]
        content["TARGET_EPC"] = "2.29"
        content["MODE"] = "all"
        content["PREMIUM_PANEL_EXTRA_COST"] = "0.07"
        
        // let bundle = try req.parameters.next(String.self)
        // let version = try req.parameters.next(String.self)
        // if bundle == "com.electrious.Management" {
        //     switch version {
        //     case "0.25.26":
        //         content["MODE"] = "basic"
        //     default: break
        //     }
        // }
        
        return AppConfig(
            config: content
        )
    }
}
