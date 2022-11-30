class Homework {
  final String classImage;
  final String name;
  final String schedule;
  final String classroom;
  final String days;

  Homework(
    this.classImage,
    this.name,
    this.schedule,
    this.classroom,
    this.days,
  );
  factory Homework.fromMap(Map<String, dynamic> json) {
    return Homework(json['class_image'],json['name'], json['schedule'], json['classroom'], json['days']);
  }
  factory Homework.fromJson(Map<String, dynamic> json) {
    return Homework(json['class_image'],json['name'], json['schedule'], json['classroom'], json['days']);
  }
}
