//
//  ContentView.swift
//  Colors
//
//  Created by Vikram Kriplaney on 07.03.2020.
//  Copyright © 2020 iPhonso GmbH. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let colors: [(String, Color)] = [
        ("Color.clear", Color.clear),
        ("Color.black", .black),
        ("Color.white", .white),
        ("Color.gray", .gray),
        ("Color.red", .red),
        ("Color.green", .green),
        ("Color.blue", .blue),
        ("Color.orange", .orange),
        ("Color.yellow", .yellow),
        ("Color.pink", .pink),
        ("Color.purple", .purple),
        ("Color.primary", .primary),
        ("Color.secondary", .secondary),
        ("Color.accentColor", .accentColor),

        ("UIColor.black", Color(UIColor.black)),
        ("UIColor.darkGray", Color(UIColor.darkGray)),
        ("UIColor.lightGray", Color(UIColor.lightGray)),
        ("UIColor.white", Color(UIColor.white)),
        ("UIColor.gray", Color(UIColor.gray)),
        ("UIColor.red", Color(UIColor.red)),
        ("UIColor.green", Color(UIColor.green)),
        ("UIColor.blue", Color(UIColor.blue)),
        ("UIColor.cyan", Color(UIColor.cyan)),
        ("UIColor.yellow", Color(UIColor.yellow)),
        ("UIColor.magenta", Color(UIColor.magenta)),
        ("UIColor.orange", Color(UIColor.orange)),
        ("UIColor.purple", Color(UIColor.purple)),
        ("UIColor.brown", Color(UIColor.brown)),
        ("UIColor.clear", Color(UIColor.clear)),

        ("UIColor.systemRed", Color(UIColor.systemRed)),
        ("UIColor.systemGreen", Color(UIColor.systemGreen)),
        ("UIColor.systemBlue", Color(UIColor.systemBlue)),
        ("UIColor.systemOrange", Color(UIColor.systemOrange)),
        ("UIColor.systemYellow", Color(UIColor.systemYellow)),
        ("UIColor.systemPink", Color(UIColor.systemPink)),
        ("UIColor.systemPurple", Color(UIColor.systemPurple)),
        ("UIColor.systemTeal", Color(UIColor.systemTeal)),
        ("UIColor.systemIndigo", Color(UIColor.systemIndigo)),
        ("UIColor.systemGray", Color(UIColor.systemGray)),
        ("UIColor.systemGray2", Color(UIColor.systemGray2)),
        ("UIColor.systemGray3", Color(UIColor.systemGray3)),
        ("UIColor.systemGray4", Color(UIColor.systemGray4)),
        ("UIColor.systemGray5", Color(UIColor.systemGray5)),
        ("UIColor.systemGray6", Color(UIColor.systemGray6)),
        ("UIColor.label", Color(UIColor.label)),
        ("UIColor.secondaryLabel", Color(UIColor.secondaryLabel)),
        ("UIColor.tertiaryLabel", Color(UIColor.tertiaryLabel)),
        ("UIColor.quaternaryLabel", Color(UIColor.quaternaryLabel)),
        ("UIColor.link", Color(UIColor.link)),
        ("UIColor.placeholderText", Color(UIColor.placeholderText)),
        ("UIColor.separator", Color(UIColor.separator)),
        ("UIColor.opaqueSeparator", Color(UIColor.opaqueSeparator)),
        ("UIColor.systemBackground", Color(UIColor.systemBackground)),
        ("UIColor.secondarySystemBackground", Color(UIColor.secondarySystemBackground)),
        ("UIColor.tertiarySystemBackground", Color(UIColor.tertiarySystemBackground)),
        ("UIColor.systemGroupedBackground", Color(UIColor.systemGroupedBackground)),
        ("UIColor.secondarySystemGroupedBackground", Color(UIColor.secondarySystemGroupedBackground)),
        ("UIColor.tertiarySystemGroupedBackground", Color(UIColor.tertiarySystemGroupedBackground)),
        ("UIColor.systemFill", Color(UIColor.systemFill)),
        ("UIColor.secondarySystemFill", Color(UIColor.secondarySystemFill)),
        ("UIColor.tertiarySystemFill", Color(UIColor.tertiarySystemFill)),
        ("UIColor.quaternarySystemFill", Color(UIColor.quaternarySystemFill)),
        ("UIColor.lightText", Color(UIColor.lightText)),
        ("UIColor.darkText", Color(UIColor.darkText)),
        ("UIColor.groupTableViewBackground", Color(UIColor.groupTableViewBackground)),
    ]

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var isShowingCheckerboard = true

    var checkerboard: some View {
        if isShowingCheckerboard {
            return AnyView(Image("checkerboard").resizable(resizingMode: .tile))
        }
        return AnyView(EmptyView())
    }

    func backgroundSwatch(color: Color) -> some View {
        ZStack {
            checkerboard
            HStack(spacing: 0) {
                color
                color.environment(\.colorScheme, colorScheme == .dark ? .light : .dark)
            }
        }
    }

    func colorDetail(color: Color) -> some View {
        let current = colorScheme == .dark ? "Dark" : "Light"
        let alternate = colorScheme == .light ? "Dark" : "Light"

        return
            ZStack {
                checkerboard
                HStack(spacing: 0) {
                    color.overlay(Text(current).bold().foregroundColor(.white).shadow(color: .black, radius: 1.5))
                    color.overlay(Text(alternate).bold().foregroundColor(.white).shadow(color: .black, radius: 1.5))
                        .environment(\.colorScheme, colorScheme == .dark ? .light : .dark)
                }
            }.navigationBarItems(trailing: checkerboardToggle)
    }

    var checkerboardToggle: some View {
        Button(action: {
            self.isShowingCheckerboard.toggle()
        }) {
            ZStack {
                Image("checkerboard").renderingMode(.original)
                if isShowingCheckerboard {
                    Color.accentColor.blendMode(.hardLight)
                }
            }
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(colors, id: \.0) { color in
                    NavigationLink(destination: self.colorDetail(color: color.1).navigationBarTitle(color.0)) {
                        Text(color.0).bold()
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1.5)
                            .padding(4)
                    }
                    .listRowBackground(self.backgroundSwatch(color: color.1).labelsHidden())
                }
            }
            .navigationBarTitle("Colors")
            .navigationBarItems(trailing: checkerboardToggle)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        Image("checkerboard").resizable(resizingMode: .tile)
    }
}
