//
//  Helpers.swift
//  Fraktal Band
//
//  Created by Anton Siliuk on 13.05.2018.
//  Copyright © 2018 Anton Siliuk. All rights reserved.
//

import Foundation
import ReactiveSwift
import enum Result.NoError
import FraktalBandUI

//================================================PROPERTY================================
extension Property where Value == DanceMove {
    convenience init(lyrics: Song.Lyrics, on scheduler: DateScheduler) {
        self.init(
            initial: .center,
            then: SignalProducer(lyrics: lyrics, on: scheduler).map { _ in Value.all.random() }
        )
    }
}

extension Property where Value == String {
    convenience init(lyrics: Song.Lyrics, on scheduler: DateScheduler) {
        self.init(
            initial: "",
            then: SignalProducer(lyrics: lyrics, on: scheduler)
        )
    }
}

//================================================SIGNAL PRODUCER================================
extension SignalProducer where Value == String, Error == NoError {
    init(lyrics: Song.Lyrics, on scheduler: DateScheduler) {
        self = SignalProducer(lyrics)
            .flatMap(.concat) { SignalProducer(value: $0).concat(SignalProducer.empty.delay($0.delay, on: scheduler)) }
    }
}


//================================================STAFF================================
extension Song.Genre {
    var strength: Double {
        switch self {
        case .drama: return 1
        case .pop: return 2
        case .punk: return 3
        case .rockNroll: return 4
        case .filipKirkorov: return 10
        }
    }
}

extension Song.Lyrics.Element {
    var delay: TimeInterval {
        return TimeInterval(self.count) * 0.2
    }
}

extension RandomAccessCollection where Indices.Index == Int {
    func random() -> Element {
        let index = Int(arc4random()) % self.endIndex
        return self[index]
    }
}

extension Array where Element == String {
    init(lyrics: String) {
        self = lyrics
            .components(separatedBy: CharacterSet.letters.inverted)
            .filter { !$0.isEmpty }
    }
}
