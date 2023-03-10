//
//  ContentModel.swift
//  LearningApp
//
//  Created by Sean.Lacey on 3/10/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init() {
        
        getLocalData()
    }
    
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
}
