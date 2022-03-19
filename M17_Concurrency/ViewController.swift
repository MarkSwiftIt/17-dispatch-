//
//  ViewController.swift
//  M17_Concurrency
//
//  Created by Maxim NIkolaev on 08.12.2021.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
//
    let service = Service()

    var images = [UIImage]()

    
    private lazy var imageView: UIImageView = {
            let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            view.contentMode = .scaleAspectFit
            return view
        }()

//    private lazy var imageView: UIImageView = {
//      let view = UIImageView(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
//
//        view.contentMode = .scaleAspectFit
//        return view
//    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: CGRect(x: 110, y: 300, width: 200, height: 200))
        return view
    }()



    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 30
        return view
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        onLoad()
        setupViews()
    }


    private func setupViews() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview()
        }
        stackView.addArrangedSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    private func onLoad() {

//          let queue = DispatchQueue.global()
        let dispatchGroup = DispatchGroup()

        for _ in 0...4 {
            dispatchGroup.enter()
            print(Thread.current)
            service.getImageURL { urlString, error in
                guard let urlString = urlString else {
                    return
        }

            guard let image = self.service.loadImage(urlString: urlString) else { return }
            print(image)
            self.images.append(image)
            dispatchGroup.leave()
            }
            }


    dispatchGroup.notify(queue: .main) { [weak self] in
        print(self!.images.count)
        print(Thread.current)
        guard let self = self else { return }
        self.activityIndicator.stopAnimating()
        self.stackView.removeArrangedSubview(self.activityIndicator)

        for z in 0...4 {
//            self.addImage(data: self.images[z])
            let imageView = UIImageView(image: self.images[z])
//            self.imageView.image = self.images[z]
            imageView.contentMode = .scaleAspectFit
            self.stackView.addArrangedSubview(imageView)
            print(self.images[z])
        }
        }
        }
        
        
        
}
        
        
        
        
        
        
//        DispatchQueue.global(qos: .userInitiated).sync {
//        let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
//        let dispatchGroup = DispatchGroup()
//
//             dispatchGroup.enter()
        
//
//            let queue = DispatchQueue.global(qos: .utility)
//                queue.async{
//                    let dispatchGroup = DispatchGroup()
//                    dispatchGroup.enter()
//            self.service.getImageURL { urlString, error in
//            guard
//                let urlString = urlString
//            else {
//                return
//            }
//                if let data = try? Data(contentsOf: urlString){
//                               DispatchQueue.main.async {
//
//            let image = self.service.loadImage(urlString: urlString)
//            self.imageView.image = image
//
//            self.activityIndicator.stopAnimating()
//                                   dispatchGroup.leave()
      
//
//            let dispatchGroup = DispatchGroup()
//
//            for i in 0...1 {
//                dispatchGroup.enter()
//                service.getImageURL(imageURL: URL(string: imageUrl[i])!,
//                                    runQueue: DispatchQueue.global(),
//                                    completionQueue: DispatchQueue.main)
//                {  urlString, error in
//                    guard let urlString = urlString else {return}
//                    images.append(urlString)
//                    dispatchGroup.leave()
//                }
//            }
//
//            for i in 2...4 {
//                DispatchQueue.global(qos: .userInitiated).async(group: dispatchGroup) {
//                    if let urls = URL(string: imageUrl[i]),
//                       let dates = try? Data(contentsOf: urls) {
//                    images.append(UIImage(data: dates)!)
//        }
//            }
//            }
//
//        dispatchGroup.notify(queue: DispatchQueue.main) {
//            for i in 0...4 {
//                view.ivs[i].image = images[i]
//            }
//        }
                
            
                
//
//                {  urlString, error in
//                    guard
//                        let urlString = urlString else {
//                        return
//            }
//                    guard let image = self.service.loadImage (urlString: urlString) else { return }
//                    print (image)
//                    self.image.append(image)
//                    dispatchGroup.leave ()
//                    }
//                    }
        
//        
//                    dispatchGroup.notify (queue: .main) { [weak self] in
//                    print (self!.images.count)
//                    print(Thread.current)
//                    guard let self
//                    = self else { return }
//                    self.activityIndicator.stopAnimating()
//                    self.stackView.removeArrangedSubview(self.activityIndicator)
//                    for i in 0...4 {
//                    self. imageView. image = self. images[i]
//                    self. stackView.addArrangedSubview(self.imageView)
//                    print (self. images[i])
//                    }
                
                
                
                
                
                
                
                
                
//                DispatchQueue.global().async(group: dispatchGroup) {
//                    if let url = URL(string: )
//                }
                
                
                
                
                
                
                
                
                
                
//                dispatchGroup.enter()
//                service.getImageURL(urlString: URL(string: i[i])!,
//                                  runQueue: DispatchQueue.global(),
//                                  completionQueue: DispatchQueue.main)
//                { result, error in
//                    guard let image1 = result else {return}
//                    images.append(image1)
//                    dispatchGroup.leave()
//                }
                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
//            dispatchGroup.leave()
//            dispatchGroup.wait()
       
//    let queue = DispatchQueue.global(qos: .utility)
//        queue.sync{
//            if let data = try? Data(contentsOf: urlString){
//                DispatchQueue.main.sync {
//                    image.image = UIImage(data: data)
//                     print("Show image data")
//                }
//                print("Did download  image data")
          
        
       
//        dispatchGroup.leave()
//        dispatchGroup.wait()
//          DispatchQueue.main.async {
//             print("CLightBulb: (After wait) The power value is \(imageView) at " + Date().description(with: Locale.current))
          
    
//    func asynsUsial (){
//        print("/n----- asyncUsial ---\n")
//        for i in 0...3 {
//            let url = URL(string: imageView[i])
//            let request = URLRequest(url: url!)
//            let task = URLSession.shared.dataTask(with: request, completionHandler: data, response, error) -> Void in
//            DispatchQueue.main.async { [weak self] in
//                guard let self = self else { return }
//                print("image\(i)")
//                self.addImage(data: data!)
//            }
//        }
//        task.resume()
//    }


