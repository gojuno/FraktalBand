//
//  Vocalist+Dance.swift
//  FraktalBand
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import Foundation

import FraktalSimplified
import ReactiveSwift
import FraktalBandUI

// sourcery: presentable
final class VocalistDance {

    init(lyrics: Property<Song.Lyrics>, on scheduler: DateScheduler) {
        self.move = lyrics.flatMap(.latest) { Property(lyrics: $0, on: scheduler) }
    }

    // sourcery: presentable, type = * DanceMove
    private let move: Property<DanceMove>
}

// sourcery:inline:VocalistDance.Presentable
// swiftlint:disable line_length
extension VocalistDance: Presentable {

    internal var present: (VocalistDancePresenters) -> Disposable? {
        return { [weak self] presenters in
            guard let sself = self else { return nil }
            let disposable = CompositeDisposable()
            disposable += presenters.move.present(sself.move)
            return disposable
        }
    }
}
// swiftlint:enable line_length
// sourcery:end
