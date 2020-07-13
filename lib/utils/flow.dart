class Flow {
  int _current;
  List<FlowUnit> tasks;

  Flow(List<FlowUnit> tasks) {
    this.tasks = tasks;
    _current = 0;
  }

  void start() {
    _run();
  }

  void next() {
    if (_current + 1 < tasks.length) {
      _current++;
      _run();
    }
  }

  void prev() {
    if (_current - 1 >= 0) {
      _current--;
      _run();
    }
  }

  void fail() {
    _current = 0;
  }

  void _run() {
    var currentTask = tasks[_current];
    if (currentTask.canExecute()) {
      currentTask.task();
    }
  }
}

class FlowUnit {
  Function task;
  bool Function() canExecute = () => true;
}
