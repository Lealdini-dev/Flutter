import 'package:flutter/material.dart';
import 'package:neo_bank_oficial/screens/dashboard.dart';

bool featureFeatureItemMatcher(Widget widget, String name, IconData icon) {
  if (widget is FeatureItem) {
    return widget.name == name && widget.icon == icon;
  }
  return false;
}
