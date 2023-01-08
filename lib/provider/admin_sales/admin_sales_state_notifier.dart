import 'package:asc_portfolio/constant/sales/sale_enum.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/admin/product/admin_management_product_model.dart';
import '../../server/repository/product_repository.dart';

part 'admin_sales_state_notifier.g.dart';

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

@Riverpod(keepAlive: true)
class SalesNotifier extends _$SalesNotifier {
  late ProductRepository productRepository;

  @override
  SalesState build() {
    productRepository = ref.watch(productProvider);
    getSales(SalesRange.oneDay);
    return SalesState();
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
        "${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: range.enumToInt)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now())}";

    state = state.copyWith(
      productList: productList,
      totalSales: totalSales,
      selectedDate: selectedDate,
      salesRange: range,
    );
  }

  void getTodaySales() async {
    String date = DateTime.now().toString().substring(0, 23);
    final productList = await productRepository.getProductInfoForAdmin(date);

    int totalSales = 0;
    for (var item in productList) {
      totalSales += item.productPrice;
    }

    state = state.copyWith(
      todaySales: totalSales.toDouble(),
    );
  }

  void getSalesOfDate(DateTime date) {}
}
