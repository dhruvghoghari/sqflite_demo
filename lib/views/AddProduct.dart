import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_demo/controller/ProductController.dart';
import 'package:sqflite_demo/customs/Widgets.dart';
import 'package:sqflite_demo/resources/DataBaseHelper.dart';
import 'package:sqflite_demo/views/ViewProduct.dart';
import '../utils/Strings.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  @override
  Widget build(BuildContext context) {
    ProductController productCon = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(title: Text('Add'),),
      body: Form(
        key:productCon.formKey,
        child: Column(
          children: [
            CustomTextFormField(
                controller: productCon.name,
                keyboardType: TextInputType.text,
                hintText: nameField,
                obscureText: false
            ),
            SizedBox(height: 10),
            CustomTextFormField(
                controller: productCon.price,
                keyboardType: TextInputType.number,
                hintText: priceField,
                obscureText: false
            ),
            SizedBox(height: 10),
            CustomTextFormField(
                controller: productCon.qty,
                keyboardType: TextInputType.text,
                hintText: qtyField,
                obscureText: false
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              var name = productCon.name.text.toString();
              var price =productCon.price.text.toString();
              var qty = productCon.qty.text.toString();

              DataBaseHelper obj = DataBaseHelper();
              var id = obj.insertProduct(name,price,qty);
              Get.to(() => ViewProduct());

            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}