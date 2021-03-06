import 'package:flutter/material.dart';
import './home_widget.dart';
import './classes_widget.dart';
import './booked_classes_widget.dart';
import './profile_widget.dart';
import './rewards_widget.dart';
import './social_widget.dart';

List<AppPage> appPages = [
  // Order is important. Needs to be the same as the navigation order!
  AppPage(pageTitle: 'Mama Fit Club', pageWidget: HomeWidget()),
  // AppPage(pageTitle: 'Guide', pageWidget: GuideWidget()),
  AppPage(pageTitle: 'Classes', pageWidget: ClassesWidget()),
  AppPage(pageTitle: 'Bookings', pageWidget: BookedClassesWidget()),
  AppPage(pageTitle: 'Rewards', pageWidget: RewardsWidget()),
  AppPage(pageTitle: 'Social', pageWidget: SocialWidget()),
  AppPage(pageTitle: 'Profile', pageWidget: ProfileWidget()),
];

class AppPage {
  final String pageTitle;
  final Widget pageWidget;
  const AppPage({this.pageTitle, this.pageWidget});
}