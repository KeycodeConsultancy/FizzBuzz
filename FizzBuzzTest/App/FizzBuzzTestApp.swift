import SwiftUI
import Foundation

@main
struct FizzBuzzTestApp: App {
    fileprivate func getDefaultNumbers() {
        let data = FizzBuzzDataService()
        if data.getFizzBuzzStartAndEndNumberFromUserDefaults() == nil {
            print("Saves 1 to 100 numbers for the very first time..")
            var dataArray = [FizzBuzzDataService]()
            data.startNumber = Int64(Constants.startNumber)
            data.endNumber = Int64(Constants.endNumber)
            dataArray.append(data)
            data.saveFizzBuzzStartAndEndNumberToUserDefaults(data: dataArray)
        }
    }
    
    init() {
        getDefaultNumbers()
    }
    
    var body: some Scene {
        WindowGroup {
            MainMenuView()
        }
    }
}
