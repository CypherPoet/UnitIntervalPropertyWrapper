import XCTest
import UnitIntervalPropertyWrapper

class UnitIntervalPropertyWrapperTests: XCTestCase {
    
    struct AwesomeLoader {
        @UnitInterval
        var progressAmount: Double
    }
}


// MARK: - Lifecycle
extension UnitIntervalPropertyWrapperTests {

    override func setUpWithError() throws {
        // Put setup code here.
        // This method is called before the invocation of each
        // test method in the class.
        try super.setUpWithError()
    }


    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
}


// MARK: - Tests: Core Functionality
extension UnitIntervalPropertyWrapperTests {

    func test_Initializing_WithinRange_UsesProvidedValue() throws {
        let newValue: Double = 0.4
        let loader = AwesomeLoader(progressAmount: newValue)
        
        XCTAssertEqual(loader.progressAmount, newValue)
    }
    
    
    func test_Initializing_BelowRange_SetsToLowerBound() throws {
        let newValue: Double = -42
        let loader = AwesomeLoader(progressAmount: newValue)
        
        XCTAssertEqual(loader.progressAmount, 0.0)
    }
    
    
    func test_Initializing_AboveRange_SetsToUpperBound() throws {
        let newValue: Double = 1.4
        let loader = AwesomeLoader(progressAmount: newValue)
        
        XCTAssertEqual(loader.progressAmount, 1.0)
    }
    
    
    func test_Setting_WithinRange_SetsToProvidedValue() throws {
        let newValue: Double = 0.21
        var loader = AwesomeLoader(progressAmount: 0.5)
        
        loader.progressAmount = newValue
        
        XCTAssertEqual(loader.progressAmount, newValue)
    }
    
    
    func test_Setting_BelowRange_SetsToLowerBound() throws {
        let newValue: Double = -21
        var loader = AwesomeLoader(progressAmount: 0.5)
        
        loader.progressAmount = newValue
        
        XCTAssertEqual(loader.progressAmount, 0.0)
    }
    
    
    func test_Setting_AboveRange_SetsToUpperBound() throws {
        let newValue: Double = 21
        var loader = AwesomeLoader(progressAmount: 0.5)
        
        loader.progressAmount = newValue
        
        XCTAssertEqual(loader.progressAmount, 1.0)
    }
}
