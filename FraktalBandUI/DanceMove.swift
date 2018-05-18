//
//  DanceMove.swift
//  FraktalBandUI
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import Foundation

public enum DanceMove {
    case up, down, left, right, center

    public static let all: [DanceMove] = [.up, .down, .left, .right, .center]
}
