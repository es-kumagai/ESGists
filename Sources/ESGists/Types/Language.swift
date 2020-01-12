//
//  Language.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/19.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

private let _all:Set<Language> = _getAllLanguage()

public enum Language : String {
	
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

	case aBAP
	case ada
	case agda
	case aGS_Script = "AGS Script"
	case alloy
	case aMPL
	case ant_Build_System = "Ant Build System"
	case aNTLR
	case apacheConf
	case apex
	case aPL
	case appleScript
	case arc
	case arduino
	case asciiDoc
	case aSP
	case aspectJ
	case assembly
	case aTS
	case augeas
	case autoHotkey
	case autoIt
	case awk
	case batchfile
	case befunge
	case bison
	case bitBake
	case blitzBasic
	case blitzMax
	case bluespec
	case boo
	case brainfuck
	case brightscript
	case bro
	case c_ObjDump = "C-ObjDump"
//	case c2hs_Haskell = "C2hs Haskell"
//	case cap_n_Proto = "Cap'n Proto"
//	case cartoCSS
//	case ceylon
//	case chapel
//	case chucK
//	case cirru
//	case clean
//	case cLIPS
//	case cMake
//	case cOBOL
//	case coldFusion
//	case coldFusion_CFC = "ColdFusion CFC"
//	case common_Lisp = "Common Lisp"
//	case component_Pascal = "Component Pascal"
//	case cool
//	case coq
//	case cpp_ObjDump = "Cpp-ObjDump"
//	case creole
//	case crystal
//	case cucumber
//	case cuda
//	case cycript
//	case cython
//	case d
//	case d_ObjDump = "D-ObjDump"
//	case darcs_Patch = "Darcs Patch"
//	case dart
//	case desktop
//	case diff
//	case dM
//	case dockerfile
//	case dogescript
//	case dTrace
//	case dylan
//	case e
//	case eagle
//	case eC
//	case ecere_Projects = "Ecere Projects"
//	case eCL
//	case edn
//	case eiffel
//	case elixir
//	case elm
//	case emacs_Lisp = "Emacs Lisp"
//	case emberScript
//	case erlang
//	case fSharp = "F#"
//	case factor
//	case fancy
//	case fantom
//	case fish
//	case fLUX
//	case formatted
//	case forth
//	case fORTRAN
//	case frege
//	case g_code = "G-code"
//	case game_Maker_Language = "Game Maker Language"
//	case gAMS
//	case gAP
//	case gAS
//	case gDScript
//	case genshi
//	case gentoo_Ebuild = "Gentoo Ebuild"
//	case gentoo_Eclass = "Gentoo Eclass"
//	case gettext_Catalog = "Gettext Catalog"
//	case gLSL
//	case glyph
//	case gnuplot
//	case golo
//	case gosu
//	case grace
//	case gradle
//	case grammatical_Framework = "Grammatical Framework"
//	case graph_Modeling_Language = "Graph Modeling Language"
//	case graphviz__DOT_ = "Graphviz (DOT)"
//	case groff
//	case groovy
//	case groovy_Server_Pages = "Groovy Server Pages"
//	case hack
//	case haml
//	case handlebars
//	case harbour
//	case haxe
//	case hTML_Django = "HTML+Django"
//	case hTML_ERB = "HTML+ERB"
//	case hTML_PHP = "HTML+PHP"
//	case hTTP
//	case hy
//	case iDL
//	case idris
//	case iGOR_Pro = "IGOR Pro"
//	case inform_7 = "Inform 7"
//	case iNI
//	case inno_Setup = "Inno Setup"
//	case io
//	case ioke
//	case iRC_log = "IRC log"
//	case isabelle
//	case j
//	case jade
//	case jasmin
//	case java_Server_Pages = "Java Server Pages"
//	case jSON
//	case jSON5
//	case jSONiq
//	case jSONLD
//	case julia
//	case kit
	case kotlin
//	case kRL
//	case labVIEW
//	case lasso
//	case latte
//	case lean
//	case less
//	case lFE
//	case lilyPond
//	case liquid
//	case literate_Agda = "Literate Agda"
//	case literate_CoffeeScript = "Literate CoffeeScript"
//	case literate_Haskell = "Literate Haskell"
//	case liveScript
//	case lLVM
//	case logos
//	case logtalk
//	case lOLCODE
//	case lookML
//	case loomScript
//	case lSL
//	case m
//	case makefile
//	case mako
//	case markdown
//	case mask
//	case mathematica
//	case maven_POM = "Maven POM"
//	case max
//	case mediaWiki
//	case mercury
//	case miniD
//	case mirah
//	case modelica
//	case monkey
//	case moocode
//	case moonScript
//	case mTML
//	case mUF
//	case mupad
//	case myghty
//	case nemerle
//	case nesC
//	case netLogo
//	case newLisp
//	case nginx
//	case nimrod
//	case ninja
//	case nit
//	case nix
//	case nL
//	case nSIS
//	case nu
//	case numPy
//	case objDump
//	case objective_CPlusPlus = "Objective-C++"
//	case objective_J = "Objective-J"
//	case oCaml
//	case omgrofl
//	case ooc
//	case opa
//	case opal
//	case openCL
//	case openEdge_ABL = "OpenEdge ABL"
//	case openSCAD
//	case org
//	case ox
//	case oxygene
//	case oz
//	case pan
//	case papyrus
//	case parrot
//	case parrot_Assembly = "Parrot Assembly"
//	case parrot_Internal_Representation = "Parrot Internal Representation"
//	case pascal
//	case pAWN
//	case perl6
//	case pigLatin
//	case pike
//	case pLpgSQL
//	case pLSQL
//	case pod
//	case pogoScript
//	case postScript
//	case powerShell
//	case processing
//	case prolog
//	case propeller_Spin = "Propeller Spin"
//	case protocol_Buffer = "Protocol Buffer"
//	case public_Key = "Public Key"
//	case puppet
//	case pure_Data = "Pure Data"
//	case pureBasic
//	case pureScript
//	case python_traceback = "Python traceback"
//	case qMake
//	case qML
//	case racket
//	case ragel_in_Ruby_Host = "Ragel in Ruby Host"
//	case rAML
//	case raw_token_data = "Raw token data"
//	case rDoc
//	case rEALbasic
//	case rebol
//	case red
//	case redcode
//	case reStructuredText
//	case rHTML
//	case rMarkdown
//	case robotFramework
//	case rouge
//	case rust
//	case sage
//	case saltStack
//	case sAS
//	case sass
//	case scaml
//	case scheme
//	case scilab
//	case sCSS
//	case self_ = "Self"
//	case shellSession
//	case shen
//	case slash
//	case slim
//	case smalltalk
//	case smarty
//	case sourcePawn
//	case sPARQL
//	case sQF
//	case sQL
//	case sQLPL
//	case squirrel
//	case standard_ML = "Standard ML"
//	case stata
//	case sTON
//	case stylus
//	case superCollider
//	case sVG
//	case systemVerilog
//	case tcl
//	case tcsh
//	case tea
	case text
//	case textile
//	case thrift
//	case tOML
//	case turing
//	case turtle
//	case twig
//	case tXL
//	case typeScript
//	case unified_Parallel_C = "Unified Parallel C"
//	case unrealScript
//	case vala
//	case vCL
//	case verilog
//	case vHDL
//	case visual_Basic = "Visual Basic"
//	case volt
//	case web_Ontology_Language = "Web Ontology Language"
//	case webIDL
//	case wisp
//	case xBase
//	case xC
//	case xML
//	case xojo
//	case xProc
//	case xQuery
//	case xS
//	case xSLT
//	case xtend
//	case yAML
//	case zephir
//	case zimpl
}

