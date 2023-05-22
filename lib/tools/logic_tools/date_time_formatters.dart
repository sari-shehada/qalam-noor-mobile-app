import 'package:intl/intl.dart' as intl;

String formatDate({DateTime? dateTime}) =>
    intl.DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now());
