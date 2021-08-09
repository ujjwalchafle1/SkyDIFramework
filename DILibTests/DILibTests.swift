//
//  DILibTests.swift
//  DILibTests
//
//  Created by Chafle, Ujjwal on 05/08/2021.
//

import XCTest
@testable import DILib

struct TestClassA{
  var value: String?
}



class DILibTests: XCTestCase {
  
  func test_register_withoutIdentifier(){
    let (sut,someClassObject) = makeSUT()
    sut.register(type: TestClassA.self, component: someClassObject)
    
    XCTAssertNotNil(sut.components["\(TestClassA.self)"], "components should contain a value after register func called ")
  }
  
  func test_register_withoutIdentifierTwice_shouldOverrideOldObject() {
    var (sut,someClassObject) = makeSUT()
    someClassObject.value = "defaultValue"
    sut.register(type: TestClassA.self, component: someClassObject)
    
    let anotherClassObject = TestClassA(value: "newValue")
    sut.register(type: TestClassA.self, component: anotherClassObject)
    
    let savedObject = sut.components["\(TestClassA.self)"] as! TestClassA
    
    XCTAssertTrue(savedObject.value == anotherClassObject.value, "\(sut.components.count) Components should override the old instance with newly registered instance.")
  }
  
  func test_register_withoutIdentifierTwice_shouldNotIncreaseComponentsCount() {
    let (sut,someClassObject) = makeSUT()
    
    sut.register(type: TestClassA.self, component: someClassObject)
    let intialComponentsCount = sut.components.count
    
    let anotherClassObject = TestClassA(value: "someValue")
    sut.register(type: TestClassA.self, component: anotherClassObject)
    
    //test failling case
    //        let anotherClassObject1 = TestClassA(value: "someValue1")
    //        sut.register(type: TestClassA.self, component: anotherClassObject1, identifier: "some")
    
    let newComponentsCount = sut.components.count
    
    XCTAssertTrue(intialComponentsCount == newComponentsCount, "Components dictionary should not add new entry for the instance of same type when registering wihout identifier.")
  }
  
  func test_register_withIdentifier() {
    let (sut,someClassObject) = makeSUT()
    
    sut.register(type: TestClassA.self, component: someClassObject, identifier: "someIdentifier")
    
    let savedObject = sut.components["someIdentifier"]
    
    XCTAssertNotNil(savedObject, "components should contain a value after register func called with identifier.")
  }
  
  func test_resolve_withoutIdentifier(){
    let (sut,_) = makeSUT()
    
    sut.register(type: TestClassA.self, component: TestClassA())
    
    let someClassObject = sut.resolve(type: TestClassA.self)
    
    XCTAssertNotNil(someClassObject, "Objects must be resolved if they are registered already.")
  }
  
  func test_resolve_withIdentifier(){
    let (sut,_) = makeSUT()
    
    sut.register(type: TestClassA.self, component: TestClassA(), identifier: "someIdentifier")
    
    let someClassObject = sut.resolve(type: TestClassA.self, identifier: "someIdentifier")
    
    XCTAssertNotNil(someClassObject, "Objects must be resolved if they are registered already.")
  }
  
  func makeSUT() -> (DIContainerSpy, TestClassA){
    return (DIContainerSpy.shared, TestClassA())
  }
}
