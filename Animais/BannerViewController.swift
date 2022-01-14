//
//  BannerViewController.swift
//  Animais
//
//  Created by Jardel on 06/12/21.
//

import UIKit





class BannerViewController: UIViewController  {
   
    
    @IBOutlet weak var imagemTeste: UIImageView!
    var indexOfCellBeforeDragging = 0
    
    @IBOutlet weak var refreshIndicatorBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tamanhoCollection: NSLayoutConstraint!
    
    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var imagem: UIImageView!{
        didSet{
            self.imagem.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var viewStack: UIView!
 
    @IBOutlet weak var minhaStack: UIStackView!
    
    @IBOutlet weak var viewteste: UIView!
    @IBOutlet weak var imageview: UIImageView!
    
    private var tamanho = true
    var myViewHeightConstraint: NSLayoutConstraint!
    
    
    var flowLayout = UICollectionViewFlowLayout()
    
    // MARK: - Spotlight Products
    @IBOutlet weak var featuredProductsCollectionView: UICollectionView! {
        didSet {
            self.featuredProductsCollectionView.backgroundColor = .clear
            self.featuredProductsCollectionView.dataSource = self
            self.featuredProductsCollectionView.delegate = self
            self.featuredProductsCollectionView.showsHorizontalScrollIndicator = false
            self.featuredProductsCollectionView.register(UINib(nibName: String(describing: CelulaBanner.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CelulaBanner.self))
            
           
            flowLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 20
            self.featuredProductsCollectionView.collectionViewLayout = flowLayout
            
        }
    }
    
        let bannerPageControl: UIPageControl = {
           let pageControl = UIPageControl()
            pageControl.isHidden = true
           // pageControl.numberOfPages = 3
            return pageControl
        }()
        
    
    @IBOutlet weak var viewStackCollection: UIView!
    
    
  
        

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bannerPageControl.numberOfPages = 4
        
        self.minhaStack.layer.cornerRadius = 6
        self.minhaStack.clipsToBounds = true
        
        self.texto.text = "hhhhhhh f"
    
        myViewHeightConstraint = NSLayoutConstraint(item: self.featuredProductsCollectionView as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 100)
        myViewHeightConstraint.isActive = true
        
        
        
        /// teste imagens super.viewDidLoad()
        ///
        
        setupContrainst()
    }
    
    
    func setupContrainst(){
      
      //  viewStackCollection.addSubview(bannerPageControl)
        let view = UIView()
        bannerPageControl.backgroundColor = .clear
        view.addSubview(bannerPageControl)
        
        
        bannerPageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerPageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 90),
         //   bannerPageControl.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 70),
          //  bannerPageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bannerPageControl.widthAnchor.constraint(equalToConstant: featuredProductsCollectionView.frame.size.width),
            bannerPageControl.heightAnchor.constraint(equalToConstant: 10),
        ])
        
