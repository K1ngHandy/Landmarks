//
//  PageViewController.swift
//  Landmarks
//
//  Created by Steve Handy on 2024.05.27.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable { // stores array of page instances
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
}
