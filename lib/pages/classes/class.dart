class Class {
  String classImage;
  String name;
  String schedule;
  String classroom;
  String days;

  Class(
    this.classImage,
    this.name,
    this.schedule,
    this.classroom,
    this.days,
  );
  factory Class.fromMap(Map<String, dynamic> json) {
    return Class(json['class_image'], json['name'], json['schedule'],
        json['classroom'], json['days']);
  }
  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
        json['data']['rows'][0]['class_image'],
        json['data']['rows'][0]['name'],
        json['data']['rows'][0]['schedule'],
        json['data']['rows'][0]['classroom'],
        json['data']['rows'][0]['days']);
  }
  String printObject() {
    return "classImage= $classImage, name= $name, schedule= $schedule, classroom= $classroom, days= $days";
  }
}
