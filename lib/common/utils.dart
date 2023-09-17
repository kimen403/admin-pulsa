import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

String formatDateTime(String inputDate) {
  // debugPrint('inputDate: $inputDate');
  try {
    DateTime utcDate = DateTime.parse(inputDate);
    DateTime localTime = utcDate.toLocal();
    DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm');
    String formattedDate = dateFormat.format(localTime);
    return formattedDate;
  } catch (e) {
    // Handle the exception by returning an appropriate value,
    // such as an error message or a default date/time.
    return 'Invalid Date';
  }
}
