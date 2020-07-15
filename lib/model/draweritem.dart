import 'package:flutter/material.dart';
import 'package:homevee_app/gui/fragments/dashboard.dart';
import 'package:homevee_app/gui/fragments/overview.dart';
import 'package:homevee_app/gui/fragments/room.dart';
import 'package:homevee_app/gui/fragments/settings.dart';

class DrawerItem{
  String title;
  String id;
  Icon icon;

  DrawerItem(this.title, this.icon, this.id);

  StatefulWidget getFragment(){
    switch (id) {
      case "dashboard":
        return new DashboardFragment();
      case "overview":
        return new OverviewFragment();
      case "settings":
        return new SettingsFragment();
      default:
        return new RoomFragment(id, title);
    }
  }
}