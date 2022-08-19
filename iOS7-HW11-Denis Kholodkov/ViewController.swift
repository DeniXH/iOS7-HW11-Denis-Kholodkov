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

    //MARK: - Head part of screen

    private lazy var labelHead: UILabel = {
        let labelHead = UILabel()
        labelHead.text = "Login"
        labelHead.font = UIFont.systemFont(ofSize: 30)
        labelHead.textColor = .gray
        labelHead.textAlignment = .center
        labelHead.translatesAutoresizingMaskIntoConstraints = false
        return labelHead
    }()

    private lazy var loginField: UITextField = {
        let loginField = makeLoginOrPasswordField("keanureeves01")
        loginField.setRightIcon(imageLoginFieldRight)
        loginField.setLeftIcon(imageLoginFieldLeft)
        return loginField
    }()

    private lazy var passwordField: UITextField = {
        let passwordField = makeLoginOrPasswordField("Password")
        passwordField.setLeftIcon(imagePasswordFieldLeft)
        return passwordField
    }()

    private lazy var imageLoginFieldLeft: UIImage? = {
        var image = UIImage(systemName: "person")
        guard let imageLeft = image else { return nil }
        return imageLeft
    }()

    private lazy var imageLoginFieldRight: UIImage? = {
        let image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 87/255, green: 204/255, blue: 114/255, alpha: 100), renderingMode: .alwaysOriginal)
        guard let imageRight = image else { return nil }
        return imageRight
    }()

    private lazy var imagePasswordFieldLeft: UIImage? = {
        let image = UIImage(systemName: "lock")
        guard let imageLeft = image else { return nil }
        return imageLeft
    }()

    //MARK: - Center part of screen

    private lazy var buttonLogin: UIButton = {
        let buttonLogin = makeButton(nameButton: "Login",
                                     color: UIColor(red: 94/255, green: 142/255, blue: 206/255, alpha: 100),
                                     cornerRadius: 25)
        return buttonLogin
    }()

    private lazy var labelCenter: UILabel = {
        let labelCenter = UILabel()
        labelCenter.text = "Forgot your password ?"
        labelCenter.textColor = .white
        labelCenter.font = UIFont.systemFont(ofSize: 15)
        labelCenter.translatesAutoresizingMaskIntoConstraints = false
        return labelCenter
    }()

    //MARK: - Bottom part screen

    private lazy var labelDownFirst: UILabel = {
        let labelDownFirst = UILabel()
        labelDownFirst.text = "or connect with"
        labelDownFirst.textColor = .lightGray
        labelDownFirst.textAlignment = .center
        labelDownFirst.font = UIFont.boldSystemFont(ofSize: 15)
        labelDownFirst.translatesAutoresizingMaskIntoConstraints = false
        return labelDownFirst
    }()

    private lazy var bandLineLeft: UIView = {
        let leftLine = bandLine()
        return leftLine
    }()

    private lazy var bandLineRight: UIView = {
        let rightLine = bandLine()
        return rightLine
    }()

    private lazy var buttonFacebook: UIButton = {
        let buttonFacebook = makeButton(nameButton: "Facebook",
                                        color: UIColor(red: 44/255, green: 174/255, blue: 230/255, alpha: 100),
                                        cornerRadius: 18)
        buttonFacebook.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return buttonFacebook
    }()

    private lazy var buttonTwitter: UIButton = {
        let buttonTwitter = makeButton(nameButton: "Twitter",
                                       color: UIColor(red: 93/255, green: 117/255, blue: 209/255, alpha: 100),
                                       cornerRadius: 18)
        buttonTwitter.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return buttonTwitter
    }()

    private lazy var imageViewFacebook: UIImageView = {
        let imageViewFacebook = imageIcon(systemName: "facebook-square")
        return imageViewFacebook
    }()

    private lazy var imageViewTwitter: UIImageView = {
        let imageViewTwitter = imageIcon(systemName: "twitter")
        return imageViewTwitter
    }()

    private lazy var labelDontAccount: UILabel = {
        let labelDontAccount = UILabel()
        labelDontAccount.text = "Dont have account?"
        labelDontAccount.textAlignment = .center
        labelDontAccount.textColor = .gray
        labelDontAccount.font = UIFont.boldSystemFont(ofSize: 14)
        return labelDontAccount
    }()

    private lazy var buttonSingUp: UIButton = {
        let buttonSingUp = UIButton(type: .system)
        buttonSingUp.setTitle("Sign up", for: .normal)
        buttonSingUp.setTitleColor(UIColor(red: 93/255, green: 117/255, blue: 209/255, alpha: 100), for: .normal)
        buttonSingUp.backgroundColor = UIColor(red: 93/255, green: 117/255, blue: 209/255, alpha: 0)
        buttonSingUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return buttonSingUp
    }()

    //MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setConstraints()
    }

    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(labelHead)
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(buttonLogin)
        view.addSubview(labelCenter)
        view.addSubview(labelDownFirst)
        view.addSubview(bandLineLeft)
        view.addSubview(bandLineRight)
        view.addSubview(buttonFacebook)
        view.addSubview(buttonTwitter)
        view.addSubview(imageViewFacebook)
        view.addSubview(imageViewTwitter)
        view.addSubview(labelDontAccount)
        view.addSubview(buttonSingUp)
    }

    private func setConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.bottom.top.right.left.equalToSuperview()
        }

        labelHead.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.centerX.equalTo(view)
        }

        setContrainsUIControlElements(loginField, offset: 40)
        setContrainsUIControlElements(passwordField, offset: 125)
        setContrainsUIControlElements(buttonLogin, offset: 210)

        buttonLogin.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(30)
            make.centerX.equalTo(view)
        }

        labelCenter.snp.makeConstraints { make in
            make.top.equalTo(buttonLogin.snp.bottom).offset(15)
            make.centerX.equalTo(view)
        }

        labelDownFirst.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottomMargin.equalTo(-150)
            make.height.equalTo(30)
            make.width.equalTo(270)
        }

        setCantrainsBandLine(bandLine: bandLineLeft, leadingMargin: 50)
        setCantrainsBandLine(bandLine: bandLineRight, leadingMargin: -50)

        buttonFacebook.snp.makeConstraints { make in
            make.leadingMargin.equalTo(30)
            make.bottomMargin.equalTo(-100)
            make.height.equalTo(35)
            make.width.equalTo(150)
        }

        buttonTwitter.snp.makeConstraints { make in
            make.bottomMargin.equalTo(-100)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(35)
            make.width.equalTo(150)
        }

        imageViewFacebook.snp.makeConstraints { make in
            make.leading.equalTo(buttonFacebook).offset(15)
            make.bottom.equalTo(buttonFacebook).offset(-8)
        }

        imageViewTwitter.snp.makeConstraints { make in
            make.leading.equalTo(buttonTwitter).offset(15)
            make.bottom.equalTo(buttonTwitter).offset(-8)
        }

        labelDontAccount.snp.makeConstraints { make in
            make.bottomMargin.equalTo(-52)
            make.leadingMargin.equalTo(78)
        }

        buttonSingUp.snp.makeConstraints { make in
            make.bottomMargin.equalTo(-47)
            make.trailingMargin.equalTo(-100)
        }
    }

    private func makeLoginOrPasswordField(_ placeholder: String) -> UITextField {
        let loginField = UITextField()
        loginField.placeholder = placeholder
        loginField.textColor = .lightGray
        loginField.textAlignment = .center
        loginField.backgroundColor = UIColor(red: 222/255, green: 222/255, blue: 232/255, alpha: 100)
        loginField.layer.cornerRadius = 25
        loginField.leftViewMode = .always
        loginField.translatesAutoresizingMaskIntoConstraints = false
        return loginField
    }

    private func makeButton(nameButton: String, color: UIColor, cornerRadius: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(nameButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = CGFloat(cornerRadius)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func bandLine() -> UIView {
        let band = UIView()
        band.backgroundColor = .lightGray
        band.layer.cornerRadius = 3
        band.translatesAutoresizingMaskIntoConstraints = false
        return band
    }

    private func imageIcon(systemName: String) -> UIImageView {
        let icon = UIImageView(image: UIImage(named: systemName))
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .black
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }

    private func setContrainsUIControlElements(_ uiTextField: UIControl, offset: Int) {
        uiTextField.snp.makeConstraints { make in
            make.top.equalTo(labelHead.snp.bottom).offset(offset)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(260)
        }
    }

    private func setCantrainsBandLine(bandLine: UIView, leadingMargin: Int) {
        bandLine.snp.makeConstraints { make in
            make.bottomMargin.equalTo(-162)
            switch leadingMargin {
            case 50:
                make.leadingMargin.equalTo(50)
            case -50:
                make.trailingMargin.equalTo(-50)
            default:
                make.centerX.equalTo(1)
            }
            make.height.equalTo(2)
            make.width.equalTo(70)
        }
    }
}

//MARK: - Extensions

extension UITextField {

    func setLeftIcon(_ image: UIImage?) {
        let icon = UIImageView(frame: CGRect(x: 15, y: 2, width: 28, height: 30))
        icon.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(icon)
        leftView = iconContainerView
        leftViewMode = .always
    }

    func setRightIcon(_ image: UIImage?) {
        let icon = UIImageView(frame: CGRect(x: -10, y:0, width: 30, height: 35))
        icon.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(icon)
        rightView = iconContainerView
        rightViewMode = .always
    }
}
