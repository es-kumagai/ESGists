//
//  PopularLanguage.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/04.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Swim

public enum PopularLanguage : String, CaseIterable {
	
	case actionScript
	case c
	case cSharp = "C#"
	case cPlusPlus = "C++"
	case clojure
	case coffeeScript
	case cSS
	case go
	case haskell
	case hTML
	case java
	case javaScript
	case lua
	case matlab
	case objective_C = "Objective-C"
	case perl
	case pHP
	case python
	case r
	case ruby
	case scala
	case shell
	case swift
	case teX
	case vimL
}

extension PopularLanguage: LanguageType {
	
	public var extname: String {
	
		return language.extname
	}
	
	public var language: Language {
		
		guard let language = Language(rawValue: self.rawValue) else {
			
			fatalError("PopularLanguage must be a subset of Language.")
		}
		
		return language
	}
}
