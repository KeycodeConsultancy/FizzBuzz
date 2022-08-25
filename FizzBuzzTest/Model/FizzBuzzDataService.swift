import Foundation
import SwiftUI

public class FizzBuzzDataService: Identifiable, Codable, FizzBuzzInterface {
    
    public func saveFizzBuzzStartAndEndNumberToUserDefaults(data: [FizzBuzzDataService]) {
        self.saveObjectArray(data: data)
    }
    
    public func getFizzBuzzStartAndEndNumberFromUserDefaults() -> [FizzBuzzDataService]? {
        return getObjectArrayFromUserDefaults()
    }
    
    public func generateFizzBuzzData(completion: @escaping (Bool, Any?, Error?) -> Void) {
        DispatchQueue.global().async {
            self.fizzBuzz { _, data, _ in
            completion(true, data, nil)
           }
       }
    }

    public var id = UUID()
    var startNumber: Int64?
    var endNumber: Int64?

    init(){}
    
    fileprivate var nNumber: Int64 {
        startNumber ?? Int64(Constants.startNumber)
    }
    
    fileprivate var mNumber: Int64 {
        endNumber ?? Int64(Constants.endNumber)
    }
    
    fileprivate func fizzBuzz(completion: @escaping (Bool, Any?, Error?) -> Void) {
        var values = [String]()
        values = []
      
        DispatchQueue.global(qos: .background).async {
            for i in stride(from: self.nNumber, through: self.mNumber, by: 1) {
                var output = ""
                if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
                    output.append(FizzBuzz.Fizz.rawValue + FizzBuzz.Buzz.rawValue)
                } else if i.isMultiple(of: 3) {
                    output.append(FizzBuzz.Fizz.rawValue)
                } else if i.isMultiple(of: 5) {
                    output.append(FizzBuzz.Buzz.rawValue)
                } else if output == "" {
                    output = String(i)
                }
                DispatchQueue.main.async {
                    values.append(String(output))
                }
            }
            DispatchQueue.main.async {
                completion(true, values, nil)
            }
        }
    }
    
    fileprivate func saveObjectArray(data: [FizzBuzzDataService]) {
        DispatchQueue.global(qos: .background).async {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(data), forKey:"data")
        }
     }
    
    fileprivate func getObjectArrayFromUserDefaults() -> [FizzBuzzDataService]? {
         if let data = UserDefaults.standard.value(forKey:"data") as? Data {
             let dataList = try? PropertyListDecoder().decode(Array<FizzBuzzDataService>.self, from: data)
             return dataList
         }
         return nil
     }
}
