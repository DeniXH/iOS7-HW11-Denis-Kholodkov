//
//  ViewController.swift
//  iOS7-HW11-Denis Kholodkov
//
//  Created by Денис Холодков on 18.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let backgroundView: UIImageView = {
            let imageViewBackground = UIImageView(frame: UIScreen.main.bounds)
            imageViewBackground.image = UIImage(named: "beach")
            imageViewBackground.translatesAutoresizingMaskIntoConstraints = false
            return imageViewBackground
        }()

    private lazy var labelHead: UILabel = {
        let labelHead = UILabel()
        labelHead.text = "Login"
        labelHead.font = UIFont.systemFont(ofSize: 42)
        labelHead.translatesAutoresizingMaskIntoConstraints = false
        return labelHead
    }()

    private lazy var loginField: UITextField = {
        let loginField = UITextField()
        loginField.textColor = .white
        loginField.placeholder = "keanureeves01"
        loginField.backgroundColor = .systemGreen
        loginField.font = UIFont.systemFont(ofSize: 20)
        loginField.translatesAutoresizingMaskIntoConstraints = false
        return loginField
    }()

    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.textColor = .white
        passwordField.placeholder = "Password"
        passwordField.backgroundColor = .systemGreen
        passwordField.font = UIFont.systemFont(ofSize: 20)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()

    private lazy var stackForLoginField: UIStackView = { // сделать функцию
        let stackForLoginField = UIStackView()
        stackForLoginField.axis = .horizontal
        stackForLoginField.distribution = .fill
        stackForLoginField.alignment = .center
        stackForLoginField.spacing = 20
        stackForLoginField.translatesAutoresizingMaskIntoConstraints = false
        return stackForLoginField
    }()

    private lazy var stackForPasswordField: UIStackView = { // сделать функцию
        let stackForPasswordField = UIStackView()
        stackForPasswordField.axis = .horizontal
        stackForPasswordField.distribution = .fill
        stackForPasswordField.alignment = .center
        stackForPasswordField.spacing = 20
        stackForPasswordField.translatesAutoresizingMaskIntoConstraints = false
        return stackForPasswordField
    }()

    private lazy var imageLoginFieldLeft: UIImageView = {
        let image = UIImage(systemName: "person")
        let imageLoginFieldLeft = UIImageView(image: image)
        imageLoginFieldLeft.contentMode = .scaleAspectFill
        imageLoginFieldLeft.tintColor = .black
        imageLoginFieldLeft.translatesAutoresizingMaskIntoConstraints = false
        return imageLoginFieldLeft
    }()

    private lazy var imageLoginFieldRight: UIImageView = {
        let image = UIImage(systemName: "checkmark.circle.fill")
        let imageLoginFieldRight = UIImageView(image: image)
        imageLoginFieldRight.contentMode = .scaleAspectFill
        imageLoginFieldRight.tintColor = .black
        imageLoginFieldRight.translatesAutoresizingMaskIntoConstraints = false
        return imageLoginFieldRight
    }()

    private lazy var imagePasswordFieldLeft: UIImageView = {
        let image = UIImage(systemName: "lock")
        let imagePasswordFieldLeft = UIImageView(image: image)
        imagePasswordFieldLeft.contentMode = .scaleAspectFill
        imagePasswordFieldLeft.tintColor = .black
        imagePasswordFieldLeft.translatesAutoresizingMaskIntoConstraints = false
        return imagePasswordFieldLeft
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setConstraints()
    }

    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(labelHead)

        view.addSubview(stackForLoginField)
        stackForLoginField.addArrangedSubview(imageLoginFieldLeft)
        stackForLoginField.addArrangedSubview(loginField)
        stackForLoginField.addArrangedSubview(imageLoginFieldRight)

        view.addSubview(stackForPasswordField)
        stackForPasswordField.addArrangedSubview(imagePasswordFieldLeft)
        stackForPasswordField.addArrangedSubview(passwordField)




    }

    private func setConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.bottom.top.right.left.equalToSuperview()
        }

        labelHead.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.centerX.equalTo(view)
        }

        loginField.snp.makeConstraints { make in
            make.top.equalTo(labelHead.snp.bottom).offset(40)
            make.centerX.equalTo(view)
        }

        imageLoginFieldLeft.snp.makeConstraints { make in
            make.width.height.equalTo(15)
        }

        imageLoginFieldRight.snp.makeConstraints { make in
            make.width.height.equalTo(15)
        }

        imagePasswordFieldLeft.snp.makeConstraints { make in
            make.width.height.equalTo(15)
        }

        stackForPasswordField.snp.makeConstraints { make in
            make.top.equalTo(stackForLoginField.snp.bottom).offset(15)
            make.centerX.equalTo(view)
        }
}

}
