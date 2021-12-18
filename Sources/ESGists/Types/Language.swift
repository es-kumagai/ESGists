//
//  Language.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/19.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public enum Language : String, Codable, CaseIterable, Sendable {
	
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
	case objectiveC = "Objective-C"
	case perl = "Perl"
	case php = "PHP"
	case python = "Python"
	case r = "R"
	case ruby = "Ruby"
	case scala = "Scala"
	case shell = "Shell"
	case swift = "Swift"
	case tex = "TeX"
	case vimL = "VimL"

	case abap = "ABAP"
	case ada = "Ada"
	case agda = "Agda"
	case agsScript = "AGS Script"
	case alloy = "Alloy"
	case ampl = "AMPL"
	case antBuildSystem = "Ant Build System"
	case antlr = "ANTLR"
	case apacheConf = "ApacheConf"
	case apex = "Apex"
	case apl = "APL"
	case appleScript = "AppleScript"
	case arc = "Arc"
	case arduino = "Arduino"
	case asciiDoc = "AsciiDoc"
	case asp = "ASP"
	case aspectJ = "AspectJ"
	case assembly = "Assembly"
	case ats = "ATS"
	case augeas = "Augeas"
	case autoHotkey = "AutoHotkey"
	case autoIt = "AutoIt"
	case awk = "Awk"
	case batchfile = "Batchfile"
	case befunge = "Befunge"
	case bison = "Bison"
	case bitBake = "BitBake"
	case blitzBasic = "BlitzBasic"
	case blitzMax = "BlitzMax"
	case bluespec = "Bluespec"
	case boo = "Boo"
	case brainfuck = "Brainfuck"
	case brightscript = "Brightscript"
	case bro = "Bro"
	case cObjDump = "C-ObjDump"
//	case c2hsHaskell = "C2hs Haskell"
//	case capnProto = "Cap'n Proto"
//	case cartoCSS = "CartoCSS"
//	case ceylon = "Ceylon"
//	case chapel = "Chapel"
//	case chucK = "ChucK"
//	case cirru = "Cirru"
//	case clean = "Clean"
//	case clips = "CLIPS"
//	case cMake = "CMake"
//	case cobol = "COBOL"
//	case coldFusion = "ColdFusion"
//	case coldFusion_CFC = "ColdFusion CFC"
//	case commonLisp = "Common Lisp"
//	case component_Pascal = "Component Pascal"
//	case cool = "Cool"
//	case coq = "Coq"
//	case cppObjDump = "Cpp-ObjDump"
//	case creole = "Creole"
//	case crystal = "Crystal"
//	case cucumber = "Cucumber"
//	case cuda = "Cuda"
//	case cycript = "Cycript"
//	case cython = "Cython"
//	case d = "D"
//	case dObjDump = "D-ObjDump"
//	case darcsPatch = "Darcs Patch"
//	case dart = "Dart"
//	case desktop
//	case diff = "Diff"
//	case dm = "DM"
//	case dockerfile = "Dockerfile"
//	case dogescript = "Dogescript"
//	case dTrace = "DTrace"
//	case dylan = "Dylan"
//	case e = "E"
//	case eagle = "Eagle"
//	case eC = "eC"
//	case ecereProjects = "Ecere Projects"
//	case ecl = "ECL"
//	case edn
//	case eiffel = "Eiffel"
//	case elixir = "Elixir"
//	case elm = "Elm"
//	case emacsLisp = "Emacs Lisp"
//	case emberScript = "EmberScript"
//	case erlang = "Erlang"
//	case fSharp = "F#"
//	case factor = "Factor"
//	case fancy = "Fancy"
//	case fantom = "Fantom"
//	case fish
//	case flux = "FLUX"
//	case formatted = "Formatted"
//	case forth = "Forth"
//	case fortran = "FORTRAN"
//	case frege = "Frege"
//	case gCode = "G-code"
//	case gameMakerLanguage = "Game Maker Language"
//	case gams = "GAMS"
//	case gap = "GAP"
//	case gas = "GAS"
//	case gdScript = "GDScript"
//	case genshi = "Genshi"
//	case gentooEbuild = "Gentoo Ebuild"
//	case gentooEclass = "Gentoo Eclass"
//	case gettextCatalog = "Gettext Catalog"
//	case glsl = "GLSL"
//	case glyph = "Glyph"
//	case gnuplot = "Gnuplot"
//	case golo = "Golo"
//	case gosu = "Gosu"
//	case grace = "Grace"
//	case gradle = "Gradle"
//	case grammaticalFramework = "Grammatical Framework"
//	case graphModelingLanguage = "Graph Modeling Language"
//	case graphvizDOT = "Graphviz (DOT)"
//	case groff = "Groff"
//	case groovy = "Groovy"
//	case groovyServerPages = "Groovy Server Pages"
//	case hack = "Hack"
//	case haml = "Haml"
//	case handlebars = "Handlebars"
//	case harbour = "Harbour"
//	case haxe = "Haxe"
//	case htmlDjango = "HTML+Django"
//	case htmlERB = "HTML+ERB"
//	case htmlPHP = "HTML+PHP"
//	case http = "HTTP"
//	case hy = "Hy"
//	case idl = "IDL"
//	case idris = "Idris"
//	case igorPro = "IGOR Pro"
//	case inform7 = "Inform 7"
//	case ini = "INI"
//	case innoSetup = "Inno Setup"
//	case io = "Io"
//	case ioke = "Ioke"
//	case iRClog = "IRC log"
//	case isabelle = "Isabelle"
//	case j = "J"
//	case jade = "Jade"
//	case jasmin = "Jasmin"
//	case javaServerPages = "Java Server Pages"
//	case json = "JSON"
//	case json5 = "JSON5"
//	case jsonIq = "JSONiq"
//	case jsonLD = "JSONLD"
//	case julia = "Julia"
//	case kit = "Kit"
	case kotlin = "Kotlin"
