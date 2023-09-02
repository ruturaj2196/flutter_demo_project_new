import 'package:flutter/material.dart';
import 'package:flutter_practice/grocery_store/model/cart_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Cart',
            style: GoogleFonts.notoSerif(color: Colors.black),
          ),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (ctx, index) {
                      return Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemFromCArt(index);
                            },
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              leading: Image.asset(value.cartItems[index][2],
                                  height: 35),
                              title: Text(
                                value.cartItems[index][0],
                                style: GoogleFonts.notoSerif(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: Text(
                                '\u{20B9} ${value.cartItems[index][1]}',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500]),
                              ),
                              trailing: Text(
                                'Delete <<<',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey[400]),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total price',
                                style: GoogleFonts.notoSerif(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                value.calculateTotal(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[300]),
                              onPressed: () {},
                              child: const Text('Place order'))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
