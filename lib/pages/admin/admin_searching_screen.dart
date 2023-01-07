import 'dart:async';

import 'package:asc_portfolio/controller/admin/admin_search_page_controller.dart';
import 'package:asc_portfolio/server/repository/product_repository.dart';
import 'package:asc_portfolio/server/repository/ticket_repository.dart';
import 'package:asc_portfolio/server/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

import '../../common/base_scaffold.dart';
import '../../style/app_color.dart';
import 'admin_main_screen.dart';

class AdminSearchingPage extends ConsumerStatefulWidget {
  final String loginId;
  const AdminSearchingPage(this.loginId, {super.key});

  @override
  ConsumerState<AdminSearchingPage> createState() => _AdminSearchingPageState();
}

class _AdminSearchingPageState extends ConsumerState<AdminSearchingPage> {
  final String _selectedDate =
      "${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(hours: 9)))}";

  late String loginId = widget.loginId;

  bool isNotCompleteLoading = true;
  double _progress = 0;
  // steps
  int currentStep = 0;
  bool complete = false;
  int length = 1;
  int selectedSeatNumber = 0;

  final AdminSearchPageController _adminSearchPageController = AdminSearchPageController();

  static const storage = FlutterSecureStorage();

  final FocusNode productFocus = FocusNode();
  final FocusNode priceFocus = FocusNode();
  final FocusNode purchasedAt = FocusNode();
  final FocusNode warrantyFocus = FocusNode();
  final FocusNode purchasedAtFocus = FocusNode();
  final FocusNode companyFocus = FocusNode();
  final FocusNode salesPersonFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode notesFocus = FocusNode();

