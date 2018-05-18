// Generated using Sourcery 0.11.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length file_length

import Foundation

import FraktalSimplified
import ReactiveSwift


public final class BandMockPresentable: Presentable {

    public let _vocalist: MutableProperty<VocalistMockPresentable>
    public let _restart: MutableProperty<() -> Void>

    public init(
        vocalist: VocalistMockPresentable = VocalistMockPresentable(),
        restart: @escaping () -> Void = {}
    ) {
        self._vocalist = MutableProperty(vocalist)
        self._restart = MutableProperty(restart)
    }

    public var present: (BandPresenters) -> Disposable? {
        return { [weak self] presenters in
            guard let sself = self else { return nil }
            let disposable = CompositeDisposable()
            disposable += presenters.vocalist.present(sself._vocalist.producer.map { AnyPresentable<VocalistPresenters>($0) })
            disposable += presenters.restart.present(sself._restart)
            return disposable
        }
    }
}

public extension BandMockPresentable {
    var vocalist: VocalistMockPresentable {
        get { return _vocalist.value }
        set { _vocalist.value = newValue }
    }
    var restart: () -> Void {
        get { return _restart.value }
        set { _restart.value = newValue }
    }
}

public final class VocalistMockPresentable: Presentable {

    public let _dance: MutableProperty<VocalistDanceMockPresentable>
    public let _voice: MutableProperty<VocalistVoiceMockPresentable>

    public init(
        dance: VocalistDanceMockPresentable = VocalistDanceMockPresentable(),
        voice: VocalistVoiceMockPresentable = VocalistVoiceMockPresentable()
    ) {
        self._dance = MutableProperty(dance)
        self._voice = MutableProperty(voice)
    }

    public var present: (VocalistPresenters) -> Disposable? {
        return { [weak self] presenters in
            guard let sself = self else { return nil }
            let disposable = CompositeDisposable()
            disposable += presenters.dance.present(sself._dance.producer.map { AnyPresentable<VocalistDancePresenters>($0) })
            disposable += presenters.voice.present(sself._voice.producer.map { AnyPresentable<VocalistVoicePresenters>($0) })
            return disposable
        }
    }
}

public extension VocalistMockPresentable {
    var dance: VocalistDanceMockPresentable {
        get { return _dance.value }
        set { _dance.value = newValue }
    }
    var voice: VocalistVoiceMockPresentable {
        get { return _voice.value }
        set { _voice.value = newValue }
    }
}

public final class VocalistDanceMockPresentable: Presentable {

    public let _move: MutableProperty<DanceMove>

    public init(
        move: DanceMove = DanceMove.mock()
    ) {
        self._move = MutableProperty(move)
    }

    public var present: (VocalistDancePresenters) -> Disposable? {
        return { [weak self] presenters in
            guard let sself = self else { return nil }
            let disposable = CompositeDisposable()
            disposable += presenters.move.present(sself._move)
            return disposable
        }
    }
}

public extension VocalistDanceMockPresentable {
    var move: DanceMove {
        get { return _move.value }
        set { _move.value = newValue }
    }
}
