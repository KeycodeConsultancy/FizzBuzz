import Foundation
import SwiftUI
import Combine

internal class FizzBuzzDataArray: ObservableObject {
    @Published var dataArray = [FizzBuzzDataService]()
    var data: FizzBuzzDataService!
    init() {
        self.data = FizzBuzzDataService()
        self.dataArray = []
        self.dataArray.append(data)
    }
}
