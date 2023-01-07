import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../data/faq_data.dart';
import '../../../provider/secure_storage_provider.dart';
import '../../../style/app_color.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColor.appPurple,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '건의 게시판',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('건의 내용을 선택해주세요', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}

class ForeGround extends StatelessWidget {
  const ForeGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: .9,
        children: List.generate(
          labelList.length,
          (index) => Consumer(
            builder: (context, ref, child) {
              final FlutterSecureStorage storage = ref.read(secureStorageProvider);
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final String? roleType = await storage.read(key: 'roleType');

                    if (roleType == 'admin' || roleType == 'ADMIN') {
                      context.push('/admin-faq');
                      return;
                    }
                    context.push('/faq/${labelList[index].path}');
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconList[index],
                        Text(labelList[index].label),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
