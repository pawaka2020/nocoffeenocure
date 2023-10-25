import 'package:objectbox/objectbox.dart';

@Entity()
class NewsFull {
  @Id()
  int id = 0;

  String? name;
}

Future<NewsFull> getNewsFullDummy() async {
  int delay = 2;
  await Future.delayed(Duration(seconds: delay)); // Simulate a 2-second delay
  return NewsFull()..name = 'assets/images/news1.png';
}