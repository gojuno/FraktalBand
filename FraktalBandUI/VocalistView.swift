//
//  VocalistView.swift
//  FraktalBandUI
//
//  Created by Anton Siliuk on 17.05.2018.
//  Copyright © 2018 Juno. All rights reserved.
//

import UIKit

import FraktalSimplified

final class VocalistView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(headImageView)
        NSLayoutConstraint.activate([
            headImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headImageView.topAnchor.constraint(equalTo: self.topAnchor),
            headImageView.heightAnchor.constraint(equalTo: headImageView.widthAnchor)
        ])

        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: headImageView.bottomAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let headImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(asset: Asset.filipKirkorov)
        return view
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
}

extension VocalistView {
    var presenter: Presenter<AnyPresentable<VocalistPresenters>> {
        return Presenter.UI { [weak self] vocalist in
            guard let sself = self else { return nil }
            return vocalist.present(VocalistPresenters(
                dance: sself.dancePresenter,
                voice: sself.voicePresenter
            ))
        }
    }

    private var dancePresenter: Presenter<AnyPresentable<VocalistDancePresenters>> {
        return Presenter.UI { [weak self] dance in
            guard let sself = self else { return nil }
            return dance.present(VocalistDancePresenters(move: sself.danceMovePresenter))
        }
    }

    private var danceMovePresenter: Presenter<DanceMove> {
        return Presenter.UI { [weak self] direction in
            guard let sself = self else { return nil }

            switch direction {
            case .center: sself.transform = .identity
            case .down: sself.transform = CGAffineTransform(translationX: 0, y: 10)
            case .left: sself.transform = CGAffineTransform(translationX: -10, y: 0)
            case .right: sself.transform = CGAffineTransform(translationX: 10, y: 0)
            case .up: sself.transform = CGAffineTransform(translationX: 0, y: -10)
            }

            return nil
        }
    }

    private var voicePresenter: Presenter<AnyPresentable<VocalistVoicePresenters>> {
        return Presenter.UI { [weak self] voice in
            guard let sself = self else { return nil }
            return voice.present(VocalistVoicePresenters(
                word: sself.textLabel.textPresenter,
                strength: sself.strengthPresenter
            ))
        }
    }

    private var strengthPresenter: Presenter<Double> {
        return Presenter.UI { [weak self] strength in
            guard let sself = self else { return nil }
            sself.textLabel.font = UIFont.systemFont(ofSize: CGFloat(strength * 3))
            return nil
        }
    }
}
