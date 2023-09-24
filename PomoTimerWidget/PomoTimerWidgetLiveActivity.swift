//
//  PomoTimerWidgetLiveActivity.swift
//  PomoTimerWidget
//
//  Created by Sravan Karuturi on 9/23/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PomoTimerWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PomoTimerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PomoTimerWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PomoTimerWidgetAttributes {
    fileprivate static var preview: PomoTimerWidgetAttributes {
        PomoTimerWidgetAttributes(name: "World")
    }
}

extension PomoTimerWidgetAttributes.ContentState {
    fileprivate static var smiley: PomoTimerWidgetAttributes.ContentState {
        PomoTimerWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PomoTimerWidgetAttributes.ContentState {
         PomoTimerWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PomoTimerWidgetAttributes.preview) {
   PomoTimerWidgetLiveActivity()
} contentStates: {
    PomoTimerWidgetAttributes.ContentState.smiley
    PomoTimerWidgetAttributes.ContentState.starEyes
}
