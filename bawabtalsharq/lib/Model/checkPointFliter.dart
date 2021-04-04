class Filter {
  String name;
  bool isSelected = false;
  Filter(this.name, this.isSelected);
}

List<Filter> filterArray = [
  Filter('BML Express', false),
  Filter('Mylez Express', false),
  Filter('Bawbet Alsharq Express', false),
];

List<Filter> filterArray3 = [
  Filter('80% & Up', false),
  Filter('60% & Up', false),
  Filter('40% & Up', false),
  Filter('20% & Up', false),
];

List<Filter> filterArray4 = [
  Filter('Up to 50%', false),
  Filter('Up to 30%', false),
  Filter('Up to 70%', false),
  Filter('Up to 90%', false),
];
