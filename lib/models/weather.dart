class Weather {
  String date;
  String day;
  String icon;
  String description;
  String status;
  String degree;
  String min;
  String max;
  String night;
  String humidity;

  Weather({this.date, this.day, this.icon, this.description, this.status,
    this.degree, this.min, this.max, this.night, this.humidity});

  Weather.init(this.date, this.day, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      date: json['date'] as String,
      day:  json['day'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      degree: json['degree'] as String,
      min: json['min'] as String,
      max: json['max'] as String,
      night: json['night'] as String,
      humidity: json['humidity'] as String,
    );
  }
}