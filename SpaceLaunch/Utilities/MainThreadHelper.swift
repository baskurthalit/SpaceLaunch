//
//  MainThreadHelper.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


func inMainAsync(delay: TimeInterval = 0, codeBlock: @escaping () -> Void) {
    DispatchQueue.main
        .asyncAfter(deadline: .now() + delay) { codeBlock() }
}
