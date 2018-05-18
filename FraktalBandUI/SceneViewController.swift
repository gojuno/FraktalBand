//
//  SceneViewController.swift
//  FraktalBandUI
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import UIKit

import FraktalSimplified

public final class SceneViewController: UIViewController {

    public static func create() -> SceneViewController {
        let vc = SceneViewController()
        vc.loadViewIfNeeded()
        return vc
    }

    private init() {
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(vocalist)
        NSLayoutConstraint.activate([
            vocalist.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vocalist.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vocalist.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])

        view.addSubview(onceAgain)
        NSLayoutConstraint.activate([
            onceAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onceAgain.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

    private let vocalist: VocalistView = {
        let view = VocalistView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let onceAgain: UIButton = {
        let button = UIButton.init(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Restart", for: .normal)
        return button
    }()
}

extension SceneViewController {
    public var camera: Presenter<AnyPresentable<BandPresenters>> {
        return Presenter.UI { [weak self] band in
            guard let sself = self else { return nil }
            return band.present(BandPresenters(
                vocalist: sself.vocalist.presenter,
                restart: sself.onceAgain.simpleActionPresenter
            ))
        }
    }
}
