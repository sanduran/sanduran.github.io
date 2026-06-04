//
//  MemrApp.swift
//  Memr
//
//  Created by Şan Güneş Duran on 3.06.2026.
//

import SwiftUI

@main
struct MemrApp: App {
    var main = Main()
    var body: some Scene {
        WindowGroup {
            MainView(main: main)
        }
    }
}
