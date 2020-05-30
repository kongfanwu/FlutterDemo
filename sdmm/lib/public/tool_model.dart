/*item mdoel*/
class ItemModel {
  ItemModel({ this.id ,this.title, this.imageName });
  final String id;
  final String title;
  final String imageName;
}
/*标识二位数组位置*/
class IndexPath {
  IndexPath(this.section, this.row);
  int section;
  int row;
}