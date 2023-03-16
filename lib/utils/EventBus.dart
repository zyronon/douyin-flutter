export '';

typedef void EventCallback(arg);

class EventBus {
  static final eventMap = <Object, List<EventCallback>?>{};

  static void on(Object eventName, EventCallback f) {
    eventMap[eventName] ??= <EventCallback>[];
    eventMap[eventName]!.add(f);
  }

  static void off(eventName, [EventCallback? f]) {
    var list = eventMap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      eventMap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  static void emit(eventName, [arg]) {
    var list = eventMap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}
