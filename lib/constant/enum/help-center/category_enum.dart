enum ProblemCategory { payment, useage, etc, account }

extension ProblemCategoryExtension on ProblemCategory {
  String get enumToString {
    switch (this) {
      case ProblemCategory.payment:
        return 'payment';
      case ProblemCategory.useage:
        return 'useage';
      case ProblemCategory.etc:
        return 'etc';
      case ProblemCategory.account:
        return 'account';
    }
  }

  // convert string to enum
  static ProblemCategory stringToEnum(String value) {
    switch (value) {
      case 'payment':
        return ProblemCategory.payment;
      case 'useage':
        return ProblemCategory.useage;
      case 'etc':
        return ProblemCategory.etc;
      case 'account':
        return ProblemCategory.account;
      default:
        return ProblemCategory.etc;
    }
  }
}
