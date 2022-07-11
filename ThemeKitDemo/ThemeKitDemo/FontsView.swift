import SwiftUI
import ThemeKit

struct FontsView: View {
    private let items: [Item] = [
        Item(name: "Title1", font: .themeTitle1),
        Item(name: "Title2", font: .themeTitle2),
        Item(name: "Title2R", font: .themeTitle2R),
        Item(name: "Title3", font: .themeTitle3),
        Item(name: "Headline1", font: .themeHeadline1),
        Item(name: "Headline2", font: .themeHeadline2),
        Item(name: "Body", font: .themeBody),
        Item(name: "Subhead1", font: .themeSubhead1),
        Item(name: "Subhead1I", font: .themeSubhead1I),
        Item(name: "Subhead2", font: .themeSubhead2),
        Item(name: "Caption", font: .themeCaption),
        Item(name: "CaptionSB", font: .themeCaptionSB),
        Item(name: "Micro", font: .themeMicro),
        Item(name: "MicroSB", font: .themeMicroSB),
    ]

    var body: some View {
        NavigationView {
            List(items) { item in
                HStack {
                    Text(item.name)
                        .font(item.font)
                }
            }
            .navigationTitle("Fonts")
        }
    }
}

extension FontsView {
    struct Item: Identifiable {
        let id = UUID()
        let name: String
        let font: Font
    }
}

struct FontsView_Previews: PreviewProvider {
    static var previews: some View {
        FontsView()

        FontsView()
            .preferredColorScheme(.dark)
    }
}
