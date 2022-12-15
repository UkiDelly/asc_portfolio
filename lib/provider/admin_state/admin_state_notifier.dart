import 'package:asc_portfolio/controller/admin_controller.dart';
import 'package:asc_portfolio/repository/product_repository.dart';
import 'package:asc_portfolio/repository/seat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final adminStateProvider = StateNotifierProvider<AdminStateNotifier, AdminController>((ref) {
  final seatRepository = ref.watch(seatRepoProvider);
  final productRepository = ref.watch(productProvider);
  return AdminStateNotifier(seatRepoProvider: seatRepository, productProvider: productRepository);
});

class AdminStateNotifier extends StateNotifier<AdminController> {
  final SeatRepository seatRepoProvider;
  final ProductRepository productProvider;
  AdminStateNotifier({required this.seatRepoProvider, required this.productProvider})
      : super(const AdminController()) {
    roomFetchGet();
  }

  double progress = 0;

  String selectedDate =
      "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";

  void fetchApi(String day) async {
    final productList = await productProvider.getProductInfoForAdmin(day);
    state = state.copyWith(productList: productList);
  }

  Future<int> fechOnlyOneDay(String dailySales) async {
    final oneDayProductList = await productProvider.getProductInfoForAdmin(dailySales);
    state = state.copyWith(oneDayProductList: oneDayProductList);
    int price = 0;

    for (var item in oneDayProductList) {
      price += item.productPrice;
    }

    return price;
  }

  void roomFetchGet() async {
    final roomDatas = await seatRepoProvider.getAllRoomStateReq();
    state = state.copyWith(seatDatas: roomDatas);
  }

  void fetchAdminCancelSeat(int seatNumber) async {
    await seatRepoProvider.postAdminExitSeat(seatNumber);
  }

  bool getRoomState(int index) {
    final getState = state.seatDatas[index].toJson();
    if (getState.values.toString() == '(RESERVED)') {
      print('seat:${getState.values}');
      return true;
    } else {
      print('seat:${getState.values}');
      return false;
    }
  }

  void dailySales(String day) {
    fetchApi(day);
    state = state.copyWith(
      oneHasPressed: true,
      weekHasPressed: false,
      monthHasPressed: false,
      selectHasPressed: false,
    );
    selectedDate =
        "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -24)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
  }

  void weeklySales(String day) {
    fetchApi(day);
    state = state.copyWith(
      oneHasPressed: false,
      weekHasPressed: true,
      monthHasPressed: false,
      selectHasPressed: false,
    );
    selectedDate =
        "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: -168)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";
  }

  void monthSales(String day) {
    fetchApi(day);
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
}
