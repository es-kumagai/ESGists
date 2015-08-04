//
//  LanguageTests.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/04.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import XCTest
import ESGists
import ESTestKit

class LanguageTests: XCTestCase {
	
	static let allSortedPopulars:[PopularLanguage] = [
		
		.ActionScript,
		.C,
		.CSharp,
		.CPlusPlus,
		.Clojure,
		.CoffeeScript,
		.CSS,
		.Go,
		.Haskell,
		.HTML,
		.Java,
		.JavaScript,
		.Lua,
		.Matlab,
		.Objective_C,
		.Perl,
		.PHP,
		.Python,
		.R,
		.Ruby,
		.Scala,
		.Shell,
		.Swift,
		.TeX,
		.VimL
	]

	static let allSortedLanguages:[Language]  = Array.sort(LanguageTests.allSortedPopulars.languages + [
		
		.ABAP,
		.Ada,
		.Agda,
		.AGS_Script,
		.Alloy,
		.AMPL,
		.Ant_Build_System,
		.ANTLR,
		.ApacheConf,
		.Apex,
		.APL,
		.AppleScript,
		.Arc,
		.Arduino,
		.AsciiDoc,
		.ASP,
		.AspectJ,
		.Assembly,
		.ATS,
		.Augeas,
		.AutoHotkey,
		.AutoIt,
		.Awk,
		.Batchfile,
		.Befunge,
		.Bison,
		.BitBake,
		.BlitzBasic,
		.BlitzMax,
		.Bluespec,
		.Boo,
		.Brainfuck,
		.Brightscript,
		.Bro,
		.C_ObjDump,
		
		.Text
	])()
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAllLanguages() {
		
		let languages = Language.all
		let populars = PopularLanguage.all
		let popularLanguages = populars.languages
		
		let sortedLanguages = languages.sort()
		let sortedPopulars = populars.sort()
		
		expected().equal(languages.count, 61)
		expected().equal(populars.count, 25)

		expected().success(languages.isSupersetOf(popularLanguages))
		unexpected().success(languages.isSubsetOf(popularLanguages))
		
		expected("has same elements.").equal(languages.exclusiveOr(sortedLanguages), [])
		expected("has same elements.").equal(populars.exclusiveOr(sortedPopulars), [])
		
		expected().equal(sortedLanguages, LanguageTests.allSortedLanguages)
		expected().equal(sortedPopulars, LanguageTests.allSortedPopulars)
    }
}