//	case krl = "KRL"
//	case labVIEW = "LabVIEW"
//	case lasso = "Lasso"
//	case latte = "Latte"
//	case lean = "Lean"
//	case less = "Less"
//	case lFE = "LFE"
//	case lilyPond = "LilyPond"
//	case liquid = "Liquid"
//	case literateAgda = "Literate Agda"
//	case literateCoffeeScript = "Literate CoffeeScript"
//	case literateHaskell = "Literate Haskell"
//	case liveScript = "LiveScript"
//	case llvm = "LLVM"
//	case logos = "Logos"
//	case logtalk = "Logtalk"
//	case lolCODE = "LOLCODE"
//	case lookML = "LookML"
//	case loomScript = "LoomScript"
//	case lsl = "LSL"
//	case m = "M"
//	case makefile = "Makefile"
//	case mako = "Mako"
//	case markdown = "Markdown"
//	case mask = "Mask"
//	case mathematica = "Mathematica"
//	case mavenPOM = "Maven POM"
//	case max = "Max"
//	case mediaWiki = "MediaWiki"
//	case mercury = "Mercury"
//	case miniD = "MiniD"
//	case mirah = "Mirah"
//	case modelica = "Modelica"
//	case monkey
//	case moocode
//	case moonScript
//	case mtml = "MTML"
//	case muf = "MUF"
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
//	case nsis = "NSIS"
//	case nu
//	case numPy
//	case objDump
//	case objectiveCPlusPlus = "Objective-C++"
//	case objectiveJ = "Objective-J"
//	case oCaml = "OCaml"
//	case omgrofl
//	case ooc
//	case opa
//	case opal
//	case openCL
//	case openEdgeAbl = "OpenEdge ABL"
//	case openScad
//	case org
//	case ox
//	case oxygene
//	case oz
//	case pan
//	case papyrus
//	case parrot
//	case parrotAssembly = "Parrot Assembly"
//	case parrotInternalRepresentation = "Parrot Internal Representation"
//	case pascal
//	case pawn = "PAWN"
//	case perl6
//	case pigLatin
//	case pike
//	case plpgSQL = "PLpgSQL"
//	case plsql = "PLSQL"
//	case pod
//	case pogoScript
//	case postScript
//	case powerShell
//	case processing
//	case prolog
//	case propellerSpin = "Propeller Spin"
//	case protocolBuffer = "Protocol Buffer"
//	case publicKey = "Public Key"
//	case puppet
//	case pureData = "Pure Data"
//	case pureBasic
//	case pureScript
//	case python_traceback = "Python traceback"
//	case qMake
//	case qml = "QML"
//	case racket
//	case ragelInRubyHost = "Ragel in Ruby Host"
//	case raml = "RAML"
//	case rawTokenData = "Raw token data"
//	case rDoc
//	case realBasic = "REALbasic"
//	case rebol
//	case red
//	case redcode
//	case reStructuredText
//	case rhtml = "RHTML"
//	case rMarkdown
//	case robotFramework
//	case rouge
//	case rust
//	case sage
//	case saltStack
//	case sas = "SAS"
//	case sass
//	case scaml
//	case scheme
//	case scilab
//	case scss = "SCSS"
//	case self_ = "Self"
//	case shellSession
//	case shen
//	case slash
//	case slim
//	case smalltalk
//	case smarty
//	case sourcePawn
//	case sparql = "SPARQL"
//	case sqf = "SQF"
//	case sql = "SQL"
//	case sqlpl = "SQLPL"
//	case squirrel
//	case standardML = "Standard ML"
//	case stata
//	case ston = "STON"
//	case stylus
//	case superCollider
//	case svg = "SVG"
//	case systemVerilog
//	case tcl
//	case tcsh
//	case tea
	case text = "Text"
