import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRoute{
  // The route configuration.

  static const kSplashView= '/splashView';
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final route = {
    kSplashView:(context) => const SplashView(),
    kHomeView:(context) => const HomeView(),
    kBookDetailsView:(context) => const BookDetailsView(),
    kSearchView:(context) => const SearchView(),

  };
}