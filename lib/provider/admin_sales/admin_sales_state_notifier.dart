import 'package:asc_portfolio/constant/sales/sale_enum.dart';
import 'package:asc_portfolio/server/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../model/admin/admin_management_product_model.dart';

abstract class BaseSalesState {}

class SaleLoading extends BaseSalesState {}

class SalesState extends BaseSalesState {
  final int totalSales;
  final String selectedDate;
  final List<AdminManagementProductModel> productList;
  final SalesRange salesRange;
  SalesState({
    required this.totalSales,
    required this.selectedDate,
    required this.productList,
    required this.salesRange,
  });
}

final salesProvider = StateNotifierProvider<SalesNotifier, BaseSalesState>((ref) {
  final ProductRepository productRepository = ref.watch(productProvider);
  return SalesNotifier(productRepository);
});

class SalesNotifier extends StateNotifier<BaseSalesState> {
  final ProductRepository productRepository;
  SalesNotifier(this.productRepository) : super(SaleLoading()) {
    getSales(SalesRange.oneDay);
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
    state = SalesState(
      productList: productList,
      totalSales: totalSales,
      selectedDate: selectedDate,
      salesRange: range,
    );

    print((state as SalesState).salesRange);
  }

  void getSalesOfDate(DateTime date) {}
}
