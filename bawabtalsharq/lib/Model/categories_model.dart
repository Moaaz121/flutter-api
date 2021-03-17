import 'dart:core';

import 'package:bawabtalsharq/Utils/images.dart';

class Category {
  String name;
  int color;
  String icon;
  List<SubCategory> subCategory = [];
  Category(this.name, this.color, this.icon, this.subCategory);
}

class SubCategory {
  String name;
  String icon;
  SubCategory(this.name, this.icon);
}

List<Category> categoriesArr = [
  Category('cat1', 0xFFF44336, cold_drinks, [
    SubCategory('aa', cold_drinks),
    SubCategory('aa2', cold_drinks),
    SubCategory('aa3', cold_drinks)
  ]),
  Category('cat2', 0xFF4CAF50, cold_drinks, [
    SubCategory('bb', cold_drinks),
    SubCategory('bb2', cold_drinks),
    SubCategory('bb3', cold_drinks)
  ]),
  Category('cat3', 0xFFFF9800, cold_drinks, [
    SubCategory('cc', cold_drinks),
    SubCategory('cc2', cold_drinks),
    SubCategory('cc3', cold_drinks),
    SubCategory('ccc3', cold_drinks)
  ]),
  Category('cat4', 0xFF00FFEA, cold_drinks, [
    SubCategory('dd', cold_drinks),
    SubCategory('dd2', cold_drinks),
    SubCategory('dd3', cold_drinks)
  ]),
  Category('cat5', 0xFFFFF200, cold_drinks, [
    SubCategory('ee', cold_drinks),
    SubCategory('ee2', cold_drinks),
    SubCategory('ee3', cold_drinks),
    SubCategory('ee3', cold_drinks)
  ]),
  Category('cat6', 0xEDD900FF, cold_drinks, [
    SubCategory('ff', cold_drinks),
    SubCategory('ff2', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff3', cold_drinks)
  ]),
  Category('cat1', 0xFFF44336, cold_drinks, [
    SubCategory('aa', cold_drinks),
    SubCategory('aa2', cold_drinks),
    SubCategory('aa3', cold_drinks)
  ]),
  Category('cat2', 0xFF4CAF50, cold_drinks, [
    SubCategory('bb', cold_drinks),
    SubCategory('bb2', cold_drinks),
    SubCategory('bb3', cold_drinks)
  ]),
  Category('cat3', 0xFFFF9800, cold_drinks, [
    SubCategory('cc', cold_drinks),
    SubCategory('cc2', cold_drinks),
    SubCategory('cc3', cold_drinks),
    SubCategory('ccc3', cold_drinks)
  ]),
  Category('cat4', 0xFF00FFEA, cold_drinks, [
    SubCategory('dd', cold_drinks),
    SubCategory('dd2', cold_drinks),
    SubCategory('dd3', cold_drinks)
  ]),
  Category('cat5', 0xFFFFF200, cold_drinks, [
    SubCategory('ee', cold_drinks),
    SubCategory('ee2', cold_drinks),
    SubCategory('ee3', cold_drinks),
    SubCategory('ee3', cold_drinks)
  ]),
  Category('cat5', 0xFFFFF200, cold_drinks, [
    SubCategory('ee', cold_drinks),
    SubCategory('ee2', cold_drinks),
    SubCategory('ee3', cold_drinks),
    SubCategory('ee3', cold_drinks)
  ]),
  Category('cat5', 0xFFFFF200, cold_drinks, [
    SubCategory('ee', cold_drinks),
    SubCategory('ee2', cold_drinks),
    SubCategory('ee3', cold_drinks),
    SubCategory('ee3', cold_drinks)
  ]),
  Category('cat5', 0xFFFFF200, cold_drinks, [
    SubCategory('ee', cold_drinks),
    SubCategory('ee2', cold_drinks),
    SubCategory('ee3', cold_drinks),
    SubCategory('ee3', cold_drinks)
  ]),
  Category('cat5', 0xFFFFF200, cold_drinks, [
    SubCategory('ee', cold_drinks),
    SubCategory('ee2', cold_drinks),
    SubCategory('ee3', cold_drinks),
    SubCategory('ee3', cold_drinks)
  ]),
  Category('cat5', 0xFFFFF200, cold_drinks, [
    SubCategory('ee', cold_drinks),
    SubCategory('ee2', cold_drinks),
    SubCategory('ee3', cold_drinks),
    SubCategory('ee3', cold_drinks)
  ]),
  Category('cat6', 0xEDD900FF, cold_drinks, [
    SubCategory('ff', cold_drinks),
    SubCategory('ff2', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff', cold_drinks),
    SubCategory('ff2', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff', cold_drinks),
    SubCategory('ff2', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff', cold_drinks),
    SubCategory('ff2', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff', cold_drinks),
    SubCategory('ff2', cold_drinks),
    SubCategory('ff3', cold_drinks),
    SubCategory('ff3', cold_drinks)
  ])
];
