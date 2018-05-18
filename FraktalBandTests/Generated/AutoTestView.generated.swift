// Generated using Sourcery 0.11.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length file_length

import Foundation

import FraktalSimplified
import FraktalSimplifiedTestUtils

import ReactiveSwift
import FraktalBandUI

@testable import FraktalBand

internal extension Band {

    internal final class TestView: TestViewType {

        internal let _vocalist = Vocalist.TestView.View()
        internal let _restart = AnyTestView<() -> Void>.View()

        internal let disposable: ScopedDisposable<AnyDisposable>?

        internal init(_ presentable: AnyPresentable<BandPresenters>) {
            self.disposable = presentable.present(Band.Presenters(
                vocalist: self._vocalist.presenter,
                restart: self._restart.presenter
            )).map(ScopedDisposable.init)
        }
    }
}

internal extension Band.TestView {
    var vocalist: Vocalist.TestView! { return _vocalist.last }
    var restart: (() -> Void)! { return _restart.last?.value }
}

internal extension Vocalist {

    internal final class TestView: TestViewType {

        internal let _dance = VocalistDance.TestView.View()
        internal let _voice = VocalistVoice.TestView.View()

        internal let disposable: ScopedDisposable<AnyDisposable>?

        internal init(_ presentable: AnyPresentable<VocalistPresenters>) {
            self.disposable = presentable.present(Vocalist.Presenters(
                dance: self._dance.presenter,
                voice: self._voice.presenter
            )).map(ScopedDisposable.init)
        }
    }
}

internal extension Vocalist.TestView {
    var dance: VocalistDance.TestView! { return _dance.last }
    var voice: VocalistVoice.TestView! { return _voice.last }
}

internal extension VocalistDance {

    internal final class TestView: TestViewType {

        internal let _move = AnyTestView<DanceMove>.View()

        internal let disposable: ScopedDisposable<AnyDisposable>?

        internal init(_ presentable: AnyPresentable<VocalistDancePresenters>) {
            self.disposable = presentable.present(VocalistDance.Presenters(
                move: self._move.presenter
            )).map(ScopedDisposable.init)
        }
    }
}

internal extension VocalistDance.TestView {
    var move: DanceMove! { return _move.last?.value }
}
