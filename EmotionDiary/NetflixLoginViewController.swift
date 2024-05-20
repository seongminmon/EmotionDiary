//
//  NetflixLoginViewController.swift
//  EmotionDiary
//
//  Created by 김성민 on 5/20/24.
//

import UIKit

class NetflixLoginViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommandTextField: UITextField!
    
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var extraInfoLabel: UILabel!
    @IBOutlet var extraInfoSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        titleLabel.text = "JACKFLIX"
        titleLabel.textColor = .red
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        emailTextField.placeholder = "이메일 주소 또는 전화번호"
        passwordTextField.placeholder = "비밀번호"
        nicknameTextField.placeholder = "닉네임"
        locationTextField.placeholder = "위치"
        recommandTextField.placeholder = "추천 코드 입력"
        
        passwordTextField.isSecureTextEntry = true
//        recommandTextField.keyboardType = .numberPad
        
        setupTextFieldUI(emailTextField)
        setupTextFieldUI(passwordTextField)
        setupTextFieldUI(nicknameTextField)
        setupTextFieldUI(locationTextField)
        setupTextFieldUI(recommandTextField)
        
        signInButton.setTitle("회원가입", for: .normal)
        signInButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.backgroundColor = .white
        signInButton.layer.cornerRadius = 20
        
        extraInfoLabel.text = "추가 정보 입력"
        extraInfoLabel.textColor = .white
        
        extraInfoSwitch.setOn(false, animated: true)
        extraInfoSwitch.onTintColor = .red
        extraInfoSwitch.thumbTintColor = .gray
        
        descriptionLabel.text = "회원가입 버튼을 눌러보세요"
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
    }
    
    func setupTextFieldUI(_ textField: UITextField) {
//        $0.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 18)
        textField.textAlignment = .center
        textField.textColor = .white
        textField.tintColor = .white
        textField.backgroundColor = .lightGray
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        // 조건 판단
        // (1) 이메일, 비밀번호 필수
        // (2) 비밀번호 6자리 이상
        // (3) 추천코드 숫자만
        var description = ""
        
        if emailTextField.text == "" || passwordTextField.text == "" {
            description += "이메일과 비밀번호를 입력해주세요.\n"
        }
        
        if let password = passwordTextField.text, password.count < 6 {
            description += "비밀번호를 6자리 이상 입력해주세요.\n"
        }
        
        if let recommandCode = recommandTextField.text, Int(recommandCode) == nil {
            description += "추천코드는 숫자만 입력해주세요.\n"
        }
        
        if description == "" {
            descriptionLabel.text = "회원 가입이 완료되었습니다."
            descriptionLabel.textColor = .white
        } else {
            descriptionLabel.text = description
            descriptionLabel.textColor = .red
        }
        
        view.endEditing(true)
    }
    
    // 여러 텍스트 필드 동시에 연결
    // did end on exit
    // 리턴 누를 시 키보드 내리기
    @IBAction func textFieldReturnTapped(_ sender: UITextField) {
    }
    
    // 다른 화면 터치 시 키보드 내려가게 만들기
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
