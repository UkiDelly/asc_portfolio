enum CafeNameType {
  seoul('서울특별시', '서울지점'),
  busan('부산광역시', '부산지점'),
  incheon('인천광역시', '인천지점'),
  daegue('대구광역시', '대전지점'),
  daejeon('대전광역시', '광주지점'),
  gwangju('광주광역시', '울산지점'),
  undefined('undefined', '');

  const CafeNameType(this.area, this.name);
  final String area;
  final String name;

  factory CafeNameType.getByCode(String name){
    return CafeNameType.values.firstWhere((value) => value.name == name,
        orElse: () => CafeNameType.undefined);
  }
}


