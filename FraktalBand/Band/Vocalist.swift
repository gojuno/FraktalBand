//
//  Soloist.swift
//  Fraktal Band
//
//  Created by Anton Siliuk on 09.05.2018.
//  Copyright © 2018 Anton Siliuk. All rights reserved.
//

import Foundation

import FraktalSimplified
import ReactiveSwift
import FraktalBandUI

// sourcery: presentable
final class Vocalist {

    init(song: Property<Song>, on scheduler: DateScheduler) {
        self.dance = VocalistDance(lyrics: song.map { $0.lyrics }, on: scheduler)
        self.voice = VocalistVoice(lyrics: song.map { $0.lyrics }, genre: song.map { $0.genre }, on: scheduler)
    }

    // sourcery:begin: presentable
    private let dance: VocalistDance
    private let voice: VocalistVoice
    // sourcery:end
}

// sourcery:inline:Vocalist.Presentable
// swiftlint:disable line_length
extension Vocalist: Presentable {

    internal var present: (VocalistPresenters) -> Disposable? {
        return { [weak self] presenters in
            guard let sself = self else { return nil }
            let disposable = CompositeDisposable()
            disposable += presenters.dance.present(sself.dance)
            disposable += presenters.voice.present(sself.voice)
            return disposable
        }
    }
}
// swiftlint:enable line_length
// sourcery:end
