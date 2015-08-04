//
//  PopularLanguage.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/04.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

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

extension PopularLanguage : LanguageType {
	
	public var extname:String {
	
		guard let language = Language(rawValue: self.rawValue) else {
			
			fatalError("Unknown language.")
		}
		
		return language.extname
	}
}
