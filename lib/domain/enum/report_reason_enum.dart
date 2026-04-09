enum ReportReason {
  spam('스팸/광고'),
  obscene('음란물'),
  harassment('욕설/비방'),
  falseInfo('허위정보'),
  other('기타');

  const ReportReason(this.label);
  final String label;
}
