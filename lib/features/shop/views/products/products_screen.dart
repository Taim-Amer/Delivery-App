import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(),
      body: Center(
        child: Text("Hala"),
      ),
    );
  }
}
