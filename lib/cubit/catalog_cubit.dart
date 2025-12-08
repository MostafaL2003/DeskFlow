import 'package:cart_app/models/products.dart';
import 'package:cart_app/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogState {
  final List<Products> products;
  final bool isLoading;
  final String selectedCategory;

  CatalogState(
    this.products, {
    this.isLoading = false,
    this.selectedCategory = "All",
  });

  CatalogState copyWith({
    List<Products>? products,
    bool? isLoading,
    String? selectedCategory,
  }) {
    return CatalogState(
      products ?? this.products, 
      isLoading: isLoading ?? this.isLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class CatalogCubit extends Cubit<CatalogState> {
  final _api = ApiService();
  List<Products> _allProducts = [];

  CatalogCubit() : super(CatalogState([], isLoading: true)) {
    loadProducts();
  }

  void loadProducts() async {
    try {
      _allProducts = await _api.getProducts();
      emit(CatalogState(_allProducts, isLoading: false));
    } catch (e) {
      emit(CatalogState([], isLoading: true));
    }
  }

  
void selectCategory(String category) {

    emit(state.copyWith(
      selectedCategory: category,
      products: _allProducts, 
    ));
  }

  
}
