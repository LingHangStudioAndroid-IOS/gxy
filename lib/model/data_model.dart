// {
//     "code": 200,
//     "message": "成功",
//     "data": [
//         {
//             "title": "学校举办第十三届青年教师教学竞赛决赛",
//             "content": "武科大网讯（记者周嘉豪）为鼓励青年教师积极投身教学工作，引导青年教师加强课堂教学能力训练，6月25日，我校在青山校区主楼举行了第十三届青年教师教学比赛决赛。校党委常委吕勇及本科生院执行院长丁宇出席此次开幕式，教师教学发展中心主任张志清主持开幕式。",
//             "time": "2022-06-27",
//             "media": "学校",
//             "hotData": 528
//         },
//         {
//             "title": "香涛学院揭牌仪式（图片新闻）",
//             "content": "6月16日中午，我校香涛学院揭牌仪式在教十一楼南门举行。校长倪红卫、党委常委吕勇、香涛学院院长陈涛以及创新创业学院院长程光文为香涛学院揭牌，校长倪红卫与香涛学院院长陈涛发表讲话。",
//             "time": "2022-06-25",
//             "media": "学校",
//             "hotData": 599
//         }
//     ]
// }
class DataModel {
  late int code;
  String? message;
  List<Data> list = [];

  DataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'] ?? "无";
    json['data'].forEach((value) {
      list.add(Data.fromJson(value));
    });
  }
}

//  {
//             "title": "学校举办第十三届青年教师教学竞赛决赛",
//             "content": "武科大网讯（记者周嘉豪）为鼓励青年教师积极投身教学工作，引导青年教师加强课堂教学能力训练，6月25日，我校在青山校区主楼举行了第十三届青年教师教学比赛决赛。校党委常委吕勇及本科生院执行院长丁宇出席此次开幕式，教师教学发展中心主任张志清主持开幕式。",
//             "time": "2022-06-27",
//             "media": "学校",
//             "hotData": 528
//         },
class Data {
  late String title;
  late String content;
  late String time;
  late String media;
  late int hotData;

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    time = json['time'];
    media = json['media'];
    hotData = json['hotData'];
  }
}
