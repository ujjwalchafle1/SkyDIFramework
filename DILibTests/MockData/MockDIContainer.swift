//
//  MockDIContainer.swift
//  DILibTests
//
//  Created by Ujjwal on 08/08/2021.
//

import Foundation
@testable import DILib

class DIContainerSpy: DIContainerProtocol {
    public static let shared = DIContainerSpy()
    init() {}
    var components: [String: Any] = [:]
    
    func register<Component>(type: Component.Type, component: Any, identifier: String) {
        components["\(identifier)"] = component
    }
    
    func resolve<Component>(type: Component.Type, identifier: String) -> Component? {
        return components["\(identifier)"] as? Component
    }
    
    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
}
