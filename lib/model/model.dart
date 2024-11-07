class TaskModel {
  String? alphaTwoCode;
  List<String>? domains;
  String? stateProvince;
  String? country;
  String? name;
  List<String>? webPages;

  TaskModel(
      {this.alphaTwoCode,
      this.domains,
      this.stateProvince,
      this.country,
      this.name,
      this.webPages});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      alphaTwoCode: json['alphaTwoCode'] as String?,
      domains: (json['domains'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      stateProvince: json['stateProvince'] as String?,
      country: json['country'] as String?,
      name: json['name'] as String?,
      webPages: (json['webPages'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }
}
