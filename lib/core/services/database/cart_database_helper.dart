import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final cartDbHelper = CartDatabaseHelper._();
  static Database? _database;
  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  _initiateDatabase() async {
    final path = join(await getDatabasesPath(), 'cartData.db');
    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $kCartTable(
      $kColumnName TEXT NOT NULL,
      $kColumnImage TEXT NOT NULL,
      $kColumnPrice TEXT NOT NULL,
      $kColumnQuantity INTEGER NOT NULL,
      $kColumnProductId TEXT NOT NULL)
       ''');
    });
  }

  insert(CartProduct cartProduct) async {
    var dbCart = await database;
    await dbCart.insert(
      kCartTable,
      cartProduct.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartProduct>> getAllCartProducts() async {
    var dbCart = await database;
    List<Map> productsMap = await dbCart.query(kCartTable);
    List<CartProduct> products = productsMap.isNotEmpty
        ? productsMap.map((product) => CartProduct.fromJson(product)).toList()
        : [];
    return products;
  }

  updateCartProducts(CartProduct cartProduct) async {
    var dbCart = await database;
    await dbCart.update(kCartTable, cartProduct.toJson(),
        where: '$kColumnProductId = ?', whereArgs: [cartProduct.productId]);
  }
}
