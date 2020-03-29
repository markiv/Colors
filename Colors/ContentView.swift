//
//  ContentView.swift
//  Colors
//
//  Created by Vikram Kriplaney on 07.03.2020.
//  Copyright © 2020 iPhonso GmbH. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var oppositeScheme: ColorScheme {
        colorScheme == .dark ? .light : .dark
    }
    @Environment(\.colorSchemeContrast) var colorSchemeContrast: ColorSchemeContrast
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
                color.colorScheme(oppositeScheme)
            }
        }
    }

    func colorDetail(color: Palette.Color) -> some View {
        let current = colorScheme == .dark ? "Dark Mode (Current)" : "Light Mode (Current)"
        let opposite = colorScheme == .light ? "Dark Mode" : "Light Mode"

        return
            ZStack {
                VStack {
                    checkerboard.opacity(0)
                    checkerboard
                }
                HStack(spacing: 0) {
                    color.color.overlay(Text(current).bold().foregroundColor(.white).shadow(color: .black, radius: 1.5))
                    color.color.overlay(Text(opposite).bold().foregroundColor(.white).shadow(color: .black, radius: 1.5))
                        .colorScheme(oppositeScheme)
                }
                .font(.title)
                .multilineTextAlignment(.center)

                if color.description != nil {
                    VStack {
                        Text(color.description ?? "").padding()
                            .background(Color(UIColor.tertiarySystemBackground)
                                .cornerRadius(10).opacity(0.75).shadow(radius: 2))
                            .padding()
                        Spacer()
                    }
                }
            }
            .navigationBarItems(trailing: checkerboardToggle)
            .navigationBarTitle(color.name)
            .edgesIgnoringSafeArea(.bottom)
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
                ForEach(palettes) { palette in
                    Section(header: Text(palette.name)) {
                        ForEach(palette.colors) { c in
                            NavigationLink(destination: LazyView(self.colorDetail(color: c))) {
                                Text(c.name).bold().foregroundColor(.white)
                                    .shadow(color: .black, radius: 1.5)
                                    .padding(4)
                            }.listRowBackground(self.backgroundSwatch(color: c.color))
                        }
                    }
                }
            }
            //.listStyle(GroupedListStyle())
            .navigationBarTitle("Colors")
            .navigationBarItems(trailing: self.checkerboardToggle)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().colorDetail(color: systemPalette.colors[21])
            ContentView().backgroundSwatch(color: .blue)
            Image("checkerboard").resizable(resizingMode: .tile)
        }
    }
}
#endif

struct LazyView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: some View {
        build()
    }
}

