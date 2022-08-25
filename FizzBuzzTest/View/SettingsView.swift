import SwiftUI

struct SettingsView: View {
    @State private var startNumber: String = ""
    @State private var endNumber: String = ""
    @EnvironmentObject var data: FizzBuzzDataArray
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Numbers")) {
                    HStack {
                        Text("Start Number")
                        TextField(String(Constants.startNumber), text: $startNumber)
                            .keyboardType(.numberPad)
                            .onChange(of: startNumber) { newValue in
                                getNumbers()
                            }
                    }
                    HStack {
                        Text("End Number")
                        TextField(String(Constants.endNumber), text: $endNumber)
                            .keyboardType(.numberPad)
                            .onChange(of: endNumber) { newValue in
                                getNumbers()
                        }
                    }
                }
            }
            .onTapGesture {
                        hideKeyboard()
                        getNumbers()
                }
            
            .navigationTitle("Settings")
            .environmentObject(data)
            .onAppear {
                getFizzBuzzStartAndEndNumberFromUserDefaults()
                getNumbers()
            }
        }
    }
    
    func getNumbers() {
        self.data.dataArray[0].startNumber = Int64(startNumber) ?? Constants.startNumber
        self.data.dataArray[0].endNumber = Int64 (endNumber) ?? Constants.endNumber
        saveFizzBuzzStartAndEndNumberToUserDefaults()
    }
    
    func saveFizzBuzzStartAndEndNumberToUserDefaults() {
        var dataArray = [FizzBuzzDataService]()
        let data = FizzBuzzDataService()
        data.startNumber = self.data.dataArray[0].startNumber
        data.endNumber = self.data.dataArray[0].endNumber
        if self.data.dataArray[0].startNumber! > self.data.dataArray[0].endNumber! {
            data.endNumber = self.data.dataArray[0].startNumber
            data.startNumber = self.data.dataArray[0].endNumber
        }
        dataArray.append(data)
        data.saveFizzBuzzStartAndEndNumberToUserDefaults(data: dataArray)
    }
    
    func getFizzBuzzStartAndEndNumberFromUserDefaults() {
        let data = FizzBuzzDataService()
        if let getDataArray = data.getFizzBuzzStartAndEndNumberFromUserDefaults() {
                self.startNumber = String(getDataArray[0].startNumber ?? Constants.startNumber)
                self.endNumber = String(getDataArray[0].endNumber ?? Constants.endNumber)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(data: .init())
    }
}
