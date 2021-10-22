//
//  ViewModelTests.swift
//  ImageUploaderTests
//
//  Created by Jefferson Miralles on 10/22/21.
//

import XCTest
@testable import ImageUploader

class ViewModelTests: XCTestCase {
    var sut: ViewModel!
    var mockDataService: DataServiceProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockDataService = MockDataService()
        sut = ViewModel(dataService: mockDataService)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_Pictures_Exist() {
        XCTAssertNotNil(sut.pictures)
    }
    
    func testPictures_Count_ReturnZero() {
        XCTAssertEqual(sut.pictures.count, 0)
    }
    
    func testGetTags_IsNotEmpty() {
        XCTAssertTrue(!sut.getTags().isEmpty, "getTags should return array of strings")
    }
    
    func testSubmitImage_PicturesCountIsEqualToOne() {
        XCTAssertTrue(sut.pictures.isEmpty)
        sut.submitImage(Picture(image: UIImage()))
        XCTAssertEqual(sut.pictures.count, 1)
    }
    
    func testContainPictures_ReturnsTrue() {
        XCTAssertTrue(!sut.containPictures())
        sut.submitImage(Picture(image: UIImage()))
        XCTAssertTrue(sut.containPictures(), "pictures should contain one Picture object")
    }
    
    func testFilteredPictures_ReturnPictureWithNatureTag() {
        XCTAssertTrue(sut.pictures.isEmpty)
        sut.submitImage(Picture(image: UIImage(), tags: ["Nature"]))
        sut.submitImage(Picture(image: UIImage(), tags: ["Nature"]))
        sut.submitImage(Picture(image: UIImage(), tags: ["Sports"]))
        sut.submitImage(Picture(image: UIImage(), tags: ["Sunset"]))
        sut.submitImage(Picture(image: UIImage(), tags: ["Nature"]))
        let naturePictures = sut.filterPictures(["Nature"])
        XCTAssertEqual(naturePictures.count, 3)
    }
}
