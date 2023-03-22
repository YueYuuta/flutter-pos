class ProductModel {
  final int ID;
  final String ProductDescription;
  final double Price;
  final int Qty;
  final String Image;
  final bool? selected;
  final bool Iva;

  ProductModel(
      {required this.ID,
      required this.ProductDescription,
      required this.Price,
      required this.Qty,
      required this.Image,
      this.selected,
      required this.Iva});
}
