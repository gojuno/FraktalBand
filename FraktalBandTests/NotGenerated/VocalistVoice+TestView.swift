//
//  VocalistVoice+TestView.swift
//  FraktalBandTests
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import Foundation

import FraktalSimplified
import FraktalSimplifiedTestUtils

import ReactiveSwift
import FraktalBandUI

@testable import FraktalBand

extension VocalistVoice {

    final class TestView: TestViewType {

        let _word = AnyTestView<String>.View()
        let _strength = AnyTestView<Double>.View()

        let disposable: ScopedDisposable<AnyDisposable>?

        init(_ presentable: AnyPresentable<VocalistVoicePresenters>) {
            self.disposable = presentable.present(VocalistVoice.Presenters(
                word: self._word.presenter,
                strength: self._strength.presenter
            )).map(ScopedDisposable.init)
        }
    }
}

extension VocalistVoice.TestView {
    var word: String! { return _word.last?.value }
    var strength: Double! { return _strength.last?.value }
}
