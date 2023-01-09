//
//  FeedbackViewModel.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/7/23.
//

import Foundation

protocol FeedbackViewModelProtocol {
    func sendFeedback(subject: String, message: String)
    var titleStrings: (subjectTitle: String, messageTittle: String) { get }
}

final class FeedbackViewModel {
    let titleStrings = (
        subjectTitle: "Subject",
        messageTittle: "Message"
    )

    private func showNotificationMessage() {
        print("notification")
    }
}

// MARK: - FeedbackViewModelProtocol conforming
extension FeedbackViewModel: FeedbackViewModelProtocol {
    func sendFeedback(subject: String, message: String) {
        // sending message
        showNotificationMessage()
    }
}
