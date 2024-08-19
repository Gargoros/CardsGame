//
//  SafariWebView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 18.08.24.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss

    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        vc.preferredControlTintColor = .tintColor
        vc.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ vc: SFSafariViewController, context: Context) {}

    class Coordinator: NSObject, SFSafariViewControllerDelegate {
        var dismissAction: DismissAction?

        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            dismissAction?()
        }
    }

    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        coordinator.dismissAction = dismiss
        return coordinator
    }
}
