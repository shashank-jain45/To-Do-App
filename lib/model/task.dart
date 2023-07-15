import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  String? discription;
  DateTime date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavourite;
  Task({
    this.isFavourite,
    this.discription,
    required this.title,
    required this.date,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavourite = isFavourite ?? false;
  }

  Task copyWith(
      {String? discription,
      String? title,
      bool? isDone,
      bool? isDeleted,
      DateTime? date,
      bool? isfavourite}) {
    return Task(
        discription: discription ?? this.discription,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        date: date ?? this.date,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    if (discription != null) {
      result.addAll({'discription': discription});
    }
    result.addAll({'date': date.millisecondsSinceEpoch});
    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }
    if (isFavourite != null) {
      result.addAll({'isFavourite': isFavourite});
    }

    return result;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      discription: map['discription'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      isFavourite: map['isFavourite'],
    );
  }

  @override
  List<Object?> get props =>
      [title, isDone, isDeleted, date, discription, isFavourite];
}
