import 'package:flutter/material.dart';
class NewCard extends StatelessWidget {
  const NewCard({required this.image, required this.title,required this.date});
  final String image;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),maxLines: 3,overflow: TextOverflow.ellipsis,)),
              SizedBox(width: 5),

              Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(image))
                    ),
                  ),),


            ],
          ),
          SizedBox(
            height: 0,
          ),
          Text(date,style: TextStyle(color: Colors.grey),),
          Divider(
            height: 30,
            thickness: 1,
            color: Colors.grey[600],
          )
        ],
      ),
    );
  }
}
