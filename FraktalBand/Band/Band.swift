//
//  Band.swift
//  FraktalBand
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import Foundation

import FraktalSimplified
import ReactiveSwift
import FraktalBandUI
import enum Result.NoError

// sourcery: presentable
final class Band {

    init(song: Song, on scheduler: DateScheduler) {
        self.song = Property(initial: song, then: restartPipe.output.map { _ in song })
        self.vocalist = Vocalist(song: self.song, on: scheduler)
        self.restart = restartPipe.input.send
    }

    deinit {
        restartPipe.input.sendInterrupted()
    }

    // sourcery: presentable
    private let vocalist: Vocalist
    // sourcery: presentable, mock_value = {}
    private let restart: () -> Void

    private let restartPipe = Signal<Void, NoError>.pipe()
    private let song: Property<Song>
}

// sourcery:inline:Band.Presentable
// swiftlint:disable line_length
extension Band: Presentable {

    internal var present: (BandPresenters) -> Disposable? {
        return { [weak self] presenters in
            guard let sself = self else { return nil }
            let disposable = CompositeDisposable()
            disposable += presenters.vocalist.present(sself.vocalist)
            disposable += presenters.restart.present(sself.restart)
            return disposable
        }
    }
}
// swiftlint:enable line_length
// sourcery:end
