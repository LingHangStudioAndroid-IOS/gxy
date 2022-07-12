import 'package:demo/model/data_model.dart';
import 'package:demo/services/get_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CardItem extends StatefulWidget {
  final Data data;
  const CardItem(this.data, {Key? key}) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          ///标题和内容 图片
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                height: 100,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Text(
                        "${widget.data.title}",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Text(
                        "${widget.data.content}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // child: ,
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ],
          ),
          //时间 来源 热度
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${widget.data.time}" + "${widget.data.media}"),
              Text("${widget.data.hotData.toString()}"),
            ],
          ),
        ],
      ),
    );
  }
}
