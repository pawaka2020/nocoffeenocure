import '../../models/fullnews.dart';

class FullNewsDummy {
  Future<List<FullNewsOB>> get() async {
    int delay = 0;
    await Future.delayed(Duration(seconds: delay));

    List<FullNewsOB> result = [
      FullNewsOB()..name = 'assets/images/news1.png'
    ];
    return result;
  }
}