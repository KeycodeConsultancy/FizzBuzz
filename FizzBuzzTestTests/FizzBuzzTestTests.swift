import XCTest
@testable import FizzBuzzTest

class FizzBuzzTestTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFizz() {
        let exp = expectation(description: "Check for Fizz")
        let data = FizzBuzzDataService()
        data.startNumber = 1
        data.endNumber = 3
        var values = [String]()
        
        data.generateFizzBuzzData { _, data, _ in
            values = data as! [String]
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout Error : \(error)")
            }
            XCTAssertEqual(values[2], FizzBuzz.Fizz.rawValue)
        }
    }
    
    func testBuzz() {
        let exp = expectation(description: "Check for Buzz")
        let data = FizzBuzzDataService()
        data.startNumber = 1
        data.endNumber = 5
        var values = [String]()
        
        data.generateFizzBuzzData { _, data, _ in
            values = data as! [String]
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout Error : \(error)")
            }
            XCTAssertEqual(values[4], FizzBuzz.Buzz.rawValue)
        }
    }
    
    func testFizzBuzz() {
        let exp = expectation(description: "Check for FizzBuzz")
        let data = FizzBuzzDataService()
        data.startNumber = 1
        data.endNumber = 15
        var values = [String]()
        
        data.generateFizzBuzzData { _, data, _ in
            values = data as! [String]
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout Error : \(error)")
            }
            XCTAssertEqual(values[14], FizzBuzz.Fizz.rawValue + FizzBuzz.Buzz.rawValue)
        }
    }
}
