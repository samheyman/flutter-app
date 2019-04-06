import 'package:scoped_model/scoped_model.dart';
import 'dart:collection';
import 'gym_class.dart';

class BookingsModel extends Model {
  final List<GymClass> _gymClasses = [];

  UnmodifiableListView<GymClass> get gymClasses => UnmodifiableListView(_gymClasses); 

  int get numberOfClasses => _gymClasses.length;

  void add(GymClass gymClass) {
    _gymClasses.add(gymClass);
    notifyListeners();
  }
}