extension Language : LanguageType {
	
	public init<T:LanguageType>(_ value:T) {
	
		self = value.language
	}
	
	public static var all:Set<Language> {
	
		return _all
	}
	
	public var language:Language {
	
		return self
	}
	
	public var extname:String {
		
		switch self {
			
		case actionScript:
			return "as"
			
		case c:
			return "c"
			
		case cSharp:
			return "cs"
			
		case cPlusPlus:
			return "cpp"
			
		case clojure:
			return "clj"
			
		case coffeeScript:
			return "coffee"
			
		case cSS:
			return "css"
			
		case go:
			return "go"
			
		case haskell:
			return "hs"
			
		case hTML:
			return "html"
			
		case java:
			return "java"
			
		case javaScript:
			return "js"
			
		case lua:
			return "lua"

		case matlab:
			return "matlab"
			
		case objective_C:
			return "m"
			
		case perl:
			return "pl"
			
		case pHP:
			return "php"
			
		case python:
			return "py"
			
		case r:
			return "r"
			
		case ruby:
			return "rb"
			
		case scala:
			return "scala"
			
		case shell:
			return "sh"
			
		case swift:
			return "swift"
			
		case teX:
			return "tex"
			
		case vimL:
			return "vim"
			
		case aBAP:
			return "abap"
			
		case ada:
			return "adb"
			
		case agda:
			return "agda"
			
		case aGS_Script:
			return "asc"
			
		case alloy:
			return "als"
			
		case aMPL:
			return "ampl"
			
		case ant_Build_System:
			return ""
			
		case aNTLR:
			return "g4"
			
		case apacheConf:
			return "apacheconf"
			
		case apex:
			return "cls"
			
		case aPL:
			return "apl"
			
		case appleScript:
			return "applescript"
			
		case arc:
			return "arc"
			
		case arduino:
			return "ino"
			
		case asciiDoc:
			return "asciidoc"
			
		case aSP:
			return "asp"
			
		case aspectJ:
			return "aj"
			
		case assembly:
			return "asm"
			
		case aTS:
			return "dats"
			
		case augeas:
			return "aug"
			
		case autoHotkey:
			return "ahk"
			
		case autoIt:
			return "au3"
			
		case awk:
			return "awk"
			
		case batchfile:
			return "bat"
			
		case befunge:
			return "befunge"
			
		case bison:
			return "y"
			
		case bitBake:
			return "bb"
			
		case blitzBasic:
			return "bb"
			
		case blitzMax:
			return "bmx"
			
		case bluespec:
			return "bsv"
			
		case boo:
			return "boo"
			
		case brainfuck:
			return "b"
			
		case brightscript:
			return "brs"
			
		case bro:
			return "bro"
			
		case c_ObjDump:
			return "c-objdump"
			
//		case c2hs_Haskell = "C2hs Haskell"
//		case cap_n_Proto = "Cap'n Proto"
//		case cartoCSS
//		case ceylon
//		case chapel
//		case chucK
//		case cirru
//		case clean
//		case cLIPS
//		case cMake
//		case cOBOL
//		case coldFusion
//		case coldFusion_CFC = "ColdFusion CFC"
//		case common_Lisp = "Common Lisp"
//		case component_Pascal = "Component Pascal"
//		case cool
//		case coq
//		case cpp_ObjDump = "Cpp-ObjDump"
//		case creole
//		case crystal
//		case cucumber
//		case cuda
//		case cycript
//		case cython
//		case d
//		case d_ObjDump = "D-ObjDump"
//		case darcs_Patch = "Darcs Patch"
//		case dart
//		case desktop
//		case diff
//		case dM
//		case dockerfile
//		case dogescript
//		case dTrace
//		case dylan
//		case e
//		case eagle
//		case eC
//		case ecere_Projects = "Ecere Projects"
//		case eCL
//		case edn
//		case eiffel
//		case elixir
//		case elm
//		case emacs_Lisp = "Emacs Lisp"
//		case emberScript
//		case erlang
//		case fSharp = "F#"
//		case factor
//		case fancy
//		case fantom
//		case fish
//		case fLUX
//		case formatted
//		case forth
//		case fORTRAN
//		case frege
//		case g_code = "G-code"
//		case game_Maker_Language = "Game Maker Language"
//		case gAMS
//		case gAP
//		case gAS
//		case gDScript
//		case genshi
//		case gentoo_Ebuild = "Gentoo Ebuild"
//		case gentoo_Eclass = "Gentoo Eclass"
//		case gettext_Catalog = "Gettext Catalog"
//		case gLSL
//		case glyph
//		case gnuplot
//		case golo
//		case gosu
//		case grace
//		case gradle
//		case grammatical_Framework = "Grammatical Framework"
//		case graph_Modeling_Language = "Graph Modeling Language"
//		case graphviz__DOT_ = "Graphviz (DOT)"
//		case groff
//		case groovy
//		case groovy_Server_Pages = "Groovy Server Pages"
//		case hack
//		case haml
//		case handlebars
//		case harbour
//		case haxe
//		case hTML_Django = "HTML+Django"
//		case hTML_ERB = "HTML+ERB"
//		case hTML_PHP = "HTML+PHP"
//		case hTTP
//		case hy
//		case iDL
//		case idris
//		case iGOR_Pro = "IGOR Pro"
//		case inform_7 = "Inform 7"
//		case iNI
//		case inno_Setup = "Inno Setup"
//		case io
//		case ioke
//		case iRC_log = "IRC log"
//		case isabelle
//		case j
//		case jade
//		case jasmin
//		case java_Server_Pages = "Java Server Pages"
//		case jSON
//		case jSON5
//		case jSONiq
//		case jSONLD
//		case julia
//		case kit
		case kotlin:
			return "kt"
//		case kRL
//		case labVIEW
//		case lasso
//		case latte
//		case lean
//		case less
//		case lFE
//		case lilyPond
//		case liquid
//		case literate_Agda = "Literate Agda"
//		case literate_CoffeeScript = "Literate CoffeeScript"
//		case literate_Haskell = "Literate Haskell"
//		case liveScript
//		case lLVM
//		case logos
//		case logtalk
//		case lOLCODE
//		case lookML
//		case loomScript
//		case lSL
//		case m
//		case makefile
//		case mako
//		case markdown
//		case mask
//		case mathematica
//		case maven_POM = "Maven POM"
//		case max
//		case mediaWiki
//		case mercury
//		case miniD
//		case mirah
//		case modelica
//		case monkey
//		case moocode
//		case moonScript
//		case mTML
//		case mUF
//		case mupad
//		case myghty
//		case nemerle
//		case nesC
//		case netLogo
//		case newLisp
//		case nginx
//		case nimrod
//		case ninja
//		case nit
//		case nix
//		case nL
//		case nSIS
//		case nu
//		case numPy
//		case objDump
//		case objective_CPlusPlus = "Objective-C++"
//		case objective_J = "Objective-J"
//		case oCaml
//		case omgrofl
//		case ooc
//		case opa
//		case opal
//		case openCL
//		case openEdge_ABL = "OpenEdge ABL"
//		case openSCAD
//		case org
//		case ox
//		case oxygene
//		case oz
//		case pan
//		case papyrus
//		case parrot
//		case parrot_Assembly = "Parrot Assembly"
//		case parrot_Internal_Representation = "Parrot Internal Representation"
//		case pascal
//		case pAWN
//		case perl6
//		case pigLatin
//		case pike
//		case pLpgSQL
//		case pLSQL
//		case pod
//		case pogoScript
//		case postScript
//		case powerShell
//		case processing
//		case prolog
//		case propeller_Spin = "Propeller Spin"
//		case protocol_Buffer = "Protocol Buffer"
//		case public_Key = "Public Key"
//		case puppet
//		case pure_Data = "Pure Data"
//		case pureBasic
//		case pureScript
//		case python_traceback = "Python traceback"
//		case qMake
//		case qML
//		case racket
//		case ragel_in_Ruby_Host = "Ragel in Ruby Host"
//		case rAML
//		case raw_token_data = "Raw token data"
//		case rDoc
//		case rEALbasic
//		case rebol
//		case red
//		case redcode
//		case reStructuredText
//		case rHTML
//		case rMarkdown
//		case robotFramework
//		case rouge
//		case rust
//		case sage
//		case saltStack
//		case sAS
//		case sass
//		case scaml
//		case scheme
//		case scilab
//		case sCSS
//		case self_ = "Self"
//		case shellSession
//		case shen
//		case slash
//		case slim
//		case smalltalk
//		case smarty
//		case sourcePawn
//		case sPARQL
//		case sQF
//		case sQL
//		case sQLPL
//		case squirrel
//		case standard_ML = "Standard ML"
//		case stata
//		case sTON
//		case stylus
//		case superCollider
//		case sVG
//		case systemVerilog
//		case tcl
//		case tcsh
//		case tea
		case text:
			return "txt"
//
//		case textile
//		case thrift
//		case tOML
//		case turing
//		case turtle
//		case twig
//		case tXL
//		case typeScript
//		case unified_Parallel_C = "Unified Parallel C"
//		case unrealScript
//		case vala
//		case vCL
//		case verilog
//		case vHDL
//		case visual_Basic = "Visual Basic"
//		case volt
//		case web_Ontology_Language = "Web Ontology Language"
//		case webIDL
//		case wisp
//		case xBase
//		case xC
//		case xML
//		case xojo
//		case xProc
//		case xQuery
//		case xS
//		case xSLT
//		case xtend
//		case yAML
//		case zephir
//		case zimpl
		}
	}
}

extension Language : Decodable {
	
	public static func decode(e: Extractor) throws -> Language {
		
        let string = try String.decode(e)
        
        guard let result = Language(rawValue: string) else {
            
            throw DecodeError.TypeMismatch(expected: "\(DecodedType.self)", actual: "\(string)", keyPath: nil)
        }

        return result
	}
}

