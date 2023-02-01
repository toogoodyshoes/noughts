import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:noughts/features/authentication/presentation/authentication_provider.dart';
import 'package:noughts/features/authentication/presentation/login_page.dart';
import 'package:noughts/features/authentication/presentation/sign_up_page.dart';
import 'package:noughts/features/note/presentation/home_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      redirect: (context, state) {
        AuthenticationProvider provider =
            context.read<AuthenticationProvider>();
        if (provider.state is UnAuthenticated) {
          return '/login';
        }
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
      redirect: (context, state) {
        AuthenticationProvider provider =
            context.read<AuthenticationProvider>();
        if (provider.state is Authenticated) {
          return '/';
        }
      },
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpPage(),
      redirect: (context, state) {
        AuthenticationProvider provider =
            context.read<AuthenticationProvider>();
        if (provider.state is Authenticated) {
          return '/';
        }
      },
    ),
  ],
  initialLocation: '/',
);
