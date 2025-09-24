import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shopping_app/routes/routes.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/store/store.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: RRoutes.home,           page: () => const HomeScreen()),
    GetPage(name: RRoutes.store,          page: () => const StoreScreen()),
    // GetPage(name: RRoutes.favourites,     page: () => const FavouriteScreen()),
    GetPage(name: RRoutes.settings,       page: () => const SettingsScreen()),
    GetPage(name: RRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: RRoutes.order,          page: () => const OrderScreen()),
    GetPage(name: RRoutes.checkout,       page: () => const CheckoutScreen()),
    GetPage(name: RRoutes.cart,           page: () => const CartScreen()),
    GetPage(name: RRoutes.userProfile,    page: () => const ProfileScreen()),
    GetPage(name: RRoutes.userAddress,    page: () => const UserAddressScreen()),
    GetPage(name: RRoutes.signup,         page: () => const SignupScreen()),
    GetPage(name: RRoutes.verifyEmail,    page: () => const VerifyEmailScreen()),
    GetPage(name: RRoutes.signIn,         page: () => const LoginScreen()),
    GetPage(name: RRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: RRoutes.onBoarding,     page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
