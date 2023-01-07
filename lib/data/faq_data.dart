import 'package:flutter/material.dart';

import '../model/faq_label.dart';

final List<FAQLabel> labelList = [
  const FAQLabel(label: '결제관련', path: 'payment'),
  const FAQLabel(label: '이용관련', path: 'useage'),
  const FAQLabel(label: '기타', path: 'etc'),
  const FAQLabel(label: '계정', path: 'account'),
];
final List<Icon> iconList = [
  const Icon(
    Icons.paypal,
    size: 120,
  ),
  const Icon(
    Icons.report,
    size: 120,
  ),
  const Icon(
    Icons.report,
    size: 120,
  ),
  const Icon(
    Icons.account_circle,
    size: 120,
  )
];
