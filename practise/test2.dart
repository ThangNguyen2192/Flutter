
void main(List<String> args) {
  FlutterCourse f = FlutterCourse(10);
  f.updateNumberOfSessions(20);
}
class Course {
  int numberOfSessions;

  Course(this.numberOfSessions) {
    if (numberOfSessions < 10) {
      throw Exception("Số buổi học không thể nhỏ hơn 10 buổi.");
    }
  }

  void updateNumberOfSessions(int newNumberOfSessions) {
    if (newNumberOfSessions < 10) {
      throw Exception("Số buổi học không thể nhỏ hơn 10 buổi.");
    }
    numberOfSessions = newNumberOfSessions;
  }
}

class FlutterCourse extends Course {
  FlutterCourse(int numberOfSessions) : super(numberOfSessions);

  void updateNumberOfSessions(int newNumberOfSessions) {
    super.updateNumberOfSessions(newNumberOfSessions);
  }

  void updateAndroidSessions(AndroidCourse androidCourse) {
    androidCourse.updateNumberOfSessions(numberOfSessions + 5);
  }
}

class AndroidCourse extends Course {
  AndroidCourse(int numberOfSessions) : super(numberOfSessions);

  void updateNumberOfSessions(int newNumberOfSessions) {
    if (newNumberOfSessions < 10) {
      throw Exception("Số buổi học không thể nhỏ hơn 10 buổi.");
    }
    numberOfSessions = newNumberOfSessions;
  }

  void updateFlutterSessions(FlutterCourse flutterCourse) {
    flutterCourse.updateNumberOfSessions(numberOfSessions - 5);
  }

  void updateIosSessions(IOSCourse iosCourse) {
    iosCourse.updateNumberOfSessions(numberOfSessions + 3);
  }
}

class IOSCourse extends Course {
  IOSCourse(int numberOfSessions) : super(numberOfSessions);

  void updateNumberOfSessions(int newNumberOfSessions) {
    if (newNumberOfSessions < 10) {
      throw Exception("Số buổi học không thể nhỏ hơn 10 buổi.");
    }
    numberOfSessions = newNumberOfSessions;
  }

  void updateAndroidSessions(AndroidCourse androidCourse) {
    androidCourse.updateNumberOfSessions(numberOfSessions - 3);
  }

  void updateWebSessions(WebCourse webCourse) {
    webCourse.updateNumberOfSessions(numberOfSessions + 2);
  }
}

class WebCourse extends Course {
  WebCourse(int numberOfSessions) : super(numberOfSessions);

  void updateNumberOfSessions(int newNumberOfSessions) {
    if (newNumberOfSessions < 10) {
      throw Exception("Số buổi học không thể nhỏ hơn 10 buổi.");
    }
    numberOfSessions = newNumberOfSessions;
  }

  void updateFlutterSessions(FlutterCourse flutterCourse) {
    flutterCourse.updateNumberOfSessions(numberOfSessions + 2);
  }
}
