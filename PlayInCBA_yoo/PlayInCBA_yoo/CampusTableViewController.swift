//
//  CampusTableViewController.swift
//  PlayInCBA_yoo
//
//  Created by 게임공학과 on 2018. 5. 27..
//  Copyright © 2018년 게임공학과. All rights reserved.
//

import UIKit

class CampusTableViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    var imageView: UIImageView!
    var campusName : String?
    var image : UIImage?
    
    var ChooseCampus : String = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if(campusName == "필레오"){
            image = UIImage(named: "필레오팀.png")!
        } else if (campusName == "성용") {
            image = UIImage(named: "성용팀.png")!
        } else if (campusName == "남서울") {
            image = UIImage(named: "남서울팀.png")!
        } else if (campusName == "대학로") {
            image = UIImage(named: "대학로팀.png")!
        } else if (campusName == "강원") {
            image = UIImage(named: "강원팀.png")!
        } else if (campusName == "신촌") {
            image = UIImage(named: "신촌팀.png")!
        } else if (campusName == "천안") {
            image = UIImage(named: "천안팀.png")!
        } else if (campusName == "인천") {
            image = UIImage(named: "인천팀.png")!
        }
       
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x:0, y:0), size: (image?.size)!)
        scrollView.addSubview(imageView)
        
        scrollView.contentSize = (image?.size)!

        var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(CampusTableViewController.scrollViewDoubleTapped(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        scrollView.minimumZoomScale = minScale
        
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale
    }
    
    @objc func scrollViewDoubleTapped(_ recognizer: UITapGestureRecognizer){
        let pointInView = recognizer.location(in: imageView)
        
        var newZoomScale = scrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w/2.0)
        let y = pointInView.y - (h/2.0)
        
        let rectToZoomTo = CGRect(x: x, y:y, width: w, height: h)
        
        scrollView.zoom(to: rectToZoomTo, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segueToMapView"{
            if let navController = segue.destination as? UINavigationController{
                if let mapViewController = navController.topViewController as?
                    MapViewController {
                    mapViewController.campusName = campusName
                }
            }
        }
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
