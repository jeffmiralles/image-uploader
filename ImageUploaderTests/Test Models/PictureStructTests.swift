//
//  PictureStructTests.swift
//  ImageUploaderTests
//
//  Created by Jefferson Miralles on 10/22/21.
//

import XCTest
@testable import ImageUploader

class PictureStructTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_NotNil() {
        let picture = Picture(image: UIImage())
        XCTAssertNotNil(picture)
    }
    
    func testInit_Tags_ContainsArrayOfStrings() {
        let picture = Picture(image: UIImage(), tags: ["Nature"])
        XCTAssertFalse(picture.tags.isEmpty, "tags should contain atleast one String")
    }
    
//    func testInit_Tags_IsOptional() {
//        let picture = Picture(image: UIImage())
//        XCTAssertNil(picture.tags, "tags should be nil")
//    }
    
}
