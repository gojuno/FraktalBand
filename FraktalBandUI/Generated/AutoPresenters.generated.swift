// Generated using Sourcery 0.11.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length file_length
import FraktalSimplified
import ReactiveSwift


public struct BandPresenters {

    public let vocalist: Presenter<AnyPresentable<VocalistPresenters>>
    public let restart: Presenter<() -> Void>

    public init(
        vocalist: Presenter<AnyPresentable<VocalistPresenters>>,
        restart: Presenter<() -> Void>
    ) {
        self.vocalist = vocalist
        self.restart = restart
    }
}

public struct VocalistPresenters {

    public let dance: Presenter<AnyPresentable<VocalistDancePresenters>>
    public let voice: Presenter<AnyPresentable<VocalistVoicePresenters>>

    public init(
        dance: Presenter<AnyPresentable<VocalistDancePresenters>>,
        voice: Presenter<AnyPresentable<VocalistVoicePresenters>>
    ) {
        self.dance = dance
        self.voice = voice
    }
}

public struct VocalistDancePresenters {

    public let move: Presenter<DanceMove>

    public init(
        move: Presenter<DanceMove>
    ) {
        self.move = move
    }
}
