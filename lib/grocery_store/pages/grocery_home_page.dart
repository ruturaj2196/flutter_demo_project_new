import 'package:flutter/material.dart';
import 'package:flutter_practice/grocery_store/components/grocery_item_tile.dart';
import 'package:flutter_practice/grocery_store/model/cart_model.dart';
import 'package:flutter_practice/grocery_store/pages/cart_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_bag),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => const CartPage()),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text('Hello there..'),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Let\'s order fersh items for you',
                style: GoogleFonts.notoSerif(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Fresh items',
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                        itemCount: value.shopItems.length,
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.3,
                        ),
                        itemBuilder: (ctx, index) {
                          return GroceryItemTile(
                            itemName: value.shopItems[index][0],
                            itemPrice: value.shopItems[index][1],
                            imagePath: value.shopItems[index][2],
                            color: value.shopItems[index][3],
                            onPressed: () {
                              Provider.of<CartModel>(
                                context,
                                listen: false,
                              ).addItemToCart(index);
                            },
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
