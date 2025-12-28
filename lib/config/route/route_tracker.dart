import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hosta_user/config/route/routes_manager.dart';
import '../../core/resource/socketio_service.dart/home_socket_initializer.dart';

class RouteTracker extends NavigatorObserver {
  void _handleLocation() {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    final location = GoRouter.of(context).state.path;
    print('🚦 Location changed: $location');

    if (location?.endsWith(RoutesPath.homePage) == true) {
      // ✅ ENTER HOME
      if (!homePageSocket.isConnected) {
        homePageSocket.connect();
        initHomeSocketListeners();
        print('🔌 Socket CONNECTED (Home)');
      }
    } else {
      // ❌ LEAVE HOME
      if (homePageSocket.isConnected) {
        homePageSocket.disconnect();
        print('🔌 Socket DISCONNECTED (Left Home)');
      }
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _handleLocation();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _handleLocation();
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _handleLocation();
  }
}
