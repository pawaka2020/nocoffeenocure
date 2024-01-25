import 'package:objectbox/objectbox.dart';

/*
Rewards list:
1 - Travel and Services
2D1L trip to Kota Kinabalu.
1-day Tour guide of Taman Negara.
Full body health screening at Hippocratus Pharmacy.
2 - Entertainment
Ticket for Michael Jackson 'This is It' concert.
1 Go-kart session at Pirate Nation.
1 Golden Ticket for Gamuda Land.
3 - Health & Beauty
Estee Lauder facial cleanser.
Garnier facemask.
*/

@Entity()
class RewardOB {
  @Id()
  int id = 0;

  String? image;
  String? name;
  String? category;
  int? cost;

}