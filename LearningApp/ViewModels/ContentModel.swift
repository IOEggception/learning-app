//
//  ContentModel.swift
//  LearningApp
//
//  Created by Sean.Lacey on 3/10/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    //Current Module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
    }
    
    // MARK: - Data Methods
    func getLocalData() {
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            let decoder = JSONDecoder()
            
            do{
                let modules = try decoder.decode([Module].self, from: jsonData)
                self.modules = modules
            }
            catch {
                print("Error decoding into module array")
            }
        }
        catch {
            print("Error turning url to data")
        }
        
        // Parse style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            self.styleData = try Data(contentsOf: styleUrl!)
        } catch {
            print("error converting style URL to data")
        }
    }
    
    
    // MARK: - Module Navigation Methods
    func beginModule(_ moduleId: Int) {
        
        // Find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                //Found matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
}
