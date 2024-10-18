class Appexception implements Exception {
  final message;
  final prefix;
  Appexception(this.message, this.prefix);
  @override
  String toString() {
    return '$prefix $message';
  }
}

class InternetExceptation extends Appexception {
  InternetExceptation([String? message])
      : super(message, 'Internet Not Available');
}

class FetchdataExceptation extends Appexception {
  FetchdataExceptation([String? message])
      : super(message, 'Error accour During Fetch data');
}
class InvalidUserExceptation extends Appexception {
  InvalidUserExceptation([String? message])
      : super(message, 'Invalid User ');
}
class UrlExceptation extends Appexception {
  UrlExceptation([String? message])
      : super(message, 'Invalid Url');
}

