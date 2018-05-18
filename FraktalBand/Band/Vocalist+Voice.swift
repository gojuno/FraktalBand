//
//  Vocalist+Voice.swift
//  FraktalBand
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import Foundation

import FraktalSimplified
import ReactiveSwift
import FraktalBandUI

final class VocalistVoice {

    init(lyrics: Property<Song.Lyrics>, genre: Property<Song.Genre>, on scheduler: DateScheduler) {
        self.word = lyrics.flatMap(.latest) { Property(lyrics: $0, on: scheduler) }
        self.strength = genre.map { $0.strength }
    }

    private let word: Property<String>
    private let strength: Property<Double>
}

extension VocalistVoice: Presentable {

    internal var present: (VocalistVoicePresenters) -> Disposable? {
        return { [weak self] presenters in
            guard let sself = self else { return nil }
            let disposable = CompositeDisposable()
            disposable += presenters.word.present(sself.word)
            disposable += presenters.strength.present(sself.strength)
            return disposable
        }
    }
}
