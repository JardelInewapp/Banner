//
//  AnimaisTests.swift
//  AnimaisTests
//
//  Created by Jardel on 21/09/21.
//

import XCTest
@testable import Animais

class AnimaisTests: XCTestCase {
    
    private var resource: Webservice!
    
    
    override func setUp() {
        super.setUp()
        resource = Webservice()
    }
 
    func testeApiAnimal(){
        
        let expectation = self.expectation(description: "RetornoAnimal")
        resource.load(resource: Order.GetObj){ (loginResponse) in
          //  print("aqui ", loginResponse)
            loginResponse.map{ item in
                item.data.forEach{ nome in
                    print("meu nome ", nome.name)
                }
            }
            XCTAssertNotNil(loginResponse)
            expectation.fulfill()
            
            //            // verificar se o resultado é igual
            //            XCTAssertEqual(result, 3)
            //            // verificar se o resultado é verdadeiro
            //            XCTAssertTrue()
            //            // verificar se o resultado é Falso
            //            XCTAssertFalse()
            //            // verificar se o resultado nulo
            //            XCTAssertNil()
            //            // verificar se o resultado nao for nullo
            //            XCTAssertNotNil()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // executa a pos a finalizacao dos teste
    override func tearDown() {
        super.tearDown()
    }


}
