import 'package:go_router/go_router.dart';
import 'package:merge_cert/routing/routes.dart';
import 'package:merge_cert/ui/home/view_models/home_viewmodel.dart';
import 'package:merge_cert/ui/home/widgets/home_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomeScreen(viewModel: HomeViewModel());
      },
    ),
  ],
);