        self.viewStackCollection.addSubview(view)
        
    }

    
    @IBAction func vermais(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            
//            self.myViewHeightConstraint.constant = self.myViewHeightConstraint.constant == 132 ? 66 : 132
//            self.tamanhoCollection.constant = self.myViewHeightConstraint.constant
            
//            UIView.transition(with: self.view, duration: 1, options: .curveEaseInOut, animations: {
//
//                if self.tamanho {
//                    self.tamanho = false
//                }else{
//                    self.tamanho = true
//                }
//                self.view.setNeedsLayout()
//                self.view.layoutIfNeeded()
//               self.featuredProductsCollectionView!.collectionViewLayout.invalidateLayout()
//                //  self.featuredProductsCollectionView!.layoutSubviews()
//                self.featuredProductsCollectionView.reloadSections(IndexSet(integer: 0))
//
//             //  self.featuredProductsCollectionView.reloadData()
//
//            }) { finished in
//
//                self.myViewHeightConstraint.constant = self.myViewHeightConstraint.constant == 132 ? 66 : 132
//                self.tamanhoCollection.constant = self.myViewHeightConstraint.constant
//
//
//            }
            
//            self.myViewHeightConstraint.constant = self.myViewHeightConstraint.constant == 132 ? 66 : 132
//            self.tamanhoCollection.constant = self.myViewHeightConstraint.constant
            
//            self.tamanho = !self.tamanho
//            UIView.animate(withDuration: 1, animations: {
//
//               // self.tamanho = !self.tamanho
//
//
//                self.view.setNeedsLayout()
//              //  self.view.layoutIfNeeded()
//              //  self.featuredProductsCollectionView!.collectionViewLayout.invalidateLayout()
//                //  self.featuredProductsCollectionView!.layoutSubviews()
//              //  self.featuredProductsCollectionView.reloadSections(IndexSet(integer: 0))
//
//               self.featuredProductsCollectionView.reloadData()
//              //  self.featuredProductsCollectionView.layoutIfNeeded()
//
//
//             })

            
            
            UIView.animate(withDuration: 2.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 5 , animations: {
                
                self.myViewHeightConstraint.constant = self.myViewHeightConstraint.constant == 132 ? 66 : 132
                self.tamanhoCollection.constant = self.myViewHeightConstraint.constant
                self.view.layoutIfNeeded()
                self.tamanho = !self.tamanho
                self.featuredProductsCollectionView.reloadData()
            }){ _ in
                
              //  self.tamanho = !self.tamanho
                self.view.layoutIfNeeded()
                self.featuredProductsCollectionView.reloadData()
                
            }
            
//            UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: UIView.AnimationOptions.curveEaseInOut, animations: {
//                    self.view.layoutIfNeeded()
//                    self.featuredProductsCollectionView.reloadSections(IndexSet(integer: 0))
//                }, completion: { success in
//                    print("success")
//                })
            
            
//            UIView.transition(with: self.view, duration: 1, options:
//                   [.curveEaseInOut], animations: {
//                self.myViewHeightConstraint.constant = self.myViewHeightConstraint.constant == 132 ? 66 : 132
//                self.tamanhoCollection.constant = self.myViewHeightConstraint.constant
//
//                   }, completion: {_ in
//
//                       self.view.layoutIfNeeded()
//
//                       self.featuredProductsCollectionView.reloadData()
//                   })
        }
        
      
    }
    
    
    func indexOfMajorCell() -> Int {
        let itemWidth = collectionView( // 1
            featuredProductsCollectionView,
            layout: featuredProductsCollectionView.collectionViewLayout,
            sizeForItemAt: IndexPath(item: 0, section: 0)
        ).width
        
        let proportionalOffset = featuredProductsCollectionView.collectionViewLayout.collectionView!.contentOffset.x / itemWidth
        let index = Int(round(proportionalOffset))
        let numberOfItems = featuredProductsCollectionView.collectionViewLayout.collectionView!.numberOfItems(inSection: 0)
        let safeIndex = max(0, min(numberOfItems - 1, index))
        return safeIndex
    }
 
    
  
   

}

extension BannerViewController: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let paddingSpace = CGFloat(20.0)
            let availableWidth = self.view.frame.width - paddingSpace
            return CGSize(width: availableWidth, height: collectionView.frame.height)
        
        
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
            let visibleRect = CGRect(origin: self.featuredProductsCollectionView.contentOffset, size: self.featuredProductsCollectionView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            if let visibleIndexPath = self.featuredProductsCollectionView.indexPathForItem(at: visiblePoint) {
                self.bannerPageControl.currentPage = visibleIndexPath.row
            }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == self.featuredProductsCollectionView {
            // Stop scrollView sliding:
            targetContentOffset.pointee = scrollView.contentOffset
            
            // calculate where scrollView should snap to:
            let indexOfMajorCell = self.indexOfMajorCell()
            
            // calculate conditions:
            let dataSourceCount = collectionView(self.featuredProductsCollectionView.collectionViewLayout.collectionView!, numberOfItemsInSection: 0)
            let swipeVelocityThreshold: CGFloat = 0.5 // after some trail and error
            let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < dataSourceCount && velocity.x > swipeVelocityThreshold
            let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -swipeVelocityThreshold
            let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
            let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)
            
            if didUseSwipeToSkipCell {
                let indexPath = IndexPath(row: indexOfCellBeforeDragging, section: 0)
                self.featuredProductsCollectionView.collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            } else {
                // This is a much better way to scroll to a cell:
                let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
                self.featuredProductsCollectionView.collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CelulaBanner.self), for: indexPath) as? CelulaBanner {
            cell.configure(product: "",tamanho: self.tamanho)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("to clicando")
      
        
    }
    
    
    func shouldChooseViewToGo(with productId: Int, isCashbackFirstAccess: Bool = true) {
//        let router = StoreRouter(navigationController: navigationController ?? UINavigationController())
//        router.shouldChooseViewToGo(with: "\(productId)", isMiniCard: false, isCashbackFirstAccess: isCashbackFirstAccess)
    }
    
    
    
    
    
}
//featuredProductsCollectionView


//        UIView.animate(withDuration: 1,
//                       animations: {
//            if self.tamanho {
//                self.tamanho = false
//                print("clique if ", self.tamanho)
//            }else{
//                self.tamanho = true
//                print("clique else ", self.tamanho)
//            }
//
//        },completion: { finished in
//        //    self.featuredProductsCollectionView.reloadData()
//            self.view.layoutIfNeeded()
//        })





    
 
    
