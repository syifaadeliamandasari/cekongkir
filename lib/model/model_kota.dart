class ModelKota {
  String? cityId;
  String? cityName;
  String? type;

  ModelKota({this.cityId, this.cityName, this.type});

  factory ModelKota.fromJson(Map<String, dynamic> json) {
    return ModelKota(
      cityId: json['city_id'] as String?,
      cityName: json['city_name'] as String?,
      type: json['type'] as String?,
    );
  }

  static List<ModelKota> fromJsonList(List jsonList) {
    return jsonList.map((item) => ModelKota.fromJson(item)).toList();
  }
}
