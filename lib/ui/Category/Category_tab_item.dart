import 'package:flutter/material.dart';
import 'package:news_app/Core/model/Source.dart';

class SourceTap extends StatelessWidget
{
  Source source;
  bool selected;
  SourceTap(this.source,this.selected);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color:selected?Theme.of(context).primaryColor:Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor)
      ),
      child: Text(source.name??"",
          style:TextStyle(
            color:   selected?Colors.white:Theme.of(context).primaryColor
          ),
      ),

    );
  }
}