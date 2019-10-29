//
//  DataController.swift
//  AppDemo
//
//  Created by MAC on 29/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation

class DataController{
    weak var delegate: DataControllerDelegate?
    
    
    func requestData(fileName: String){
        guard var copyFileToPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            fatalError("Missing copy path in project!!!")
        }
        
        //Generate path
        copyFileToPath = copyFileToPath + fileName
        
        if loadFile(copyFileToPath: copyFileToPath) {
            let url = URL(fileURLWithPath: copyFileToPath)
            let jsonData = try! Data(contentsOf: url)
            let peopleList = try!JSONDecoder().decode([Person].self, from: jsonData)
            //Pass data to delegate
            self.delegate?.didReceivedPeople(people: peopleList)
        } else {
            print("Could not load file")
        }
    }
    
    private func loadFile(copyFileToPath: String)->Bool{
        
        if FileManager.default.fileExists(atPath: copyFileToPath) {
            print("people.json already exists in local !!!")
            return true
        }
        
     
        guard let copyFileFromUrl = Bundle.main.url(forResource: "people", withExtension: "json") else {
            fatalError("Missing people.json in project!!!")
        }
        
       do{
            try FileManager.default.copyItem(atPath: copyFileFromUrl.path, toPath: copyFileToPath)
        }catch{
            print("Could not copy file")
            return false
        }
        return true
    }
}
