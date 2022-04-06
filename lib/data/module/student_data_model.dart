class StudentDataModel{

  String id = '';
  String name = "";
  String roll = "";


  StudentDataModel({required this.name,required this.roll,required this.id});

  StudentDataModel.fromJson(Map<String,dynamic> json){
   name = json['name']??"";
   roll = json['roll']??"";
   id = json['id']??"";
  }

  Map<String,dynamic> toJson(){
    return {
      'name':name,
      'roll':roll,
      'id':id,
    };
  }


}