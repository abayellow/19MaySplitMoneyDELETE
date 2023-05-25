import UIKit
import Foundation

class TotalBillView: UIView {
  
    let totalBillLabel = UILabel(text: "Total Bill", fontName: "Avenir Next Bold", size: 12, tamic: false, color: .black)
    let moneyTextField = UITextField(text: "", fontName: "Avenir Next Bold", size: 40, color: .black)
    let grayBackground = UIView(color: UIColor(named: "OtherColor")!, radius: 8)
    
    var totalBillImputValue = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConatraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 8
        
        
        addSubview(totalBillLabel)
        addSubview(grayBackground)
        addSubview(moneyTextField)
        
        moneyTextField.addTarget(self, action: #selector(textFieldTarget), for: .editingChanged)
        
        moneyTextField.placeholder = "Enter Value"
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black, // Здесь можно указать желаемый цвет
            // Дополнительные атрибуты (если нужно)
            // Например, шрифт и стиль текста
            .font: UIFont.systemFont(ofSize: 14),
            .kern: 1.0
        ]
        let attributedPlaceholder = NSAttributedString(string: "Enter Value", attributes: attributes)

        // Применение атрибутированной строки к Placeholder
        moneyTextField.attributedPlaceholder = attributedPlaceholder
        
        moneyTextField.textAlignment = .center
        
        
    }
    
    func setupConatraints() {
        
        NSLayoutConstraint.activate([
        
            
            grayBackground.heightAnchor.constraint(equalToConstant: 80),
            grayBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            grayBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            grayBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            totalBillLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            totalBillLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            moneyTextField.centerXAnchor.constraint(equalTo: grayBackground.centerXAnchor),
            moneyTextField.centerYAnchor.constraint(equalTo: grayBackground.centerYAnchor),
            
        ])
        
    }
    
    @objc func textFieldTarget() {
        
        if let text = moneyTextField.text {
            totalBillImputValue = text
            print(totalBillImputValue)
        }
    }
    
}



