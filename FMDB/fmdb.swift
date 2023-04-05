//
//  fmdb.swift
//  FMDB
//
//  Created by R94 on 04/04/23.
//

import Foundation
import CoreImage

struct Model
{
    var id:Int
    var name: String
}
class fmdbHelper
{
    static var file :FMDatabase!
    
    static func createFile()
    {
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("FMDB File1.db")
        file = FMDatabase(url: x)
        file.open()
        print(x.path)
        createTable()
    }
    static func createTable()
    {
        let q = "Create Table if not exists Students(id integer,name text)"
        try? file.executeUpdate(q, values: nil)
        print("create Table")
    }
    static func addData(id:Int,name:String)
    {
        let q = "insert into Students values (\(id),'\(name)')"
        try? file.executeUpdate(q, values: [id,name])
        print("add Data")
    }
    static func getData()->[Model]
    {
        var arr = [Model]()
        let q = "select * from Students"
        if let data = try? file.executeQuery(q, values: nil)
        {
            while data.next()
            {
                let id = data.object(forColumn: "id") as? Int ?? 0
                let name = data.object(forColumn: "name") as? String ?? ""
                let obj = Model(id: id, name: name)
                arr.append(obj)
            }
        }
        return arr
    }
    static func deleteData(id:Int,name:String)
    {
        let q = "DELETE FROM Students WHERE id = \(id)"
        try? file.executeUpdate(q, values: [id,name])
        print("delete data")
    }
}
