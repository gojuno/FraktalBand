//
//  VocalistVoice+Fraktal.swift
//  FraktalBandUI
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import Foundation

import FraktalSimplified
import ReactiveSwift

public struct VocalistVoicePresenters {

    public let word: Presenter<String>
    public let strength: Presenter<Double>

    public init(
        word: Presenter<String>,
        strength: Presenter<Double>
    ) {
        self.word = word
        self.strength = strength
    }
}

public final class VocalistVoiceMockPresentable: Presentable {

    public let _word: MutableProperty<String>
    public let _strength: MutableProperty<Double>

    public init(
        word: String = String.mock(),
        strength: Double = Double.mock()
        ) {
        self._word = MutableProperty(word)
        self._strength = MutableProperty(strength)
    }

    public var present: (VocalistVoicePresenters) -> Disposable? {
        return { [weak self] presenters in
            guard let sself = self else { return nil }
            let disposable = CompositeDisposable()
            disposable += presenters.word.present(sself._word)
            disposable += presenters.strength.present(sself._strength)
            return disposable
        }
    }
}

public extension VocalistVoiceMockPresentable {
    var word: String {
        get { return _word.value }
        set { _word.value = newValue }
    }
    var strength: Double {
        get { return _strength.value }
        set { _strength.value = newValue }
    }
}
