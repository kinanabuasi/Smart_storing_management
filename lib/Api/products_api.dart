import 'dart:core';
import 'package:eleven/Api/product_api.dart';
import 'package:flutter/material.dart';
import 'api.dart';


class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {

  List<Product> products = <Product>[];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Api.getAllProduct().then((serverProducts) {
      //products = serverProducts;
      setState((){
        loading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: loading
              ?Center(
                child: CircularProgressIndicator(),
              )
              :GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              itemCount: products.length,
              itemBuilder: (context,index){
                return Container(
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.network(
                              products[index].imagePath)),
                      Expanded(flex: 2,child: Column(
                        children: [
                          Text(products[index].name),
                          Text("Price: "+products[index].purchasingPrice.toString()),
                        ],
                      ))
                      
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
