//
//  GistFile.swift
//  APIKit
//
//  Created by Tomohiro Kumagai on 2020/01/28.
//

extension Gist {
    
    public struct File {
        
        var name: Filename
        var info: FileInfo
    }
    
    public struct Files {

        var data: [File]
    }
}

extension Gist.Files : Decodable {
    
    public init(from decoder: Decoder) throws {
        
        var container = try decoder.unkeyedContainer()
        
        data = try container.decode([Gist.Filename : Gist.FileInfo].self).map { name, info in
            
            Gist.File(name: name, info: info)
        }
    }
}
