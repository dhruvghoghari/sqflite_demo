import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DataBaseHelper{

  Database? db;
  Future<Database>? create_db() async{
    if(db!=null){
      return db!;
    }
    else{
      var dir = await getApplicationDocumentsDirectory();
      var path = join(dir.path,'user');
      var db = openDatabase(path,version: 1,onCreate: create_table);
      return db;
    }
  }

  create_table(Database db,int version) async 
  {
    db.execute("create table product (productid integer primary key autoincrement,productname text,qty integer,price double)");
    log("Table created");
  }

  Future<int> insertProduct(name,qty,price) async
  {
    var db = await create_db();
    var id = await db!.rawInsert("insert into product (productname,qty,price) values (?,?,?)",[name,qty,price]);
    return id;
  }

  Future<List> getAllProduct() async
  {
    var db = await create_db();
    var data = await db!.rawQuery("select * from product");
    return data.toList();
  }

  Future<int> deleteProduct(id) async
  {
    var db = await create_db();
    var status = await db!.rawDelete("delete from product where productid=?",[id]);
    return status;
  }

  Future<List> getSingleProduct(id) async
  {
    var db = await create_db();
    var data = await db!.rawQuery("select * from product where productid=?",[id]);
    return data.toList();
  }

  Future<int> updateProdcut(name,price,qty,id) async
  {
    var db = await create_db();
    var status = await db!.rawUpdate("update product set productname=?,qty=?,price=? where productid=?",[name,price,qty,id]);
    return status;
  }


}