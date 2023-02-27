//
//  ExampleViewController.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 27.02.2023.
//

import UIKit
import PinLayout


class ExampleViewController: UIViewController {




    public static func startVC() -> Self {
        return Self.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green


        let stackView = UIStackView()
       // stackView.backgroundColor = .gray
        stackView.axis = .horizontal
        //stackView.distribution = .fillEqually
         stackView.spacing = 10
       // stackView.alignment = .center
        view.addSubview(stackView)

        let label1 = UIButton()
        label1.setTitle("Label 1", for: .normal)
        label1.setTitle("pressed", for: .highlighted)
        label1.backgroundColor = .blue
        stackView.addArrangedSubview(label1)

        let label2 = UILabel()
        label2.text = "Label 2"
        label2.textAlignment = .center
        label2.backgroundColor = .yellow
        stackView.addArrangedSubview(label2)

        let label3 = UILabel()
        label3.text = "Label 3"
        label3.textAlignment = .center
        label3.backgroundColor = .orange
        stackView.addArrangedSubview(label3)

      //stackView.translatesAutoresizingMaskIntoConstraints = true
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false


        stackView.pin.width(350).height(50).top(150).hCenter()
//         label1.pin.vertically().left().width(150)
//         label2.pin.after(of: label1, aligned: .top).bottomRight().marginRight(10)


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
