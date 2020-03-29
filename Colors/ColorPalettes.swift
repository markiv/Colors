//
//  ColorPalettes.swift
//  Colors
//
//  Created by Vikram Kriplaney on 28.03.2020.
//  Copyright © 2020 iPhonso GmbH. All rights reserved.
//

import SwiftUI

struct Palette: Identifiable {
    struct Color: Identifiable {
        let name: String
        let color: SwiftUI.Color
        var description: String?
        let id = UUID()

        init(_ name: String, _ color: SwiftUI.Color, _ description: String? = nil) {
            self.name = name
            self.color = color
            self.description = description
        }
    }

    let name: String
    var description: String?
    let colors: [Color]
    let id = UUID()
}

let swiftUiPalette = Palette(name: "SwiftUI Colors", description: "A set of colors that are used by system elements and applications.", colors: [
    .init("Color.clear", Color.clear),
    .init("Color.black", .black),
    .init("Color.white", .white),
    .init("Color.gray", .gray),
    .init("Color.red", .red),
    .init("Color.green", .green),
    .init("Color.blue", .blue),
    .init("Color.orange", .orange),
    .init("Color.yellow", .yellow),
    .init("Color.pink", .pink),
    .init("Color.purple", .purple),
    .init("Color.primary", .primary),
    .init("Color.secondary", .secondary),
    .init("Color.accentColor", .accentColor, "A color that represents the accent color in the environment it is evaluated. If an explicit value hasn't been set, the default system accent color will be used."),
])

let legacyPalette = Palette(name: "Legacy Colors", colors: [
    .init("UIColor.black", Color(UIColor.black)),
    .init("UIColor.darkGray", Color(UIColor.darkGray)),
    .init("UIColor.lightGray", Color(UIColor.lightGray)),
    .init("UIColor.white", Color(UIColor.white)),
    .init("UIColor.gray", Color(UIColor.gray)),
    .init("UIColor.red", Color(UIColor.red)),
    .init("UIColor.green", Color(UIColor.green)),
    .init("UIColor.blue", Color(UIColor.blue)),
    .init("UIColor.cyan", Color(UIColor.cyan)),
    .init("UIColor.yellow", Color(UIColor.yellow)),
    .init("UIColor.magenta", Color(UIColor.magenta)),
    .init("UIColor.orange", Color(UIColor.orange)),
    .init("UIColor.purple", Color(UIColor.purple)),
    .init("UIColor.brown", Color(UIColor.brown)),
    .init("UIColor.clear", Color(UIColor.clear)),
])

