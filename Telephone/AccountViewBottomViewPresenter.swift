//
//  AccountViewBottomViewPresenter.swift
//  Telephone
//
//  Copyright © 2008-2016 Alexey Kuznetsov
//  Copyright © 2016-2022 64 Characters
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

import Foundation

@MainActor
final class AccountViewBottomViewPresenter: NSObject {
    private let constraint: NSLayoutConstraint

    @objc init(constraint: NSLayoutConstraint) {
        self.constraint = constraint
    }

    @objc func hideWithoutAnimation() {
        constraint.constant = 0
    }

    private func hide() {
        constraint.animator().constant = 0
    }
}

extension AccountViewBottomViewPresenter: RecordCountingPurchaseCheckUseCaseOutput {
    nonisolated func didCheckPurchase() {
        Task { @MainActor in
            hide()
        }
    }

    nonisolated func didFailCheckingPurchase(recordCount _: Int) {
        Task { @MainActor in
            hide()
        }
    }
}
