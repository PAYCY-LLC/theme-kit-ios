import SwiftUI
import ThemeKit

struct ColorsView: View {
    private let itemPerRow: CGFloat = 3
    private let horizontalSpacing: CGFloat = 16
    private let height: CGFloat = 100

    private let items: [Item] = [
        Item(name: "Jacob", color: .themeJacob),
        Item(name: "Remus", color: .themeRemus),
        Item(name: "Lucian", color: .themeLucian),
        Item(name: "Gray", color: .themeGray),
        Item(name: "Lawrence", color: .themeLawrence),
        Item(name: "Leah", color: .themeLeah),
        Item(name: "Steel10", color: .themeSteel10),
        Item(name: "Steel20", color: .themeSteel20),
        Item(name: "Yellow", color: .themeYellow),
        Item(name: "Yellow20", color: .themeYellow20),
    ]

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0 ..< items.count, id: \.self) { i in
                            if i % Int(itemPerRow) == 0 {
                                buildRow(rowIndex: i, geometry: geometry)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Colors")
        }
    }

    private func buildRow(rowIndex: Int, geometry: GeometryProxy) -> RowView? {
        var rowItems = [Item]()

        for itemIndex in 0 ..< Int(itemPerRow) {
            if rowIndex + itemIndex < items.count {
                rowItems.append(items[rowIndex + itemIndex])
            }
        }

        if !rowItems.isEmpty {
            return RowView(items: rowItems, width: getWidth(geometry: geometry), height: height, horizontalSpacing: horizontalSpacing)
        }

        return nil
    }

    private func getWidth(geometry: GeometryProxy) -> CGFloat {
        let width: CGFloat = (geometry.size.width - horizontalSpacing * (itemPerRow + 1)) / itemPerRow
        return width
    }
}

extension ColorsView {
    struct Item: Identifiable {
        let id = UUID()
        let name: String
        let color: Color
    }

    struct RowView: View {
        let items: [Item]
        let width: CGFloat
        let height: CGFloat
        let horizontalSpacing: CGFloat

        var body: some View {
            HStack(spacing: horizontalSpacing) {
                ForEach(items) { item in
                    VStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(item.color)
                        Text(item.name)
                            .font(.caption)
                    }
                    .frame(width: width, height: height)
                }
            }
            .padding()
        }
    }
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView()

        ColorsView()
            .preferredColorScheme(.dark)
    }
}
