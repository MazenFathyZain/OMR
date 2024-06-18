class ExamData {
  String? subjectName;
  String? examName;
  String? examType;
  int? numQuestions;
  int? qMark;
  int? iMark;
  ClassName? className;
  DateTime? examDate;
  List<String?>? selectedAnswers;
  List<Student>? students;

  ExamData({
    this.subjectName,
    this.examName,
    this.examType,
    this.numQuestions,
    this.qMark,
    this.iMark,
    this.className,
    this.examDate,
    this.selectedAnswers,
    this.students,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) => ExamData(
        subjectName: json['subjectName'],
        examName: json['examName'],
        examType: json['examType'],
        numQuestions: json['numQuestions'],
        qMark: json['qMark'],
        iMark: json['iMark'],
        className: json['className'] != null
            ? ClassName.fromJson(json['className'])
            : null,
        examDate:
            json['examDate'] != null ? DateTime.parse(json['examDate']) : null,
        selectedAnswers: json['selectedAnswers'] != null
            ? List<String?>.from(json['selectedAnswers'])
            : null,
        students: json['students'] != null
            ? List<Student>.from(
                json['students'].map((x) => Student.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'subjectName': subjectName,
        'examName': examName,
        'examType': examType,
        'numQuestions': numQuestions,
        'qMark': qMark,
        'iMark': iMark,
        'className': className?.toJson(),
        'examDate': examDate?.toIso8601String(),
        'selectedAnswers': selectedAnswers,
        'students': students != null
            ? List<dynamic>.from(students!.map((x) => x.toJson()))
            : null,
      };
}

class ClassName {
  String? name;
  List<Student>? stdList;

  ClassName({this.name, this.stdList});

  ClassName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['stdList'] != null) {
      stdList = <Student>[];
      json['stdList'].forEach((v) {
        stdList!.add(new Student.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.stdList != null) {
      data['stdList'] = this.stdList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Student {
  String? stdName;
  String? stdId;
  String? image;

  Student({this.stdName, this.stdId, this.image});

  Student.fromJson(Map<String, dynamic> json) {
    stdName = json['stdName'];
    stdId = json['stdId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stdName'] = this.stdName;
    data['stdId'] = this.stdId;
    data['image'] = this.image;
    return data;
  }
}
