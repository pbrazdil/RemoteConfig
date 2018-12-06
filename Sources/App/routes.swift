import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "Remote Config Service"
    }
    
//    router.get("ios") { req in
//        let a = JSON()
////        return JSON(node: [
////            "name" : "hey",
////            "color" : "hey2"
////        ])
//
//        return "aa"
//    }
    
    router.get("hello", "world") { req in
        return "Hello, world!"
    }
    
    router.get("ios") { req -> AppConfig in
        return AppConfig(
            config: [
                "MODE": "basic",
                "TARGET_EPC":"2.29",
            ]
        )
    }
    
//    router.get("hello", "world") { request -> Encodable in
//        let data: [String: String] = [
//            "test": "test2"
//        ]
//        return "Hello, world!"
//
//        return try! request.content.encode(json: data, using: .custom(dates: .millisecondsSince1970))
//    }

    // Example of configuring a controller
//    let todoController = TodoController()
//    router.get("todos", use: todoController.index)
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
}
