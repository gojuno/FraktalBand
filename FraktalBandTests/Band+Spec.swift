//
//  Band+Spec.swift
//  FraktalBandTests
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import Foundation
import Quick
import Nimble

import FraktalSimplified
import ReactiveSwift

@testable import FraktalBand

final class BandSpec: QuickSpec {

    override func spec() {

        describe("Band") {

            let scheduler = TestScheduler()

            var sut: Band!
            var view: Band.TestView!

            beforeEach {
                sut = Band(song: Song(lyrics: ["1", "2", "3", "4"], genre: Song.Genre.drama), on: scheduler)
                view = Band.TestView(AnyPresentable(sut))
            }

            afterEach {
                sut = nil
                view = nil
            }

            it("should have valid initial value") {
                expect(view.vocalist.voice.word).to(equal("1"))
            }

            it("should have correct strength") {
                expect(view.vocalist.voice.strength).to(equal(1))
            }

            context("when some time passed") {

                beforeEach {
                    scheduler.advance(by: .milliseconds(200))
                }

                it("should change word") {
                    expect(view.vocalist.voice.word).to(equal("2"))
                }
            }
        }
    }
}
