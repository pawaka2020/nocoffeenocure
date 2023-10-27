import 'package:objectbox/objectbox.dart';

@Entity()
class BannerNewsOB {
  @Id()
  int id = 0;

  String? image;
  String? article;
}