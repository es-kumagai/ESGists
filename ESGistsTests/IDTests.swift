//
//  IDTests.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/06.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import XCTest
import Foundation
import ESTestKit
import ESGists
import Ocean

class IDTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testArchive() {
		
		let value = UIntMax.max - 10000
		
		let id = ESGists.ID(value)
		
		let data = id.archivableData
		let archivedData = NSKeyedArchiver.archivedDataWithRootObject(data)
		let unarchivdData = NSKeyedUnarchiver.unarchiveObjectWithData(archivedData)
		let unarchivedIdWrapped = unarchivdData as? Archivable<ESGists.ID>
		let unarchivedId = unarchivedIdWrapped!.data
		
		expected().equal(id, unarchivedId)
    }
}
