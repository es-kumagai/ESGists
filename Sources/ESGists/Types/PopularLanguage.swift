//
//  PopularLanguage.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/04.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Swim

public enum PopularLanguage : String {
	
	case ActionScript
	case C
	case CSharp = "C#"
	case CPlusPlus = "C++"
	case Clojure
	case CoffeeScript
	case CSS
	case Go
	case Haskell
	case HTML
	case Java
	case JavaScript
	case Lua
	case Matlab
	case Objective_C = "Objective-C"
	case Perl
	case PHP
	case Python
	case R
	case Ruby
	case Scala
	case Shell
	case Swift
	case TeX
	case VimL
}

private let _all:Set<PopularLanguage> = flatMap(Language.all, into: Set<PopularLanguage>.init) {
 
	PopularLanguage(rawValue: $0.rawValue)
}

extension PopularLanguage : LanguageType {
	
	public static var all:Set<PopularLanguage> {
	
		return _all
	}
	
	public var extname:String {
	
		return self.language.extname
	}
	
	public var language:Language {
		
		guard let language = Language(rawValue: self.rawValue) else {
			
			fatalError("PopularLanguage must be a subset of Language.")
		}
		
		return language
	}
}
