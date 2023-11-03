import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pgn_mobile/core/core.dart';
import 'package:pgn_mobile/core/utils/extensions/widget_util.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Loadable(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BaseColor.primaryColor,
        title: Text18WhitekBold("Cart"),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: LeftAlignedColumn(
            children: [Center(child: Text("Cart"))],
          ),
        ),
      ),
    );
  }
}
