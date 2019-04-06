import 'package:flutter/material.dart';
import './home_widget.dart';
import './classes_widget.dart';
import './schedule_widget.dart';
import './profile_widget.dart';

List<AppPage> appPages = [
  AppPage(pageTitle: 'Mama Fit Club', pageWidget: HomeWidget()),
  AppPage(pageTitle: 'Classes', pageWidget: ClassesWidget()),
  AppPage(pageTitle: 'Schedule', pageWidget: ScheduleWidget()),
  AppPage(pageTitle: 'Profile', pageWidget: ProfileWidget()),
];

class AppPage {
  final String pageTitle;
  final Widget pageWidget;

  const AppPage({this.pageTitle, this.pageWidget});
}