import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_demo/resources/DataBaseHelper.dart';
import 'package:sqflite_demo/views/EditProduct.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  Future<List>? allProducts;

   Future<List> viewData() async {
    DataBaseHelper obj = DataBaseHelper();
    var data = await obj.getAllProduct();
    return data;
  }


  @override
  void initState() {
    super.initState();
    setState(() {
      allProducts = viewData();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ViewProducts"),),
      body:FutureBuilder(
        future: allProducts,
        builder: (context,snapshot){
          if(snapshot.hasData)
          {
            if(snapshot.data!.length<=0)
            {
              return Center(child: Text('no Data'),);
            }
            else
              {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder:(context,index){
                    return ListTile(
                      title: Text(snapshot.data![index]['productname'].toString()),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snapshot.data![index]['qty'].toString()),
                          Text("Rs."+snapshot.data![index]['price'].toString()),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          IconButton(
                            icon: Icon(Icons.edit,color: Colors.green,),
                            onPressed: () {

                              var id = snapshot.data![index]['productid'].toString();
                              Get.to(() => EditProduct(updateId: id,));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,color: Colors.red),
                            onPressed: ()  async{
                              var id = snapshot.data![index]['productid'].toString();

                              DataBaseHelper obj = DataBaseHelper();
                             var status = await obj.deleteProduct(id);
                             if(status==1){
                               setState(() {
                                 allProducts = viewData();
                               });
                             }
                             else{
                               print("Not deleted");
                             }
                            },
                          ),
                        ],
                      ),
                    );
                  }
                );
              }
          }
          else{
            return Center(
              child: Text("Loading..."),
            );
          }
        }
      )
    );
  }
}