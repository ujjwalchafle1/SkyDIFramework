# SkyDIFramework
**DILib (Dependency Injection Framework)**
A simple dependency injection framework to help you write a class independent of its dependencies. 

## Table of contents
* [Introduction](#introduction)
* [Features](#features)
* [Software And Technologies](#software-and-technologies)
* [Setup](#setup)
* [Approach](#approach)
* [Unit Testing](#unit-testing)
* [Future Features And Improvements](#future-features-and-improvements)

## Introduction:
DILib iOS Framework is written in swift to help you write a class independent of its dependencies. The framework features a powerful technique of decoupling the modules and writing the loosely coupled code, extensible and scalable projects using Dependency injection.

Dependency injection is a programming technique that makes a class independent of its dependencies. It achieves that by decoupling the usage of an object from its creation. This helps you to follow SOLID's dependency inversion and single responsibility principles.

## Features:
1. Exposes APIs to register an instance of a desired type.
2. Exposes APIs to resolve the dependency for a desired type.
3. Supports registering and resolving of multiple instances for the same type using an identifier for unique instances.

## Software And Technologies:
* MacOS: Big Sur (11.0.1)
* XCode: 12.3
* Minimum iOS version: 14.0
* Swift: 5

## Setup:
Follw below steps to create DILib framework:
1. Open terminal.
2. Change the current working directory to the DILib project directory.
3. Inside DILib directory run Build.sh shell script to create a universal Dependency Injection Framework. (Type Command: bash Build.sh).
4. A new folder named Build will be created inside the DILib directory containing which contains DILib.xcframework.
5. YESSSS!!! Your DILib Framework is now ready for integration!

## Approach:
1. Create a framework target to register and resolve dependencies for the desired type.
2. DIContainer class, a singleton class used as a container to register and resolve instances.
3. DIContainer class confirms to the DIContainerProtocol which has the below methods to register and resolve the dependencies:
  - register(type: Component.Type, component: Any, identifier: String)
  - resolve(type: Component.Type, identifier: String) -> Component?
  - register(type: Component.Type, component: Any)
  - resolve(type: Component.Type) -> Component?
4. To support multiple instances of the same type, an additional parameter identifier is used to register/save the instances of the same type.
5. The instances are stored in a dictionary with a key as a Type of instance or as an Identifier (if provided).

  
## Unit Testing: 
Apples **XCTest framework** is used to write the unit tests and UI tests for the application.

## Future Features And Improvements:
1. PropertyWrapper could also be a good option for resolving the registered dependencies.
2. Handling strong references stored in the dictionary.
3. Solution for removing use of singleton object for framewok.
