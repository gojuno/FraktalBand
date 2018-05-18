//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

import ReactiveSwift
import FraktalBandUI
import FraktalSimplified

// Create View
let vc = SceneViewController.create()
vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568)

// Create ViewModel
let mock = BandMockPresentable(
    vocalist: VocalistMockPresentable(
        voice: VocalistVoiceMockPresentable(word: "Hello world", strength: 10)
    )
)

// Present
_ = vc.camera.present(mock)

// Observe
PlaygroundPage.current.liveView = vc.view
