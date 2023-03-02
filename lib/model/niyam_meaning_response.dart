class NiyamMeaningResponse {
  NiyamMeaningResponse({
    required this.meaning,
    required this.mahima,
    required this.history,
  });

  String meaning;
  String mahima;
  String history;

  factory NiyamMeaningResponse.fromJson(Map<String, dynamic> json) => NiyamMeaningResponse(
    meaning: json["meaning"],
    mahima: json["mahima"],
    history: json["history"],
  );

  Map<String, dynamic> toJson() => {
    "meaning": meaning,
    "mahima": mahima,
    "history": history,
  };
}