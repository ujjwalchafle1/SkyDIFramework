//
//  DIContainer.swift
//  DILib
//
//  Created by Chafle, Ujjwal on 05/08/2021.
//

import Foundation

protocol DIContainerProtocol {
    func register<Component>(type: Component.Type, component: Any, identifier: String)
    func resolve<Component>(type: Component.Type, identifier: String) -> Component?
    func register<Component>(type: Component.Type, component: Any)
    func resolve<Component>(type: Component.Type) -> Component?
}

public class DIContainer {
    public static let shared = DIContainer()
    private init() {}
    private var components: [String: Any] = [:]
}

extension DIContainer: DIContainerProtocol {
    public func register<Component>(type: Component.Type,
                                    component: Any, identifier: String) {
        components["\(identifier)"] = component
    }
    
    public func resolve<Component>(type: Component.Type,
                                   identifier: String) -> Component? {
        
        precondition(components["\(identifier)"] != nil, "No Dependency found for - \(Component.self), Application must register a dependency before resoving it.")
        return components["\(identifier)"] as? Component
    }
    
    public func register<Component>(type: Component.Type,
                                    component: Any) {
        components["\(type)"] = component
    }
    
    public func resolve<Component>(type: Component.Type) -> Component? {
        precondition(components["\(type.self)"] != nil, "No Dependency found for - \(Component.self), Application must register a dependency befoe resoving it.")
        return components["\(type)"] as? Component
    }
}

