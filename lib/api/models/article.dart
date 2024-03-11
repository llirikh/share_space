import 'package:timeago/timeago.dart' as timeago;

class Article {
  int id;
  String title;
  String url;
  String imageUrl;
  String newsSite;
  String content;
  String publishedData;

  Article({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.content,
    required this.publishedData
  }) {
    timeago.setLocaleMessages('en', CustomMessages());
  }

  String getTimeAgo() {
    String timeagoString = timeago.format(
      DateTime.parse(publishedData),
      locale: 'en');
    return "${timeagoString[0].toUpperCase()}${timeagoString.substring(1).toLowerCase()}";
  }

}

class CustomMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'ago';
  @override
  String suffixFromNow() => 'from now';
  @override
  String lessThanOneMinute(int seconds) => 'a moment';
  @override
  String aboutAMinute(int minutes) => 'a minute';
  @override
  String minutes(int minutes) => '$minutes minutes';
  @override
  String aboutAnHour(int minutes) => 'an hour';
  @override
  String hours(int hours) => '$hours hours';
  @override
  String aDay(int hours) => 'a day';
  @override
  String days(int days) => '$days days';
  @override
  String aboutAMonth(int days) => 'a month';
  @override
  String months(int months) => '$months months';
  @override
  String aboutAYear(int year) => 'a year';
  @override
  String years(int years) => '$years years';
  @override
  String wordSeparator() => ' ';
}