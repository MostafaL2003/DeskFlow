import 'package:cart_app/cubit/catalog_cubit.dart';
import 'package:cart_app/screens/home_screen.dart';
import 'package:cart_app/screens/order_histor_screen.dart';
import 'package:cart_app/widgets/category_rail.dart';
import 'package:cart_app/widgets/flash_sale_section.dart';
import 'package:cart_app/widgets/product_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderHistoryScreen(),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: const Icon(Icons.shop),
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text(
          "Catalog",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CatalogCubit, CatalogState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.only(bottom: 40, top: 20),
            children: [
              CategoryRail(
                selectedCategory: state.selectedCategory,
                onCategorySelected: (categoryName) {
                  context.read<CatalogCubit>().selectCategory(categoryName);
                },
              ),

              const SizedBox(height: 20),

              if (state.selectedCategory == "All") ...[
                ProductSection(
                  title: "Featured Setup",
                  products: state.products,
                ),
                const SizedBox(height: 30),
                ProductSection(
                  title: "Must-Have Accessories",
                  products: state.products.reversed.toList(),
                ),
                const SizedBox(height: 30),
                FlashSaleSection(
                  title: "Flash Deals 🔥",
                  products: state.products.take(3).toList(),
                ),
              ] else ...[
                ProductSection(
                  title: "Best in ${state.selectedCategory}",
                  products: state.products,
                ),

                const SizedBox(height: 30),

                ProductSection(
                  title: "New ${state.selectedCategory} Arrivals",

                  products: state.products.reversed.toList(),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
