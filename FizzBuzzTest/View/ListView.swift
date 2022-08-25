import SwiftUI

struct ListRow: View {
   
    let row: String
    init(row: String){
        self.row = row
    }
    var body: some View {
        Text("\(row)")
    }
}

struct ListView: View {
    @State private var data: FizzBuzzDataService!
    @State private var values = [String]()
    var body: some View {
    NavigationView {
        ScrollView {
            LazyVStack {
                ForEach(values.indices, id: \.self) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            ListRow(row: values[index])
                        }
                        Spacer()
                    }
                }
            }
            .padding()
        }
            .navigationTitle("Data List")
            .onAppear {
                values.removeAll()
                data = FizzBuzzDataService()
                getFizzBuzzStartAndEndNumberFromUserDefaults()
                //data.startNumber =  (data.startNumber) ?? Constants.startNumber
                //data.endNumber =  (data.endNumber) ?? Constants.endNumber
                DispatchQueue.global(qos: .background).async {
                    data?.generateFizzBuzzData { _, data, _ in
                    DispatchQueue.main.async {
                        values = data as! [String]
                    }
                }
              }
           }
        }
    }
    
    func getFizzBuzzStartAndEndNumberFromUserDefaults() {
        let obj = FizzBuzzDataService()
        if let getDataArray = obj.getFizzBuzzStartAndEndNumberFromUserDefaults() {
            data?.startNumber = (getDataArray[0].startNumber ?? Constants.startNumber)
            data?.endNumber = (getDataArray[0].endNumber ?? Constants.endNumber)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
