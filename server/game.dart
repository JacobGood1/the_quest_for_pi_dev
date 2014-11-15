part of server;

List clientInput = [];
List serverEntities = [];

var x = 1;

class PhysicsState{
  GameLoopIsolate physicsLoop = new GameLoopIsolate();
  PhysicsState(){
    physicsLoop.onUpdate = ((physicsLoop) {
    // Update game logic here.
      //print('${physicsLoop.frame}: ${physicsLoop.gameTime} [dt = ${physicsLoop.dt}].');

    });
  }
}


class ServerState{
  double SERVERTICK = 0.045,
         reset = 0.0;
  GameLoopIsolate serverLoop = new GameLoopIsolate();
  ServerState(){
    serverLoop.onUpdate = ((serverLoop) {
      // Update game logic here.
      reset += serverLoop.dt;
      if(reset >= SERVERTICK){
        reset = 0.0;
        //send all entity updates back to the client, this is authoritative
        if(websocket != null){
          serverEntities.forEach((entity) => websocket.add(JSON.encode({'hi': "hi there my name is marvin"})));
        }
      }

    });
  }

}








