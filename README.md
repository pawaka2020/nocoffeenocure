# nocoffeenocure

mobile app for No Coffee No Cure

Suggested screens with navigation tree (WIP):
- SplashScreen
  |
  +-- OnboardingScreen
  |
  +-- AuthenticationFlow
  |   |
  |   +-- LoginScreen
  |   |
  |   +-- RegistrationScreen
  |
  +-- MainAppFlow (Authenticated User)
  |   |
  |   +-- HomeScreen
  |   |
  |   +-- MenuScreen
  |   |
  |   +-- ProductDetailScreen
  |   |
  |   +-- CartFlow
  |   |   |
  |   |   +-- CartScreen
  |   |   |
  |   |   +-- CheckoutScreen
  |   |   |
  |   |   +-- OrderHistoryScreen
  |
  |   +-- ProfileFlow
  |   |   |
  |   |   +-- ProfileScreen
  |   |   |
  |   |   +-- FavoritesScreen
  |
  |   +-- StoreLocatorScreen
  |
  |   +-- NotificationsScreen
  |
  |   +-- SettingsScreen
  |   |   |
  |   |   +-- ContactScreen
  |   |   |
  |   |   +-- RateAndReviewScreen
  |
  |   +-- LogoutScreen
  |
  +-- PromotionsScreen
  |
  +-- FeedbackScreen
  |
  +-- AboutScreen

User story (WIP)
- User sees a 'splash_screen' showing logo, auto-move in 3 seconds.
- Then in 'onboarding_screen' show latest [news] while masking a loading process. 
- Once loading complete, move to 'home_screen'.
- 'home_screen' has following UI elements:
1 - top banner
- shows the latest [news] in a given month such as newest items, branch openings, festival greetings, etc.
- auto slides to the right every few seconds, but user can still slide manually left and right.
2 - vouchers
- show latest one from [rewards] such as gifts or vouchers for users, with 'view all' clickable text.
3 - menu
- A scroll list of items in category 'coffee', 'non-coffee', etc, each category has its own grid-view with 'view all.
4 - bottom nav bar
- 'Home', return to home_screen's default view
- 'Menu', a fuller, more comprehensive view of the store's offerings
- 'Rewards', showing all [rewards] available for user in a comprehensive view.
- 'Me', showing the following items in a list view: 'signup or login', 'help', 'contact us', 'terms of service',
  - 'privacy policy', 'about our store'.

my_coffee_app/
├── lib/
│   ├── main.dart // The entry point of your app.
│   ├── screens/
│   │   ├── splash_screen.dart 
│   │   ├── onboarding_screen.dart 
│   │   ├── home_screen.dart
│   │   ├── news_detail.dart
│   │   ├── vouchers.dart
│   │   ├── menu_detail.dart
│   │   ├── rewards.dart
│   │   ├── me.dart
│   ├── widgets/
│   │   ├── top_banner.dart
│   │   ├── vouchers_list.dart
│   │   ├── menu_category.dart
│   │   ├── bottom_nav_bar.dart
│   ├── models/
│   │   ├── offline/
│   │   │   ├── news.dart
│   │   │   ├── voucher.dart
│   │   │   ├── menu_item.dart
│   │   │   ├── reward.dart
│   │   ├── online/
│   │   │   ├── news.dart
│   │   │   ├── voucher.dart
│   │   │   ├── menu_item.dart
│   │   │   ├── reward.dart
│   │   ├── cached/
│   │   │   ├── news.dart
│   │   │   ├── voucher.dart
│   │   │   ├── menu_item.dart
│   │   │   ├── reward.dart
│   ├── data/
│   │   ├── offline/
│   │   │   ├── news_data.dart
│   │   │   ├── voucher_data.dart
│   │   │   ├── menu_data.dart
│   │   │   ├── reward_data.dart
│   │   ├── online/
│   │   │   ├── news_data.dart
│   │   │   ├── voucher_data.dart
│   │   │   ├── menu_data.dart
│   │   │   ├── reward_data.dart
│   ├── utils/
│   │   ├── navigation_utils.dart
│   │   ├── api.dart
└── assets/
├── images/
│   ├── logo.png
│   ├── news_images/
├── fonts/




TODO: Use Orbitron from Google Font, medium type (600)