let systemPalette = Palette(name: "UIKit Colors", colors: [
    .init("UIColor.systemRed", Color(UIColor.systemRed), "A red color that automatically adapts to the current trait environment."),
    .init("UIColor.systemGreen", Color(UIColor.systemGreen), "A green color that automatically adapts to the current trait environment."),
    .init("UIColor.systemBlue", Color(UIColor.systemBlue), "A blue color that automatically adapts to the current trait environment."),
    .init("UIColor.systemOrange", Color(UIColor.systemOrange), "An organge color that automatically adapts to the current trait environment."),
    .init("UIColor.systemYellow", Color(UIColor.systemYellow), "A yellow color that automatically adapts to the current trait environment."),
    .init("UIColor.systemPink", Color(UIColor.systemPink), "A pink color that automatically adapts to the current trait environment."),
    .init("UIColor.systemPurple", Color(UIColor.systemPurple), "A purple color that automatically adapts to the current trait environment."),
    .init("UIColor.systemTeal", Color(UIColor.systemTeal), "A teal color that automatically adapts to the current trait environment."),
    .init("UIColor.systemIndigo", Color(UIColor.systemIndigo), "An indigo color that automatically adapts to the current trait environment."),
    .init("UIColor.systemGray", Color(UIColor.systemGray), "The base gray color. This color represents the standard system grey. It adapts to the current environment."),
    .init("UIColor.systemGray2", Color(UIColor.systemGray2), "A second-level shade of grey. This color adapts to the current environment. In light environments, this grey is slightly lighter than systemGray. In dark environments, this grey is slightly darker than systemGray."),
    .init("UIColor.systemGray3", Color(UIColor.systemGray3), "A third-level shade of grey. This color adapts to the current environment. In light environments, this grey is slightly lighter than systemGray2. In dark environments, this grey is slightly darker than systemGray2."),
    .init("UIColor.systemGray4", Color(UIColor.systemGray4), "A fourth-level shade of grey. This color adapts to the current environment. In light environments, this grey is slightly lighter than systemGray3. In dark environments, this grey is slightly darker than systemGray3."),
    .init("UIColor.systemGray5", Color(UIColor.systemGray5), "A fifth-level shade of grey. This color adapts to the current environment. In light environments, this grey is slightly lighter than systemGray4. In dark environments, this grey is slightly darker than systemGray4."),
    .init("UIColor.systemGray6", Color(UIColor.systemGray6), "A sixth-level shade of grey. This color adapts to the current environment, and is close in color to systemBackground. In light environments, this grey is slightly lighter than systemGray5. In dark environments, this grey is slightly darker than systemGray5."),
    .init("UIColor.label", Color(UIColor.label), "The color for text labels that contain primary content."),
    .init("UIColor.secondaryLabel", Color(UIColor.secondaryLabel), "The color for text labels that contain secondary content."),
    .init("UIColor.tertiaryLabel", Color(UIColor.tertiaryLabel), "The color for text labels that contain tertiary content."),
    .init("UIColor.quaternaryLabel", Color(UIColor.quaternaryLabel), "The color for text labels that contain quaternary content."),
    .init("UIColor.link", Color(UIColor.link), "The color for links."),
    .init("UIColor.placeholderText", Color(UIColor.placeholderText), "The color for placeholder text in controls or text views."),
    .init("UIColor.separator", Color(UIColor.separator), "The color for thin borders or divider lines that allows some underlying content to be visible. This color may be partially transparent to allow the underlying content to show through. It adapts to the underlying trait environment."),
    .init("UIColor.opaqueSeparator", Color(UIColor.opaqueSeparator), "The color for borders or divider lines that hides any underlying content. This color is always opaque. It adapts to the underlying trait environment."),
    .init("UIColor.systemBackground", Color(UIColor.systemBackground), "The color for the main background of your interface."),
    .init("UIColor.secondarySystemBackground", Color(UIColor.secondarySystemBackground), "The color for content layered on top of the main background."),
    .init("UIColor.tertiarySystemBackground", Color(UIColor.tertiarySystemBackground), "The color for content layered on top of secondary backgrounds."),
    .init("UIColor.systemGroupedBackground", Color(UIColor.systemGroupedBackground), "The color for the main background of your grouped interface."),
    .init("UIColor.secondarySystemGroupedBackground", Color(UIColor.secondarySystemGroupedBackground), "The color for content layered on top of the main background of your grouped interface."),
    .init("UIColor.tertiarySystemGroupedBackground", Color(UIColor.tertiarySystemGroupedBackground), "The color for content layered on top of secondary backgrounds of your grouped interface."),
    .init("UIColor.systemFill", Color(UIColor.systemFill), "An overlay fill color for thin and small shapes. Use system fill colors for items situated on top of an existing background color. System fill colors incorporate transparency to allow the background color to show through. Use this color to fill thin or small shapes, such as the track of a slider."),
    .init("UIColor.secondarySystemFill", Color(UIColor.secondarySystemFill), "An overlay fill color for medium-size shapes. Use system fill colors for items situated on top of an existing background color. System fill colors incorporate transparency to allow the background color to show through. Use this color to fill medium-size shapes, such as the background of a switch."),
    .init("UIColor.tertiarySystemFill", Color(UIColor.tertiarySystemFill), "An overlay fill color for large shapes."),
    .init("UIColor.quaternarySystemFill", Color(UIColor.quaternarySystemFill), "An overlay fill color for large areas that contain complex content. Use system fill colors for items situated on top of an existing background color. System fill colors incorporate transparency to allow the background color to show through. Use this color to fill large areas that contain complex content, such as an expanded table cell."),
    .init("UIColor.lightText", Color(UIColor.lightText), "The nonadaptable system color for text on a dark background. This color does not adapt to changes in the underlying trait environment."),
    .init("UIColor.darkText", Color(UIColor.darkText), "The nonadaptable system color for text on a light background. This color does not adapt to changes in the underlying trait environment."),
    .init("UIColor.groupTableViewBackground", Color(UIColor.groupTableViewBackground), "The system color to use for the background of a grouped table. Deprecated in iOS 13.0"),
])

let palettes = [swiftUiPalette, legacyPalette, systemPalette]
