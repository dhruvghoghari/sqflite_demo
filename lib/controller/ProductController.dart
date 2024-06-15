import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController qty = TextEditingController();

  final formKey = GlobalKey<FormState>();


}