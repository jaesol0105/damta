/// 학교명을 짧게 변환
String abbreviateSchoolName(String name) {
  if (name.endsWith('초등학교')) return name.substring(0, name.length - 3);
  if (name.endsWith('고등학교')) return name.substring(0, name.length - 3);
  if (name.endsWith('중학교')) return name.substring(0, name.length - 2);
  return name;
}
