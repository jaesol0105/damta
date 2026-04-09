class SchoolDto {
  final String schoolName;
  final String schoolCode;
  final String officeCode;
  final String location;

  SchoolDto({
    required this.schoolName,
    required this.schoolCode,
    required this.officeCode,
    required this.location,
  });

  factory SchoolDto.fromJson(Map<String, dynamic> json) {
    return SchoolDto(
      schoolName: json["SCHUL_NM"] as String,
      schoolCode: json["SD_SCHUL_CODE"] as String,
      officeCode: json["ATPT_OFCDC_SC_CODE"] as String,
      location: json["ORG_RDNMA"] as String,
    );
  }

  @override
  String toString() {
    return "$schoolName($location)";
  }
}