//	case textile
//	case thrift
//	case toml = "TOML"
//	case turing
//	case turtle
//	case twig
//	case txl = "TXL"
//	case typeScript
//	case unifiedParallelC = "Unified Parallel C"
//	case unrealScript
//	case vala
//	case vcl = "VCL"
//	case verilog
//	case vhdl = "VHDL"
//	case visualBasic = "Visual Basic"
//	case volt
//	case webOntologyLanguage = "Web Ontology Language"
//	case webIDL
//	case wisp
//	case xBase
//	case xc
//	case xml = "XML"
//	case xojo
//	case xProc
//	case xQuery
//	case xs
//	case xslt = "XSLT"
//	case xtend
//	case yaml = "YAML"
//	case zephir
//	case zimpl
}

extension Language : LanguageType {
	
	public init<T: LanguageType>(_ value: T) {
	
		self = value.language
	}
	
	public var language: Language {
	
		return self
	}
	
	public var extname: String {
		
		switch self {
			
		case .actionScript:
			return "as"
			
        case .c:
			return "c"
			
        case .cSharp:
			return "cs"
			
        case .cPlusPlus:
			return "cpp"
			
        case .clojure:
			return "clj"
			
        case .coffeeScript:
			return "coffee"
			
        case .css:
			return "css"
			
        case .go:
			return "go"
			
        case .haskell:
			return "hs"
			
        case .html:
			return "html"
			
        case .java:
			return "java"
			
        case .javaScript:
			return "js"
			
        case .lua:
			return "lua"

        case .matlab:
			return "matlab"
			
        case .objectiveC:
			return "m"
			
        case .perl:
			return "pl"
			
        case .php:
			return "php"
			
        case .python:
			return "py"
			
        case .r:
			return "r"
			
        case .ruby:
			return "rb"
			
        case .scala:
			return "scala"
			
        case .shell:
			return "sh"
			
        case .swift:
			return "swift"
			
        case .tex:
			return "tex"
			
        case .vimL:
			return "vim"
			
        case .abap:
			return "abap"
			
        case .ada:
			return "adb"
			
        case .agda:
			return "agda"
			
        case .agsScript:
			return "asc"
			
        case .alloy:
			return "als"
			
        case .ampl:
			return "ampl"
			
        case .antBuildSystem:
			return ""
			
        case .antlr:
			return "g4"
			
        case .apacheConf:
			return "apacheconf"
			
        case .apex:
			return "cls"
			
        case .apl:
			return "apl"
			
        case .appleScript:
			return "applescript"
			
        case .arc:
			return "arc"
			
        case .arduino:
			return "ino"
			
        case .asciiDoc:
			return "asciidoc"
			
        case .asp:
			return "asp"
			
        case .aspectJ:
			return "aj"
			
        case .assembly:
			return "asm"
			
        case .ats:
			return "dats"
			
        case .augeas:
			return "aug"
			
        case .autoHotkey:
			return "ahk"
			
        case .autoIt:
			return "au3"
			
        case .awk:
			return "awk"
			
        case .batchfile:
			return "bat"
			
        case .befunge:
			return "befunge"
			
        case .bison:
			return "y"
			
        case .bitBake:
			return "bb"
			
        case .blitzBasic:
			return "bb"
			
        case .blitzMax:
			return "bmx"
			
        case .bluespec:
			return "bsv"
			
        case .boo:
			return "boo"
			
        case .brainfuck:
			return "b"
			
        case .brightscript:
			return "brs"
			
        case .bro:
			return "bro"
			
        case .cObjDump:
			return "c-objdump"
			
//		case .c2hs_Haskell = "C2hs Haskell"
//		case .cap_n_Proto = "Cap'n Proto"
//		case .cartoCSS
//		case .ceylon
//		case .chapel
//		case .chucK
//		case cirru
//		case .clean
//		case .cLIPS
//		case .cMake
//		case .cOBOL
//		case .coldFusion
//		case .coldFusion_CFC = "ColdFusion CFC"
//		case .common_Lisp = "Common Lisp"
//		case .component_Pascal = "Component Pascal"
//		case .cool
//		case .coq
//		case .cpp_ObjDump = "Cpp-ObjDump"
//		case .creole
//		case .crystal
//		case .cucumber
//		case .cuda
//		case .cycript
//		case .cython
//		case .d
//		case .d_ObjDump = "D-ObjDump"
//		case .darcs_Patch = "Darcs Patch"
//		case .dart
//		case .desktop
//		case .diff
//		case .dM
//		case .dockerfile
//		case .dogescript
//		case .dTrace
//		case .dylan
//		case .e
//		case .eagle
//		case .eC
//		case .ecere_Projects = "Ecere Projects"
//		case .eCL
//		case .edn
//		case .eiffel
//		case .elixir
//		case .elm
//		case .emacs_Lisp = "Emacs Lisp"
//		case .emberScript
//		case .erlang
//		case .fSharp = "F#"
//		case .factor
//		case .fancy
//		case .fantom
//		case .fish
//		case .fLUX
//		case .formatted
//		case .forth
//		case .fORTRAN
//		case .frege
//		case .g_code = "G-code"
//		case .game_Maker_Language = "Game Maker Language"
//		case .gAMS
//		case .gAP
//		case .gAS
//		case .gDScript
//		case .genshi
//		case .gentoo_Ebuild = "Gentoo Ebuild"
//		case .gentoo_Eclass = "Gentoo Eclass"
//		case .gettext_Catalog = "Gettext Catalog"
//		case .gLSL
//		case .glyph
//		case .gnuplot
//		case .golo
//		case .gosu
//		case .grace
//		case .gradle
//		case .grammatical_Framework = "Grammatical Framework"
//		case .graph_Modeling_Language = "Graph Modeling Language"
//		case .graphviz__DOT_ = "Graphviz (DOT)"
//		case .groff
//		case .groovy
//		case .groovy_Server_Pages = "Groovy Server Pages"
//		case .hack
//		case .haml
//		case .handlebars
//		case .harbour
//		case .haxe
//		case .hTML_Django = "HTML+Django"
//		case .hTML_ERB = "HTML+ERB"
//		case .hTML_PHP = "HTML+PHP"
//		case .hTTP
//		case .hy
//		case .iDL
//		case .idris
//		case .iGOR_Pro = "IGOR Pro"
//		case .inform_7 = "Inform 7"
//		case .iNI
//		case .inno_Setup = "Inno Setup"
//		case .io
//		case .ioke
//		case .iRC_log = "IRC log"
//		case .isabelle
//		case .j
//		case .jade
//		case .jasmin
//		case .java_Server_Pages = "Java Server Pages"
//		case .jSON
//		case .jSON5
//		case .jSONiq
//		case .jSONLD
//		case .julia
//		case .kit
            
        case .kotlin:
			return "kt"
            
//		case .kRL
//		case .labVIEW
//		case .lasso
//		case .latte
//		case .lean
//		case .less
//		case .lFE
//		case .lilyPond
//		case .liquid
//		case .literate_Agda = "Literate Agda"
//		case .literate_CoffeeScript = "Literate CoffeeScript"
//		case .literate_Haskell = "Literate Haskell"
//		case .liveScript
//		case .lLVM
//		case .logos
//		case .logtalk
//		case .lOLCODE
//		case .lookML
//		case .loomScript
//		case .lSL
//		case .m
//		case .makefile
//		case .mako
//		case .markdown
//		case .mask
//		case .mathematica
//		case .maven_POM = "Maven POM"
//		case .max
//		case .mediaWiki
//		case .mercury
//		case .miniD
//		case .mirah
//		case .modelica
//		case .monkey
//		case .moocode
//		case .moonScript
//		case .mTML
//		case .mUF
//		case .mupad
//		case .myghty
//		case .nemerle
//		case .nesC
//		case .netLogo
//		case .newLisp
//		case .nginx
//		case .nimrod
//		case .ninja
//		case .nit
//		case .nix
//		case .nL
//		case .nSIS
//		case .nu
//		case .numPy
//		case .objDump
//		case .objective_CPlusPlus = "Objective-C++"
//		case .objective_J = "Objective-J"
//		case .oCaml
//		case .omgrofl
//		case .ooc
//		case .opa
//		case .opal
//		case .openCL
//		case .openEdge_ABL = "OpenEdge ABL"
//		case .openSCAD
//		case .org
//		case .ox
//		case .oxygene
//		case .oz
//		case .pan
//		case .papyrus
//		case .parrot
//		case .parrot_Assembly = "Parrot Assembly"
//		case .parrot_Internal_Representation = "Parrot Internal Representation"
//		case .pascal
//		case .pAWN
//		case .perl6
//		case .pigLatin
//		case .pike
//		case .pLpgSQL
//		case .pLSQL
//		case .pod
//		case .pogoScript
//		case .postScript
//		case .powerShell
//		case .processing
//		case .prolog
//		case .propeller_Spin = "Propeller Spin"
//		case .protocol_Buffer = "Protocol Buffer"
//		case .public_Key = "Public Key"
//		case .puppet
//		case .pure_Data = "Pure Data"
//		case .pureBasic
//		case .pureScript
//		case .python_traceback = "Python traceback"
//		case .qMake
//		case .qML
//		case .racket
//		case .ragel_in_Ruby_Host = "Ragel in Ruby Host"
//		case .rAML
//		case .raw_token_data = "Raw token data"
//		case .rDoc
//		case .rEALbasic
//		case .rebol
//		case .red
//		case .redcode
//		case .reStructuredText
//		case .rHTML
//		case .rMarkdown
//		case .robotFramework
//		case .rouge
//		case .rust
//		case .sage
//		case .saltStack
//		case .sAS
//		case .sass
//		case .scaml
//		case .scheme
//		case .scilab
//		case .sCSS
//		case .self_ = "Self"
//		case .shellSession
//		case .shen
//		case .slash
//		case .slim
//		case .smalltalk
//		case .smarty
//		case .sourcePawn
//		case .sPARQL
//		case .sQF
//		case .sQL
//		case .sQLPL
//		case .squirrel
//		case .standard_ML = "Standard ML"
//		case .stata
//		case .sTON
//		case .stylus
//		case .superCollider
//		case .sVG
//		case .systemVerilog
//		case .tcl
//		case .tcsh
//		case .tea
            
        case .text:
            return "txt"
//
//		case .textile
//		case .thrift
//		case .tOML
//		case .turing
//		case .turtle
//		case .twig
//		case .tXL
//		case .typeScript
//		case .unified_Parallel_C = "Unified Parallel C"
//		case .unrealScript
//		case .vala
//		case .vCL
//		case .verilog
//		case .vHDL
//		case .visual_Basic = "Visual Basic"
//		case .volt
//		case .web_Ontology_Language = "Web Ontology Language"
//		case .webIDL
//		case .wisp
//		case .xBase
//		case .xC
//		case .xML
//		case .xojo
//		case .xProc
//		case .xQuery
//		case .xS
//		case .xSLT
//		case .xtend
//		case .yAML
//		case .zephir
//		case .zimpl
        }
	}
}
