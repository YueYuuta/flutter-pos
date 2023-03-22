import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:food_jc/models/DetailProductSelected.model.dart';
import 'package:food_jc/models/Product.model.dart';
import 'package:food_jc/services/product.service.dart';

class ProductProvider with ChangeNotifier {
  DetailProductSelected _detailProductSelected = DetailProductSelected(
      qtyTotal: 0,
      subTotal: 0.00,
      subTotal0: 0.00,
      subTotal12: 0.00,
      iva: 0.00,
      total: 0.00);
  bool _loadingMian = true;
  List<ProductModel> _products = [];
  final Map<String, ProductModel> _productsSelected = {};
  List<ProductModel> get productsSelected =>
      {..._productsSelected}.values.toList();

  DetailProductSelected get detailProductSelected => _detailProductSelected;
  int get totalItemBaged => _detailProductSelected.qtyTotal;

  List<ProductModel> get products => _products;
  bool get loadingMain => _loadingMian;

  Future<void> addProductSelected(
      {required int ID,
      required String ProductDescription,
      required double Price,
      required int Qty,
      required String Image,
      required bool Iva}) async {
    if (_productsSelected.containsKey(ID.toString())) {
      int qtyCustom = Qty;
      if (qtyCustom < 1) {
        qtyCustom = 1;
      }
      _productsSelected.update(
          ID.toString(),
          (value) => ProductModel(
              ID: ID,
              ProductDescription: ProductDescription,
              Price: Price + .0,
              Qty: qtyCustom,
              Image: Image,
              selected: true,
              Iva: Iva));
      _detailProductSelected = await detailProductSelectedCalculate();
      print(_detailProductSelected.total);
      notifyListeners();
    } else {
      _productsSelected.putIfAbsent(
          ID.toString(),
          () => ProductModel(
              ID: ID,
              ProductDescription: ProductDescription,
              Price: Price + .0,
              Qty: 1,
              Image: Image,
              selected: true,
              Iva: Iva));
      _detailProductSelected = await detailProductSelectedCalculate();
      print(_detailProductSelected.total);
      notifyListeners();
    }
  }

  Future<void> removeProductSelected({required int ID}) async {
    _productsSelected.remove(ID.toString());
    int indexProduct = _products.indexWhere((element) => element.ID == ID);
    _products[indexProduct] = ProductModel(
        ID: _products[indexProduct].ID,
        ProductDescription: _products[indexProduct].ProductDescription,
        Price: _products[indexProduct].Price,
        Qty: _products[indexProduct].Qty,
        Image: _products[indexProduct].Image,
        Iva: _products[indexProduct].Iva,
        selected: false);
    _detailProductSelected = await detailProductSelectedCalculate();
    notifyListeners();
  }

  Future<void> addProducts() async {
    if (_products.length == 0) {
      _loadingMian = true;
      Timer(Duration(seconds: 5), () async {
        _products = await ProductService().getItems();
        _loadingMian = false;
        notifyListeners();
      });
    }
  }

  Future<void> updateItemMain({
    required ProductModel items,
  }) async {
    //  _products.firstWhere((element) => element.ID == items.ID) = items;
    _products[_products.indexWhere((element) => element.ID == items.ID)] =
        items;
  }

  Future<DetailProductSelected> detailProductSelectedCalculate() async {
    double subTotal12 = 0;
    double subTotal0 = 0;
    double subTotal = 0;
    double total = 0;
    double iva = 0;
    int qtyTotal = 0;
    double totalPriceItem = 0;
    _productsSelected.forEach((key, productSelected) {
      print("llamado a la funcion de calcular valores");
      print(productSelected.Price);
      double priceItem = productSelected.Price;
      double ivaItem = productSelected.Price;
      qtyTotal = qtyTotal + productSelected.Qty;
      if (productSelected.Iva) {
        ivaItem = priceItem - (priceItem / 1.12);
        priceItem = priceItem / 1.12;
        totalPriceItem = priceItem * productSelected.Qty;
        subTotal12 = subTotal12 + totalPriceItem;
        iva = iva + (ivaItem * productSelected.Qty);
      } else {
        subTotal0 = subTotal0 + (priceItem * productSelected.Qty);
      }
    });
    subTotal = subTotal0 + subTotal12;
    total = subTotal + iva;

    return DetailProductSelected(
        qtyTotal: qtyTotal,
        subTotal: subTotal,
        subTotal0: subTotal0,
        subTotal12: subTotal12,
        iva: iva,
        total: total);
  }
}
