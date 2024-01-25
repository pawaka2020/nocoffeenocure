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

import '../../models/reward.dart';

class RewardDummy {
  Future<List<RewardOB>> get() async {
    int delay = 0;

    //BannerNewsOB()..image = "assets/images/bannerimage1.png"..article = "article 1",

    await Future.delayed(Duration(seconds: delay));
    List<RewardOB> result = [
      
    ];
    return result;
  }
}