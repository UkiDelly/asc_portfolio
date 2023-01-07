import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_label.freezed.dart';

@freezed
class FAQLabel with _$FAQLabel {
  const FAQLabel._();
  const factory FAQLabel({
    required String label,
    required String path,
  }) = _FAQLabel;
}
