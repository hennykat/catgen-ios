import XCTest
@testable import CatGen

class CatUtilTest: XCTestCase {

    func test1FindCentre() {
        let result = CatUtil.findCentre(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        XCTAssertEqual(result.x, 50, "input: 100 x 100 sq")
        XCTAssertEqual(result.y, 50, "input: 100 x 100 sq")
    }
    
    func test2FindCentre() {
        let result = CatUtil.findCentre(rect: CGRect(x: 1, y: 8, width: 20, height: 30))
        XCTAssertEqual(result.x, 10, "input: 20 x 30 rect")
        XCTAssertEqual(result.y, 15, "input: 20 x 30 rect")
    }
    
    func test3FindCentre() {
        let result = CatUtil.findCentre(rect: CGRect(x: 3, y: 1, width: 0.5, height: 3))
        XCTAssertEqual(result.x, 0.25, "input: 0.5 x 3 rect")
        XCTAssertEqual(result.y, 1.5, "input: 0.5 x 3 rect")
    }
    
    func test1FindRadius() {
        let result = CatUtil.findRadius(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        XCTAssertEqual(result, 50, "input: 100 x 100 sq")
    }
    
    func test2FindRadius() {
        let result = CatUtil.findRadius(rect: CGRect(x: 3, y: 20, width: 30, height: 100))
        XCTAssertEqual(result, 15, "input: 30 x 100 rect")
    }
    
    func test3FindRadius() {
        let result = CatUtil.findRadius(rect: CGRect(x: 3, y: 1, width: 0.5, height: 3))
        XCTAssertEqual(result, 0.25, "input: 0.5 x 3 rect")
    }
}


