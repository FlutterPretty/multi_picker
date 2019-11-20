class PickerItem {
  String showTitle;
  List<PickerItem> childData = List();


  PickerItem(this.showTitle);

  @override
  String toString() {
    return showTitle;
  }
}
