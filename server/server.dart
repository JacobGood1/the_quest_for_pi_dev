library server;

import 'package:vane/vane.dart';
import 'dart:async';
import 'package:game_loop/game_loop_isolate.dart';
import 'dart:io';
import 'dart:convert';

part 'game.dart';

WebSocket websocket;

class Game extends Vane {


  @Route("/ws")
  Future main() {
    websocket = ws;
    // Start listening to websocket connection
    StreamSubscription conn = ws.listen(null);

    // Set ping interval to prevent disconnection from peers
    ws.pingInterval = new Duration(seconds: 5);

    // Add all incoming message to the stream
    conn.onData((msg) {
      clientInput.add(msg);
      log.info(msg);
    });

    // On error, log warning
    conn.onError((e) => log.warning(e));

    // Close connection if websocket closes
    conn.onDone(() => close());
    return end;
  }
}

main(){

  PhysicsState ps = new PhysicsState()..physicsLoop.start();
  ServerState ss = new ServerState()..serverLoop.start();
  serve();

}