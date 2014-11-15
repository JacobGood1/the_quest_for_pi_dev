import 'dart:html';
import 'package:stagexl/stagexl.dart';
import '../../shared/globals.dart';


CanvasElement canvas = querySelector('#stage')..width = canvasWidth..height = canvasHeight;
Stage stage = new Stage(canvas);
RenderLoop loop = new RenderLoop();
GameLoop gameLoop = new GameLoop();

var i = "it works";

class GameLoop extends Animatable{


  bool advanceTime(num time) {
    //place all timing code here!
    return true;
  }
}

class WebsocketSetup {
  WebSocket ws;
  WebsocketSetup() {
    // Initialize Websocket connection (9090 for during development locally,
    // otherwise use standard port 80 for production)
    Uri uri = Uri.parse(window.location.href);
    //var port = uri.port != 8080 ? 80 : 9090;
    var port = uri.port != 63342 ? 80 : 9090;
    ws = new WebSocket("ws://${uri.host}:${port}/ws");

    // Listen for Websocket events
    ws.onOpen.listen((e)    => print("Connected"));
    ws.onClose.listen((e)   => print("Disconnected"));
    ws.onError.listen((e)   => print("Error"));

    // Collect messages from the stream
    ws.onMessage.listen((e) {

    });
  }
}

main(){
  loop.addStage(stage);
  stage.juggler.add(gameLoop);
  new WebsocketSetup();
}