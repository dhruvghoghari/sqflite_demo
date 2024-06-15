import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_demo/controller/ProductController.dart';
import 'package:sqflite_demo/customs/Widgets.dart';
import 'package:sqflite_demo/resources/DataBaseHelper.dart';
import 'package:sqflite_demo/views/ViewProduct.dart';
import '../utils/Strings.dart';

class EditProduct extends StatefulWidget {
  var updateId="";
  EditProduct({required this.updateId});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  ProductController productCon = Get.put(ProductController());
  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _qty = TextEditingController();

  getData() async
  {
    DataBaseHelper obj = DataBaseHelper();
   var data = await obj.getSingleProduct(widget.updateId);
   setState(() {
     _name.text = data[0]['productname'].toString();
     _price.text = data[0]['price'].toString();
     _qty.text = data[0]['qty'].toString();
   });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit'),),
      body: Form(
        key:productCon.formKey,
        child: Column(
          children: [
            CustomTextFormField(
                controller: _name,
                keyboardType: TextInputType.text,
                hintText: nameField,
                obscureText: false
            ),
            SizedBox(height: 10),
            CustomTextFormField(
                controller: _price,
                keyboardType: TextInputType.number,
                hintText: priceField,
                obscureText: false
            ),
            SizedBox(height: 10),
            CustomTextFormField(
                controller: _qty,
                keyboardType: TextInputType.text,
                hintText: qtyField,
                obscureText: false
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () async{
              var name = _name.text.toString();
              var price =_price.text.toString();
              var qty = _qty.text.toString();

              DataBaseHelper obj = DataBaseHelper();
              var status = await obj.updateProdcut(name,price,qty,widget.updateId);
              if(status==1){
                Get.back();
                Get.back();
                Get.to(() => ViewProduct());
              }
              else
                {
                  print("not Update");
                }
            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}