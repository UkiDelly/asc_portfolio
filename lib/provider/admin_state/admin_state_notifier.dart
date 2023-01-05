import 'package:asc_portfolio/constant/sales/sale_enum.dart';
import 'package:asc_portfolio/controller/admin_controller.dart';
import 'package:asc_portfolio/server/repository/product_repository.dart';
import 'package:asc_portfolio/server/repository/seat_repository.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_state_notifier.g.dart';

@riverpod
class AdminStateNotifier extends _$AdminStateNotifier {
  late final SeatRepository seatRepository;
  late final ProductRepository productRepository;

  double progress = 0;
  int totalSales = 0;
  List seatList = [];
  String selectedDate =
      "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";

  @override
  AdminController build() {
    seatRepository = ref.watch(seatRepoProvider);
    productRepository = ref.watch(productProvider);
    roomFetchGet();
    fetchApi(SalesRange.oneDay);
    return const AdminController();
  }

  void fetchApi(SalesRange range) async {
    String date = DateTime.now().subtract(Duration(days: range.enumToInt)).toString();

    final productList = await productRepository.getProductInfoForAdmin(date);
    state = state.copyWith(productList: productList);
  }

  void roomFetchGet() async {
    final roomDatas = await seatRepository.getAllRoomStateReq();
    state = state.copyWith(seatDatas: roomDatas);
  }

  Future<void> fechOnlyOneDay(SalesRange range) async {
    String dailySales = DateTime.now().subtract(Duration(days: range.enumToInt)).toUtc().toString();
    final oneDayProductList = await productRepository.getProductInfoForAdmin(dailySales);
    state = state.copyWith(oneDayProductList: oneDayProductList);
    int price = 0;

    for (var item in oneDayProductList) {
      price += item.productPrice;
    }

    totalSales = price;
  }

  void fetchAdminCancelSeat(int seatNumber) async {
    await seatRepository.postAdminExitSeat(seatNumber);
  }

  bool getRoomState(int index) {
    final getState = state.seatDatas[index].toJson();
    if (getState.values.toString() == '(RESERVED)') {
      return true;
    } else {
      return false;
    }
  }

  void dailySales(SalesRange range) {
    fetchApi(range);
    state = state.copyWith(
      oneHasPressed: true,
      weekHasPressed: false,
      monthHasPressed: false,
      selectHasPressed: false,
    );
    selectedDate =
        "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -24)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
  }

  void weeklySales(SalesRange range) {
    fetchApi(range);
    state = state.copyWith(
      oneHasPressed: false,
      weekHasPressed: true,
      monthHasPressed: false,
      selectHasPressed: false,
    );
    selectedDate =
        "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -168)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
  }

  void monthSales(SalesRange range) {
    fetchApi(range);
    state = state.copyWith(
      oneHasPressed: false,
      weekHasPressed: false,
      monthHasPressed: true,
      selectHasPressed: false,
    );
    selectedDate =
        "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -720)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
  }

  void select4() {
    state = state.copyWith(
      oneHasPressed: false,
      weekHasPressed: false,
      monthHasPressed: false,
      selectHasPressed: true,
    );
  }

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void setSeatList(AdminController adminController) {
    for (int i = 0; i < adminController.seatDatas.length; i++) {
      seatList.add(adminController.seatDatas[i].toJson());
    }
  }

  void setTotalSales(AdminController adminController) {
    int price = 0;
    for (int i = 0; i < adminController.productList.length; i++) {
      price += adminController.productList[i].productPrice;
    }
    totalSales = price;
  }
}

// final adminStateProvider = StateNotifierProvider<AdminStateNotifier, AdminController>((ref) {
//   final seatRepository = ref.watch(seatRepoProvider);
//   final productRepository = ref.watch(productProvider);
//   return AdminStateNotifier(seatRepoProvider: seatRepository, productProvider: productRepository);
// });

// class AdminStateNotifier extends StateNotifier<AdminController> {
//   final SeatRepository seatRepoProvider;
//   final ProductRepository productProvider;
//   AdminStateNotifier({required this.seatRepoProvider, required this.productProvider})
//       : super(const AdminController()) {
//     roomFetchGet();
//     fetchApi(SalesRange.oneDay);
//     fechOnlyOneDay(SalesRange.oneDay);
//   }

//   double progress = 0;
//   int totalSales = 0;
//   List seatList = [];

//   String selectedDate =
//       "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";

//   void fetchApi(SalesRange range) async {
//     String date = DateTime.now().subtract(Duration(days: range.enumToInt)).toString();

//     final productList = await productProvider.getProductInfoForAdmin(date);
//     state = state.copyWith(productList: productList);
//   }

//   Future<void> fechOnlyOneDay(SalesRange range) async {
//     String dailySales = DateTime.now().subtract(Duration(days: range.enumToInt)).toUtc().toString();
//     final oneDayProductList = await productProvider.getProductInfoForAdmin(dailySales);
//     state = state.copyWith(oneDayProductList: oneDayProductList);
//     int price = 0;

//     for (var item in oneDayProductList) {
//       price += item.productPrice;
//     }

//     totalSales = price;
//   }

//   void roomFetchGet() async {
//     final roomDatas = await seatRepoProvider.getAllRoomStateReq();
//     state = state.copyWith(seatDatas: roomDatas);
//   }

//   void fetchAdminCancelSeat(int seatNumber) async {
//     await seatRepoProvider.postAdminExitSeat(seatNumber);
//   }

//   bool getRoomState(int index) {
//     final getState = state.seatDatas[index].toJson();
//     if (getState.values.toString() == '(RESERVED)') {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   void dailySales(SalesRange range) {
//     fetchApi(range);
//     state = state.copyWith(
//       oneHasPressed: true,
//       weekHasPressed: false,
//       monthHasPressed: false,
//       selectHasPressed: false,
//     );
//     selectedDate =
//         "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -24)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
//   }

//   void weeklySales(SalesRange range) {
//     fetchApi(range);
//     state = state.copyWith(
//       oneHasPressed: false,
//       weekHasPressed: true,
//       monthHasPressed: false,
//       selectHasPressed: false,
//     );
//     selectedDate =
//         "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -168)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
//   }

//   void monthSales(SalesRange range) {
//     fetchApi(range);
//     state = state.copyWith(
//       oneHasPressed: false,
//       weekHasPressed: false,
//       monthHasPressed: true,
//       selectHasPressed: false,
//     );
//     selectedDate =
//         "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -720)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
//   }

//   void select4() {
//     state = state.copyWith(
//       oneHasPressed: false,
//       weekHasPressed: false,
//       monthHasPressed: false,
//       selectHasPressed: true,
//     );
//   }

//   void setSelectedIndex(int index) {
//     state = state.copyWith(selectedIndex: index);
//   }

//   void setSeatList(AdminController adminController) {
//     for (int i = 0; i < adminController.seatDatas.length; i++) {
//       seatList.add(adminController.seatDatas[i].toJson());
//     }
//   }

//   void setTotalSales(AdminController adminController) {
//     int price = 0;
//     for (int i = 0; i < adminController.productList.length; i++) {
//       price += adminController.productList[i].productPrice;
//     }
//     totalSales = price;
//   }
// }
