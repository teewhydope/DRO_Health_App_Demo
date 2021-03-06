import 'package:flutter/material.dart';

class Model {
  final String id;
  final String title;
  final String description;
  final String images;
  final Color color;
  final String pages;

  const Model({
    this.id,
    this.title,
    this.description,
    this.images,
    this.color,
    this.pages,
  });
}

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}

class DropListModel {
  final List<OptionItem> listOptionItems;
  DropListModel(this.listOptionItems);
}

class OptionItem {
  final String id;
  final String title;

  OptionItem({@required this.id, @required this.title});
}
