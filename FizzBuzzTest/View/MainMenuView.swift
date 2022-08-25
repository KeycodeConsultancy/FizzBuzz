import SwiftUI
struct MainMenuView: View {
    var data = FizzBuzzDataArray()
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Data List", systemImage: "list.number")
                }.navigationViewStyle(StackNavigationViewStyle())
            
                SettingsView(data: .init())
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }.navigationViewStyle(StackNavigationViewStyle())
        }
        .environmentObject(data)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
