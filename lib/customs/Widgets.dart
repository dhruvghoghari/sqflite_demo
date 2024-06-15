import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_demo/controller/ProductController.dart';
import 'package:sqflite_demo/views/ViewProduct.dart';
import '../utils/Colors.dart';
import '../views/AddProduct.dart';

ProductController productController = Get.put(ProductController());
/* custom Drawer */
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Add Prodct"),
            onTap: (){
              Get.to(() => AddProduct());
            },
          ),
          ListTile(
            title: Text("View Prodct"),
            onTap: (){
              Get.to(() => ViewProduct());
            },
          ),
        ],
      ),
    );
  }
}

/* TextFormFiled */
class CustomTextFormField extends StatelessWidget {

  final GestureTapCallback? onClick;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final IconData? iconData;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.onClick,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.iconData,
    required this.obscureText,
    this.validator,
    this.maxLength,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.8),
        child: GestureDetector(
          onTap: onClick ?? () {},
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.all(20.0),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gapPadding: 10,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gapPadding: 10,
                borderSide: BorderSide(color: borderColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                gapPadding: 10,
                borderSide: BorderSide(color: borderColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: appColor, width: 2),
              ),
              counterText: "",
            ),
            validator: validator,
            maxLength: maxLength,
          ),
        )
    );
  }
}