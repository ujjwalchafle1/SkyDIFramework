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
  
  /// This API is used to register the dependency for a given specific type with an unique idetifier.
  /// Unique identifier is used to allow registration of multiple instances for the same type.
  /// - Parameters:
  ///   - type: Type of the instance to register dependency
  ///   - component: Instance to register
  ///   - identifier: Unique identifier for the instance
    public func register<Component>(type: Component.Type,
                                    component: Any, identifier: String) {
        components["\(identifier)"] = component
    }
    
  
  /// This API is used to resolve the dependency for a given specific type with an unique idetifier.
  /// Unique identifier is used to allow resolve multiple instances for the same type.
  /// - Parameters:
  ///   - type: Type of the instance to resolve dependency
  ///   - identifier: Unique identifier for the instance used while registration
  /// - Returns: Instance of the given type
    public func resolve<Component>(type: Component.Type,
                                   identifier: String) -> Component? {
        
        precondition(components["\(identifier)"] != nil, "No Dependency found for - \(Component.self), Application must register a dependency before resoving it.")
        return components["\(identifier)"] as? Component
    }
    
  /// This API is used to register the dependency for a given specific type.
  /// - Parameters:
  ///   - type: Type of the instance to register
  ///   - component: Instance to register
    public func register<Component>(type: Component.Type,
                                    component: Any) {
        components["\(type)"] = component
    }
    
  /// This API is used to resolve the dependency for a given specific type.
  /// - Parameters:
  ///   - type: Type of the instance to resolve dependency
  /// - Returns: Instance of the given type
    public func resolve<Component>(type: Component.Type) -> Component? {
        precondition(components["\(type.self)"] != nil, "No Dependency found for - \(Component.self), Application must register a dependency befoe resoving it.")
        return components["\(type)"] as? Component
    }
}

