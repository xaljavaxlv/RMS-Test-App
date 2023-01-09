//
//  FeedbackVC.swift
//  RVS Test App
//
//  Created by Vlad Zavada on 1/7/23.
//

import UIKit

final class FeedbackVC: UIViewController {

    private let subjectTitleLabel = UILabel()
    private let subjectTextField = UITextField()
    private let messageTitleLabel = UILabel()
    private let messageTextView = UITextView()
    private let sendMessageButton = UIButton()
    private let viewModel: FeedbackViewModelProtocol
    private let fieldColor = #colorLiteral(red: 0.8887655735, green: 0.8999539614, blue: 0.8997572064, alpha: 1)

    init() {
        self.viewModel = FeedbackViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addAllSubviews()
        createSubjectTitleLabel()
        createSubjectTextField()
        createMessageTitleLabel()
        createMessageTextView()
        createSendMessageButton()
        setTitle()
    }

    @objc private func sendMessageButtonAction() {
        guard let subject = subjectTextField.text, let message = messageTextView.text else { return }
        viewModel.sendFeedback(subject: subject, message: message)
    }
}

// MARK: - Set UI
private extension FeedbackVC {
    func addAllSubviews() {
        view.addSubview(subjectTitleLabel)
        view.addSubview(subjectTextField)
        view.addSubview(messageTitleLabel)
        view.addSubview(messageTextView)
        view.addSubview(sendMessageButton)
    }

    func createSubjectTitleLabel() {
        subjectTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subjectTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        subjectTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        subjectTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        subjectTitleLabel.text = viewModel.titleStrings.subjectTitle
    }

    func createSubjectTextField() {
        subjectTextField.translatesAutoresizingMaskIntoConstraints = false
        subjectTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subjectTextField.topAnchor.constraint(equalTo: subjectTitleLabel.bottomAnchor, constant: 10).isActive = true
        subjectTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        subjectTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        subjectTextField.backgroundColor = fieldColor
        subjectTextField.layer.cornerRadius = 10
        let leftView = UIView()
        leftView.frame.size.width = 5
        subjectTextField.leftView = leftView
        subjectTextField.leftViewMode = .always
    }

    func createMessageTitleLabel() {
        messageTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageTitleLabel.topAnchor.constraint(equalTo: subjectTextField.bottomAnchor, constant: 10).isActive = true
        messageTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        messageTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        messageTitleLabel.text = viewModel.titleStrings.messageTittle
    }

    func createMessageTextView() {
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        messageTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        messageTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        messageTextView.topAnchor.constraint(equalTo: messageTitleLabel.bottomAnchor, constant: 10).isActive = true
        messageTextView.backgroundColor = fieldColor
        messageTextView.layer.cornerRadius = 10
    }

    func createSendMessageButton() {
        sendMessageButton.translatesAutoresizingMaskIntoConstraints = false
        sendMessageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sendMessageButton.topAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: 20).isActive = true
        sendMessageButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        sendMessageButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        sendMessageButton.addTarget(self, action: #selector(sendMessageButtonAction), for: .touchUpInside)
        sendMessageButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        sendMessageButton.layer.cornerRadius = 10
        sendMessageButton.setTitle("Send", for: .normal)
    }

    func setTitle() {
        title = "Feedback"
    }
}
