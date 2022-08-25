import Foundation

public protocol FizzBuzzInterface {
    func generateFizzBuzzData(completion: @escaping (Bool, Any?, Error?) -> Void)
    func getFizzBuzzStartAndEndNumberFromUserDefaults() -> [FizzBuzzDataService]?
    func saveFizzBuzzStartAndEndNumberToUserDefaults(data: [FizzBuzzDataService])
}
