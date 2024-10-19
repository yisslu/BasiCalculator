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
        stackView.backgroundColor = .cyan
        return stackView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addViews()
        addLabelResult()
        addMainStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLabelResult(){
        NSLayoutConstraint.activate([
            labelResult.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            labelResult.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 0),
            labelResult.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            labelResult.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])
    }
    
    private func addMainStackView(){
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: labelResult.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        ])
    }
    
    private func addViews(){
        addSubview(labelResult)
        addSubview(mainStackView)
    }
}
