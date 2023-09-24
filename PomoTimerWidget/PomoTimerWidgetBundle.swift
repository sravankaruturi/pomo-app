//
//  PomoTimerWidgetBundle.swift
//  PomoTimerWidget
//
//  Created by Sravan Karuturi on 9/23/23.
//

import WidgetKit
import SwiftUI

@main
struct PomoTimerWidgetBundle: WidgetBundle {
    var body: some Widget {
        PomoTimerWidget()
        PomoTimerWidgetLiveActivity()
    }
}
