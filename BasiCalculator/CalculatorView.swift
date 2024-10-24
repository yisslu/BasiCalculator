//
//  CalculatorView.swift
//  BasiCalculator
//
//  Created by Diplomado on 19/10/24.
//

import UIKit

class CalculatorView: UIView {

    lazy var labelResult: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.text = "0"
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var buttonsNumbersAndSymbols: [UIButton] = {
        var buttons: [UIButton] = []
        buttons.append(createBasicButton(for: "AC", with: .systemGray3))
        buttons.append(createBasicButton(for: "+/-", with: .systemGray3))
        buttons.append(createBasicButton(for: "%", with: .systemGray3))
        buttons.append(createBasicButton(for: "/", with: .systemYellow))
        buttons.append(createBasicButton(for: "7", with: .systemGray))
        buttons.append(createBasicButton(for: "8", with: .systemGray))
        buttons.append(createBasicButton(for: "9", with: .systemGray))
        buttons.append(createBasicButton(for: "x", with: .systemYellow))
        buttons.append(createBasicButton(for: "4", with: .systemGray))
        buttons.append(createBasicButton(for: "5", with: .systemGray))
        buttons.append(createBasicButton(for: "6", with: .systemGray))
        buttons.append(createBasicButton(for: "-", with: .systemYellow))
        buttons.append(createBasicButton(for: "1", with: .systemGray))
        buttons.append(createBasicButton(for: "2", with: .systemGray))
        buttons.append(createBasicButton(for: "3", with: .systemGray))
        buttons.append(createBasicButton(for: "+", with: .systemYellow))
        buttons.append(createBasicButton(for: "0", with: .systemGray, tamic: false))
        buttons.append(createBasicButton(for: ".", with: .systemGray, tamic: true))
        buttons.append(createBasicButton(for: "=", with: .systemYellow, tamic: true))
        return buttons
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addViews()
        addLabelResult()
        addMainStackView()
        createMainStack()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLabelResult(){
        NSLayoutConstraint.activate([
            labelResult.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            labelResult.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 8),
            labelResult.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            labelResult.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.30)
        ])
    }
    
    private func addMainStackView(){
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: labelResult.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addViews(){
        addSubview(labelResult)
        addSubview(mainStackView)
    }
    
    private func createMainStack(){
        let firstCell = createStackNumbers(first: buttonsNumbersAndSymbols[0], second: buttonsNumbersAndSymbols[1], third: buttonsNumbersAndSymbols[2], fourth: buttonsNumbersAndSymbols[3])
        let secondCell = createStackNumbers(first: buttonsNumbersAndSymbols[4], second: buttonsNumbersAndSymbols[5], third: buttonsNumbersAndSymbols[6], fourth: buttonsNumbersAndSymbols[7])
        let thirdCell = createStackNumbers(first: buttonsNumbersAndSymbols[8], second: buttonsNumbersAndSymbols[9], third: buttonsNumbersAndSymbols[10], fourth: buttonsNumbersAndSymbols[11])
        let fourthCell = createStackNumbers(first: buttonsNumbersAndSymbols[12], second: buttonsNumbersAndSymbols[13], third: buttonsNumbersAndSymbols[14], fourth: buttonsNumbersAndSymbols[15])
        
        mainStackView.addArrangedSubview(firstCell)
        mainStackView.addArrangedSubview(secondCell)
        mainStackView.addArrangedSubview(thirdCell)
        mainStackView.addArrangedSubview(fourthCell)
        mainStackView.addArrangedSubview(createLastStack())
        
    }
    
    private func createLastStack() -> UIView{
        let lastStack = UIStackView()
        lastStack.axis = .horizontal
        lastStack.spacing = 8
        lastStack.addArrangedSubview(buttonsNumbersAndSymbols[16])
        lastStack.addArrangedSubview(buttonsNumbersAndSymbols[17])
        lastStack.addArrangedSubview(buttonsNumbersAndSymbols[18])
        NSLayoutConstraint.activate([
            buttonsNumbersAndSymbols[16].widthAnchor.constraint(equalTo: lastStack.widthAnchor, multiplier: 0.5),
            buttonsNumbersAndSymbols[17].widthAnchor.constraint(equalTo: lastStack.widthAnchor, multiplier: 0.23),
            buttonsNumbersAndSymbols[18].widthAnchor.constraint(equalTo: lastStack.widthAnchor, multiplier: 0.23)
        ])
        return lastStack
    }
    
    private func createStackNumbers(first: UIButton, second: UIButton, third : UIButton, fourth: UIButton) -> UIView{
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(first)
        stackView.addArrangedSubview(second)
        stackView.addArrangedSubview(third)
        stackView.addArrangedSubview(fourth)
        return stackView
    }
    
    private func createBasicButton(for number: String, with color: UIColor, tamic: Bool = true) -> UIButton{
        let button = UIButton()
        button.setTitle(number, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = tamic
        var configuration = UIButton.Configuration.plain()
        configuration.background.backgroundColor = color
        configuration.baseForegroundColor = .systemGray6
        configuration.cornerStyle = .capsule
        button.configuration = configuration
        return button
    }
}
