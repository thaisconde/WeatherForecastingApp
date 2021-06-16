import UIKit

class TabBarController: UITabBarController {
    private let firstTabName = "Today"
    private let secondTabName = "Forecast"
    
    let firstViewController: TodayViewController
    let secondViewController: ForecastViewController

    init(firstViewController: TodayViewController,
         secondViewController: ForecastViewController) {
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupApperance()
        setupVCs()
    }
}

private extension TabBarController {
    func setupApperance() {
        configTabBar()
        configNavigationBar()
    }
    
    func configTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
    }
    
    func configNavigationBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearace.shadowImage = UIImage()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: firstViewController,
                                title: firstTabName,
                                image: Assets.TabBar.tabBarForecast.image),
            createNavController(for: secondViewController,
                                title: secondTabName,
                                image: Assets.TabBar.tabBarToday.image)
        ]
    }
    
    func createNavController(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        // navController.navigationBar.prefersLargeTitles = true
        // rootViewController.navigationItem.title = title
        return navController
    }
}
