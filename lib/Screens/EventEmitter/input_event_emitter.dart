import 'package:events_emitter/events_emitter.dart';

class InputEventEmitter extends EventEmitter {
    String name;

    InputEventEmitter(this.name);

    void say(String message) => emit('say', message);
    void eat(String food) => emit('eat', food);
    void jump(double height) => emit('jump', height);
}