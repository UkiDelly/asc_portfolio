import 'package:asc_portfolio/constant/sales/sale_enum.dart';
import 'package:asc_portfolio/server/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/admin/admin_management_product_model.dart';

class SalesState {
  final int totalSales;
  final String selectedDate;
  final List<AdminManagementProductModel> productList;
  final SalesRange salesRange;
  final double todaySales;
  SalesState({
    this.totalSales = 0,
    this.selectedDate = '',
    this.productList = const [],
    this.salesRange = SalesRange.oneDay,
    this.todaySales = 0,
  });

  SalesState copyWith({
    int? totalSales,
    String? selectedDate,
    List<AdminManagementProductModel>? productList,
    SalesRange? salesRange,
    double? todaySales,
  }) {
    return SalesState(
      totalSales: totalSales ?? this.totalSales,
      selectedDate: selectedDate ?? this.selectedDate,
      productList: productList ?? this.productList,
      salesRange: salesRange ?? this.salesRange,
      todaySales: todaySales ?? this.todaySales,
    );
  }
}

final salesProvider = StateNotifierProvider<SalesNotifier, SalesState>((ref) {
  final ProductRepository productRepository = ref.watch(productProvider);
  return SalesNotifier(productRepository);
});

class SalesNotifier extends StateNotifier<SalesState> {
  final ProductRepository productRepository;
  SalesNotifier(this.productRepository) : super(SalesState()) {
    getSales(SalesRange.oneDay);
    getTodaySales();
  }

  void getSales(SalesRange range) async {
    String date =
        DateTime.now().subtract(Duration(days: range.enumToInt)).toString().substring(0, 23);
    final productList = await productRepository.getProductInfoForAdmin(date);

    int totalSales = 0;
    for (var item in productList) {
      totalSales += item.productPrice;
    }
    String selectedDate =
        "${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 1)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now())}";
    state = (state).copyWith(
      productList: productList,
      totalSales: totalSales,
      selectedDate: selectedDate,
      salesRange: range,
    );

    print((state).salesRange);
  }

  void getTodaySales() async {
    String date = DateTime.now().toString().substring(0, 23);
    final productList = await productRepository.getProductInfoForAdmin(date);

    int totalSales = 0;
    for (var item in productList) {
      totalSales += item.productPrice;
    }
    if (state is SalesState) {
      state = (state).copyWith(
        todaySales: totalSales.toDouble(),
      );
    } else {
      state = SalesState(
        productList: [],
        totalSales: 0,
        selectedDate: '',
        salesRange: SalesRange.oneDay,
        todaySales: totalSales.toDouble(),
      );
    }
    // state = (state as SalesState).copyWith(
    //   todaySales: totalSales.toDouble(),
    // );
  }

  void getSalesOfDate(DateTime date) {}
}
