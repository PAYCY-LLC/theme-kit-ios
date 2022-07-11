import SwiftUI
import ThemeKitSwitfUI

struct ContentView: View {
    var body: some View {
        TabView {
            ColorsView()
                .tabItem {
                    Label("Colors", systemImage: "list.dash")
                }

            FontsView()
                .tabItem {
                    Label("Fonts", systemImage: "list.dash")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        ContentView()
            .preferredColorScheme(.dark)
    }
}
