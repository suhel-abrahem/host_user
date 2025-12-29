import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hosta_user/config/route/routes_manager.dart';
import '../../core/resource/socketio_service.dart/home_socket_initializer.dart';

class RouteTracker extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}

  @override
  void didPop(Route route, Route? previousRoute) {}

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {}
}
