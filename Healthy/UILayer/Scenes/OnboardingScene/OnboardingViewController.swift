//
//  OnboardingViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Views
    let pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal)
    let pageControl = UIPageControl()
    var contextButton = MainButton(appearence: .fill, title: "Next")
    // MARK: - Properties
    var pages = [OnboardingLayerController]()
    var viewOutput: OnboardingOutput!
    
    init(pages: [OnboardingLayerController] = [OnboardingLayerController](), viewOutput: OnboardingOutput!) {
        super.init(nibName: nil, bundle: nil)
        self.pages = pages
        self.viewOutput = viewOutput
    }
    
    required init?(coder: NSCoder) {
        fatalError("NSCoder")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
        setupPageControl()
        setupContextButton()
    }


}

private extension OnboardingViewController {
    func setupPageController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = .white
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
    }
    
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = AccentColors.mainBlue
        pageControl.pageIndicatorTintColor = AccentColors.unselectedIcon
        // turning off switch pages by tapping on circles
        pageControl.isUserInteractionEnabled = false
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -322)
        ])
    }
    
    func setupContextButton() {
        view.addSubview(contextButton)
        
        contextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            contextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            contextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            contextButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        contextButton.action = buttonPressed
    }
}

extension OnboardingViewController {
    func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true)
            contextButton.setTitle(pages[1].buttonText)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true)
            contextButton.setTitle(pages[2].buttonText)
        case 2:
            viewOutput.onboardingFinish()
            print("great!")
        default:
            break
        }
    }
}
    
    // MARK: - Delegates
    extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let currentPage = pages.firstIndex(of: viewController as! OnboardingLayerController), currentPage > 0 else { return nil}
            return pages[currentPage - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let currentPage = pages.firstIndex(of: viewController as! OnboardingLayerController), currentPage < pages.count - 1 else { return nil }
            return pages[currentPage + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if !completed {
                guard let previousViewController = previousViewControllers.first else { return }
                if let index = pages.firstIndex(of: previousViewController as! OnboardingLayerController) {
                    pageControl.currentPage = index
                }
            }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
            guard let nextViewController = pendingViewControllers.first else { return }
            if let index = pages.firstIndex(of: nextViewController as! OnboardingLayerController) {
                pageControl.currentPage = index
                contextButton.setTitle(pages[index].buttonText)
            }
        }
    }