  next() {
    currentStep + 1 != 3 ? goTo(currentStep + 1) : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  void startTimer() {
    Timer.periodic(
      const Duration(milliseconds: 200),
      (Timer timer) => setState(
        () {
          if (_progress == 0.2) {
            setState(() {
              isNotCompleteLoading = false;
            });
            timer.cancel();
          } else {
            _progress += 0.2;
          }
        },
      ),
    );
  }

  _fetchUserInfo() async {
    final userData = await ref.read(userRepoProvider).getAdminCheckUserInfo(loginId);
    setState(() {
      _adminSearchPageController.loginId = userData.loginId;
      _adminSearchPageController.name = userData.name;
      _adminSearchPageController.createDate = userData.createDate;
      _adminSearchPageController.email = userData.email;
    });
    print(_adminSearchPageController.createDate);
  }

  _fetchProductList() async {
    final productDatas = await ref.read(productProvider).getAdminCheckUserProduct(loginId);
    setState(() {
      _adminSearchPageController.userProductList = productDatas;
      length = _adminSearchPageController.userProductList.length;
    });
    print('list=${_adminSearchPageController.userProductList}');
  }

  _fetchUserValidTicket() async {
    final validTicketInfo =
        await ref.read(ticketRepoProvider).getAdminCheckUserValidTicket(loginId);
    setState(() {
      _adminSearchPageController.adminCheckUserValidTicket = validTicketInfo;
    });
    print('validTicket=${_adminSearchPageController.adminCheckUserValidTicket}');
  }

  @override
  void didChangeDependencies() {
    _fetchUserInfo();
    _fetchUserValidTicket();
    _fetchProductList();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return BaseScaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const AdminMainPage()),
      //       );
      //     },
      //   ),
      //   backgroundColor: AppColor.appPurple,
      //   title: const Text('유저 조회 및 환불처리'),
      //   centerTitle: true,
      //   shadowColor: Colors.white,
      //   elevation: 1,
      // ),
      // appBarTitle: const Text('유저 조회 및 환불처리'),
      body: isNotCompleteLoading
          ? Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                    value: _progress,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: AppColor.appPurple,
                    strokeWidth: 10.0,
                  ),
                ),
              ),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: FormBuilder(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(primary: AppColor.appPurple),
                      ),
                      child: Stepper(
                        controlsBuilder: (BuildContext context, ControlsDetails details) {
                          return const Text('');
                        },
                        type: StepperType.horizontal,
                        currentStep: currentStep,
                        onStepTapped: (step) => goTo(step),
                        steps: [
                          Step(
                            isActive: currentStep == 0 ? true : false,
                            title: const Text('유저정보'),
                            content: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.account_circle,
                                    color: AppColor.appPurple,
                                  ),
                                  title: Text(_adminSearchPageController.loginId),
                                  onTap: () {},
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.email,
                                    color: AppColor.appPurple,
                                  ),
                                  title: Text(_adminSearchPageController.email),
                                  onTap: () {},
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.access_time_filled,
                                    color: AppColor.appPurple,
                                  ),
                                  title: Text(
                                    '가입일: ${_adminSearchPageController.createDate.replaceAll("T", ' ').substring(0, 16)}',
                                  ),
                                  onTap: () {},
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Step(
                            isActive: currentStep == 1 ? true : false,
                            title: const Text('결제내역'),
                            content: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: 400,
                                  height: 500,
                                  child: ListView.builder(
                                    itemCount: length,
                                    itemBuilder: (BuildContext context, int idx) {
                                      return Card(
                                        elevation: 5,
                                        shadowColor: AppColor.appPurple,
                                        surfaceTintColor: AppColor.appPurple,
                                        margin: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.paypal,
                                            size: 40,
                                            color: Colors.black,
                                          ),
                                          title: Text(
                                            _adminSearchPageController
                                                .userProductList[idx].productNameTypeString,
                                          ),
                                          subtitle: Text(
                                              '금액: ${_adminSearchPageController.userProductList[idx].productPrice},'
                                              ' 일시 : ${_adminSearchPageController.userProductList[idx].createDate.replaceAll("T", " ").substring(0, 19)},'
                                              ' id: ${_adminSearchPageController.loginId}, '
                                              '상태: ${_adminSearchPageController.userProductList[idx].productState}'),
                                          onTap: () {},
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Step(
                            isActive: currentStep == 2 ? true : false,
                            title: const Text('환불처리'),
                            content: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.credit_card_outlined,
                                    color: AppColor.appPurple,
                                  ),
                                  title: const Text('사용중인 이용권'),
                                  onTap: () {},
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 400,
                                  height: 120,
                                  child: ListView.builder(
                                    itemCount: _adminSearchPageController
                                                .adminCheckUserValidTicket?.isValidTicket ==
                                            'VALID'
                                        ? 1
                                        : 0,
                                    itemBuilder: (BuildContext context, int idx) {
                                      return Card(
                                        elevation: 5,
                                        shadowColor: AppColor.appPurple,
                                        surfaceTintColor: AppColor.appPurple,
                                        margin: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.paypal,
                                            size: 40,
                                            color: Colors.black,
                                          ),
                                          title: Text(
                                            '${_adminSearchPageController.adminCheckUserValidTicket?.productNameType}',
                                          ),
                                          subtitle: Text(
                                              '금액: ${_adminSearchPageController.adminCheckUserValidTicket?.ticketPrice},'
                                              ' 일시 : ${_adminSearchPageController.adminCheckUserValidTicket?.createDate.replaceAll("T", " ").substring(0, 16)},'
                                              ' id: ${_adminSearchPageController.loginId}, '),
                                          onTap: () {},
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                _adminSearchPageController
                                            .adminCheckUserValidTicket?.isValidTicket ==
                                        'INVALID'
                                    ? const Text('')
                                    : FloatingActionButton.extended(
                                        backgroundColor: AppColor.appPurple,
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                _buildPopupDialog(context),
                                          );
                                        },
                                        tooltip: 'cancel',
                                        label: const Text(
                                          '이용권 환불처리',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[],
                ),
              ],
            ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '이용권을 환불시킵니다.',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                '주의! 사용중인 이용권이 사라집니다.',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            print(_adminSearchPageController.adminCheckUserValidTicket!.productLabel);
            String responseData = await ref.read(productProvider).postCancelProduct(
                  _adminSearchPageController.adminCheckUserValidTicket!.productLabel,
                );
            print(responseData);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdminMainPage()),
            );
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialogChange(context),
            );
          },
          child: const Text(
            '확인',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text(
            '취소',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildPopupDialogChange(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '환불되었습니다.',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '환불시킨 이용권번호: ${_adminSearchPageController.adminCheckUserValidTicket!.productLabel}',
                style:
                    const TextStyle(fontWeight: FontWeight.w200, fontSize: 13, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
