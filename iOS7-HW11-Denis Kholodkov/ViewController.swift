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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setConstraints()
    }

    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(labelHead)
        view.addSubview(loginField)
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
}

}
