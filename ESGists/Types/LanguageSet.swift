//
//  LanguageSet.swift
//  ESGists
//
//  Created by Tomohiro Kumagai on H27/08/04.
//  Copyright © 2015 EasyStyle G.K. All rights reserved.
//

/// Always true in any case. This operator use only for enumerate all value in the file private scope.
private typealias ForListupType = (dummy:Language, reserved:Optional<Void>)

internal func _getAllLanguage() -> Set<Language> {
	
	var result = [Language]()
	
	// This way using tupple is expect to completeness of enum type.
	
	let forListup = ForListupType(dummy: Language.ActionScript, reserved: .None)
	
	switch forListup {
		
	case (.ActionScript, .None):
		result.append(.ActionScript)
		fallthrough
		
	case (.C, .None):
		result.append(.C)
		fallthrough
		
	case (.CSharp, .None):
		result.append(.CSharp)
		fallthrough
		
	case (.CPlusPlus, .None):
		result.append(.CPlusPlus)
		fallthrough
		
	case (.Clojure, .None):
		result.append(.Clojure)
		fallthrough
		
	case (.CoffeeScript, .None):
		result.append(.CoffeeScript)
		fallthrough
		
	case (.CSS, .None):
		result.append(.CSS)
		fallthrough
		
	case (.Go, .None):
		result.append(.Go)
		fallthrough
		
	case (.Haskell, .None):
		result.append(.Haskell)
		fallthrough
		
	case (.HTML, .None):
		result.append(.HTML)
		fallthrough
		
	case (.Java, .None):
		result.append(.Java)
		fallthrough
		
	case (.JavaScript, .None):
		result.append(.JavaScript)
		fallthrough
		
	case (.Lua, .None):
		result.append(.Lua)
		fallthrough
		
	case (.Matlab, .None):
		result.append(.Matlab)
		fallthrough
		
	case (.Objective_C, .None):
		result.append(.Objective_C)
		fallthrough
		
	case (.Perl, .None):
		result.append(.Perl)
		fallthrough
		
	case (.PHP, .None):
		result.append(.PHP)
		fallthrough
		
	case (.Python, .None):
		result.append(.Python)
		fallthrough
		
	case (.R, .None):
		result.append(.R)
		fallthrough
		
	case (.Ruby, .None):
		result.append(.Ruby)
		fallthrough
		
	case (.Scala, .None):
		result.append(.Scala)
		fallthrough
		
	case (.Shell, .None):
		result.append(.Shell)
		fallthrough
		
	case (.Swift, .None):
		result.append(.Swift)
		fallthrough
		
	case (.TeX, .None):
		result.append(.TeX)
		fallthrough
		
	case (.VimL, .None):
		result.append(.VimL)
		fallthrough
		
	case (.ABAP, .None):
		result.append(.ABAP)
		fallthrough
		
	case (.Ada, .None):
		result.append(.Ada)
		fallthrough
		
	case (.Agda, .None):
		result.append(.Agda)
		fallthrough
		
	case (.AGS_Script, .None):
		result.append(.AGS_Script)
		fallthrough
		
	case (.Alloy, .None):
		result.append(.Alloy)
		fallthrough
		
	case (.AMPL, .None):
		result.append(.AMPL)
		fallthrough
		
	case (.Ant_Build_System, .None):
		result.append(.Ant_Build_System)
		fallthrough
		
	case (.ANTLR, .None):
		result.append(.ANTLR)
		fallthrough
		
	case (.ApacheConf, .None):
		result.append(.ApacheConf)
		fallthrough
		
	case (.Apex, .None):
		result.append(.Apex)
		fallthrough
		
	case (.APL, .None):
		result.append(.APL)
		fallthrough
		
	case (.AppleScript, .None):
		result.append(.AppleScript)
		fallthrough
		
	case (.Arc, .None):
		result.append(.Arc)
		fallthrough
		
	case (.Arduino, .None):
		result.append(.Arduino)
		fallthrough
		
	case (.AsciiDoc, .None):
		result.append(.AsciiDoc)
		fallthrough
		
	case (.ASP, .None):
		result.append(.ASP)
		fallthrough
		
	case (.AspectJ, .None):
		result.append(.AspectJ)
		fallthrough
		
	case (.Assembly, .None):
		result.append(.Assembly)
		fallthrough
		
	case (.ATS, .None):
		result.append(.ATS)
		fallthrough
		
	case (.Augeas, .None):
		result.append(.Augeas)
		fallthrough
		
	case (.AutoHotkey, .None):
		result.append(.AutoHotkey)
		fallthrough
		
	case (.AutoIt, .None):
		result.append(.AutoIt)
		fallthrough
		
	case (.Awk, .None):
		result.append(.Awk)
		fallthrough
		
	case (.Batchfile, .None):
		result.append(.Batchfile)
		fallthrough
		
	case (.Befunge, .None):
		result.append(.Befunge)
		fallthrough
		
	case (.Bison, .None):
		result.append(.Bison)
		fallthrough
		
	case (.BitBake, .None):
		result.append(.BitBake)
		fallthrough
		
	case (.BlitzBasic, .None):
		result.append(.BlitzBasic)
		fallthrough
		
	case (.BlitzMax, .None):
		result.append(.BlitzMax)
		fallthrough
		
	case (.Bluespec, .None):
		result.append(.Bluespec)
		fallthrough
		
	case (.Boo, .None):
		result.append(.Boo)
		fallthrough
		
	case (.Brainfuck, .None):
		result.append(.Brainfuck)
		fallthrough
		
	case (.Brightscript, .None):
		result.append(.Brightscript)
		fallthrough
		
	case (.Bro, .None):
		result.append(.Bro)
		fallthrough
		
	case (.C_ObjDump, .None):
		result.append(.C_ObjDump)
		fallthrough
		
	case (.Text, .None):
		result.append(.Text)
		fallthrough
		
	case (_, .Some):
		break
	}
	
	return Set(result)
}

private func ~= (pattern:ForListupType, value:ForListupType) -> Bool {
	
	return true
}
