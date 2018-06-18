//
//  CBAinfoViewController.swift
//  PlayInCBA_yoo
//
//  Created by 게임공학과 on 2018. 6. 9..
//  Copyright © 2018년 게임공학과. All rights reserved.
//

import UIKit

class CBAinfoViewController: UIViewController, UIScrollViewDelegate {

    var audioController: AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    @IBAction func Back(_ sender: UIBarButtonItem) {
        audioController.playerEffect(name: "ding.mp3")
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var imageView: UIImageView!
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image = UIImage(named: "CBA정보.png")!
        
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x:0, y:0), size: (image?.size)!)
        scrollView.addSubview(imageView)
        
        scrollView.contentSize = (image?.size)!
        
        var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(CampusTableViewController.scrollViewDoubleTapped(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width * 2 / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height * 2 / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        scrollView.minimumZoomScale = minScale
        
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale
        
        centerScrollViewContents()
        // Do any additional setup after loading the view.
    }
    
    func centerScrollViewContents(){
        let boundsSize = scrollView.bounds.size
        var contensFrame = imageView.frame
        
        if contensFrame.size.width < boundsSize.width{
            contensFrame.origin.x = (boundsSize.width - contensFrame.size.width) / 2.0
        } else{
            contensFrame.origin.x = 0.0
        }
        if contensFrame.size.height < boundsSize.height{
            contensFrame.origin.y = (boundsSize.height - contensFrame.size.height) / 2.0
        } else{
            contensFrame.origin.y = 0.0
        }
        imageView.frame = contensFrame
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
        
        let rectToZoomTo = CGRect(x: x, y:y, width: w*10, height: h*10)
        
        scrollView.zoom(to: rectToZoomTo, animated: true)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView){
        centerScrollViewContents()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
