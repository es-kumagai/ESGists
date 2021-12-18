//
//  PopularLanguage.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/04.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Swim

public enum PopularLanguage : String, CaseIterable, Sendable {
	
	case actionScript = "Action Script"
	case c = "C"
	case cSharp = "C#"
	case cPlusPlus = "C++"
	case clojure = "Clojure"
	case coffeeScript = "CoffeeScript"
	case css = "CSS"
	case go = "Go"
	case haskell = "Haskell"
	case html = "HTML"
	case java = "Java"
	case javaScript = "JavaScript"
	case lua = "Lua"
	case matlab = "Matlab"
	case objective_C = "Objective-C"
	case perl = "Perl"
	case php = "PHP"
	case python = "Python"
	case r = "R"
	case ruby = "Ruby"
	case scala = "Scala"
	case shell = "Shell"
	case swift = "Swift"
	case teX = "TeX"
	case vimL = "VimL"
}

extension PopularLanguage: LanguageType {
	
	public var extname: String {
	
		language.extname
	}
	
	public var language: Language {
		
		guard let language = Language(rawValue: self.rawValue) else {
			
			fatalError("PopularLanguage must be a subset of Language.")
		}
		
		return language
	}
}
