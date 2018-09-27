import QtQuick 2.0
 import QtQml.Models 2.2

 Rectangle {
     width: 200; height: 200


     DelegateModel {
         id: visualModel

         model: ListModel {
             id:listModel;
             ListElement { value: "1"; value2:"one"}
             ListElement { value: "2"; value2:"two"}
             ListElement { value: "5"; value2:"five"}
             ListElement { value: "6"; value2:"six"}
             ListElement { value: "4"; value2:"four"}
             ListElement { value: "3"; value2:"three"}

         }
          //删除col1中和itemData相等的值
         function remove(itemData) {
             var rowCount = listModel.count;
             for( var i = 0;i < rowCount;i++ ) {
                 var data = listModel.get(i);
                 if(data.value == itemData) {
                     listModel.remove(i, 1);
                 }
             }
         }
         //排序(这边我只用冒泡排了序号，后面的value2懒得一起排，也可以用ListModel.move来排序，这样可以一步到位)
         function sort(){
             var rowCount = listModel.count;
             for(var i = 0; i < rowCount; i++)
                 {
                     for(var j = 0; i + j < rowCount - 1; j++)
                     {
                         if(listModel.get(j).value > listModel.get(j+1).value)
                         {
                             var temp = listModel.get(j).value;
                             listModel.get(j).value = listModel.get(j+1).value;
                             listModel.get(j+1).value = temp;
                         }
                     }
                 }
         }
         //通过value查找value2
         function find(value1)
         {
             var rowCount = listModel.count;
             for( var i = 0;i < rowCount;i++ ) {
                 var data = listModel.get(i);
                 if(data.value == value1) {
                     console.log(data.value2)
                 }
             }
         }



         delegate: Rectangle {
             id: item
             height: 25
             width: 200
             Row{
                 Text {
                     text: value
                 }
                 Text {
                     text: value2
                 }
             }

             MouseArea {
                 anchors.fill: parent
                 onClicked: {
                     listView.currentIndex = index;
                     //点击
                     //visualModel.remove(value)
                     visualModel.sort();
                     //visualModel.find(value);
                 }
             }
         }
     }

     ListView {
         id:listView;
         anchors.fill: parent
         model: visualModel
     }

 }


