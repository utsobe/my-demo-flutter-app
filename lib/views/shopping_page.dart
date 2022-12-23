import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_demo_flutter_app/controllers/cart_controller.dart';
import 'package:my_demo_flutter_app/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                      '${controller.products[index].productDescription}'),
                                ],
                              ),
                              Text('\$${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24)),
                            ],
                          ),
                          MaterialButton(
                            onPressed: () {
                              cartController
                                  .addToCart(controller.products[index]);
                            },
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: Text('Add to Cart'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total amount: \$ ${controller.totalPrice}',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            );
          }),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
