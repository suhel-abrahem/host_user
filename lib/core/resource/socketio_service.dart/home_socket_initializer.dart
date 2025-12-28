import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/core/resource/socketio_service.dart/socketio_service.dart';

import '../rst_stream/rst_stream.dart';

bool _homeSocketInitialized = false;
final homePageSocket = getItInstance<SocketService>();
void initHomeSocketListeners() {
  if (_homeSocketInitialized) return;

  homePageSocket.on(
    event: "notification:unread_count",
    callback: (data) {
      notificationStreamSocket.addResponse(data["unread_count"].toString());
    },
  );

  homePageSocket.on(
    event: "notification:new",
    callback: (data) {
      notificationStreamSocket.addResponse(data["unread_count"].toString());
    },
  );

  homePageSocket.on(
    event: "chat:unread_messages",
    callback: (data) {
      chatUnReadCountStreamSocket.addResponse(data["unread_count"]);
    },
  );

  homePageSocket.on(
    event: "chat:new_message",
    callback: (data) {
      chatUnReadCountStreamSocket.addResponse(data["unread_count"]);
    },
  );

  _homeSocketInitialized = true;
}
