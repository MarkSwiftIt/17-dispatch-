//
//  ImageView.swift
//  M17_Concurrency
//
//  Created by Mark Goncharov on 17.03.2022.
//

//import UIKit
//import SnapKit
//
//class ImageViewController: UIViewController {
//    
//    
//    private let imageURL: URL = URL(string: "https://dog.ceo/api/breeds/image/random")!
//    
//    private lazy var stackView: UIStackView = {
//        let view = UIStackView()
//        view.axis = .vertical
//        view.distribution = .fillEqually
//        view.spacing = 30
//        return view
//    }()
//    
//    private lazy var activityIndicator: UIActivityIndicatorView = {
//        let view = UIActivityIndicatorView(frame: CGRect(x: 110, y: 300, width: 200, height: 200))
////        let view = UIActivityIndicatorView(style: .large)
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupViews()
//        
//        let queue = DispatchQueue.global(qos: .utility)
//        
//        queue.async{
//            sleep(arc4random() % 4)
//            
//            if let data = try? Data(contentsOf: self.imageURL) {
//                DispatchQueue.main.async { [weak self] in
//                    guard let self = self else { return }
//                    
//                    self.activityIndicator.stopAnimating()
//                    
//                    let view = UIImageView(image: UIImage(data: data))
//                    view.contentMode = .scaleAspectFit
//                    self.stackView.addArrangedSubview(view)
//                    print("Image is added")
//                }
//                print("Done")
//            }
//        }
//    }
//    private func setupViews() {
//        view.addSubview(stackView)
//        stackView.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
//            make.left.right.equalToSuperview()
//        }
//        stackView.addArrangedSubview(activityIndicator)
//        activityIndicator.startAnimating()
//    }
//}
