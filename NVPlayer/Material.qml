import QtQuick 2.0
import QtQuick.Controls 1.5
    TableView {
        id:root
        //property alias color: rowD.color
        width: parent.width
        height: parent.height
        property bool orderAsce: true
        sortIndicatorVisible:true
        //sortIndicatorColumn:1
        onSortIndicatorOrderChanged:{
                root.orderAsce = orderAsce?false:true
                listModel.sort(root.sortIndicatorColumn,root.sortIndicatorOrder)
        }

        //alternatingRowColors: false
          TableViewColumn {
              role: "name"
              title: "名称"
              width: 60
          }
          TableViewColumn {
              role: "type"
              title: "类型"
              width: 60
          }
          TableViewColumn {
              role: "thumbnail"
              title: "缩略图"
              width: 100

          }
          TableViewColumn {
              role: "resolution"
              title: "分辨率"
              width: 100
          }
          TableViewColumn {
              role: "videoTime"
              title: "时长"
              width: parent.width-320
          }

          headerDelegate: Component {
                  Rectangle{
                      id:headerRect
                      height: 30
                      color:"#333333"
                      //border.width: 1
                      signal clicked
                      Text {
                          id: name
                          text: styleData.value
                          anchors.centerIn: parent
                          color:"white"
                          //font.weight: Font.Bold
                      }
                      Image{
                          id:asec
                          width: 8
                          height: 8
                          smooth: true
                          anchors.right: parent.right
                          anchors.rightMargin: 10
                          anchors.top: parent.top
                          anchors.topMargin: parent.height*0.3
                          source: "./images/asce.png"
                          rotation:{
                                if(root.sortIndicatorColumn === styleData.column){
                                        return root.orderAsce?0:180
                                }
                                return asec.rotation
                          }

//                          visible: {
//                            if(root.sortIndicatorColumn === styleData.column)
//                            {
//                                return (root.orderAsce? true: false)
//                            }
//                            return true
//                          }
                      }
//                      Image{
//                          id:"desc"
//                          width: 8
//                          height: 8
//                          smooth: true
//                          anchors.right: parent.right
//                          anchors.top: parent.top
//                          anchors.topMargin: parent.height*0.3
//                          source: "./images/desc.png"
//                          visible: {
//                              if(root.sortIndicatorColumn === styleData.column)
//                                 {
//                                     return (root.orderAsce? false: true)
//                                 }
//                              else{
//                                  return false
//                              }
//                          }
//                      }

                  }
          }



//          delegate: Component {
//              Item {
//                  property variant mymodel: model
//                  width: 180; height: 40
//                  scale: (view.currentIndex == index) ? 1.2 : 1
//                  Column {
//                      Text { text: '<b>Name:</b> ' + name }
//                      Text { text: '<b>Number:</b> ' + number }
//                  }
//                  MouseArea {
//                      anchors.fill: parent
//                      onClicked: {
//                          parent.ListView.view.currentIndex = index
//                      }
//                  }
//              }            }


//        MouseArea{
//          id:headerMouse
//          anchors.fill: root.headerDelegate.headerRect
//          onClicked: {
//                print("styleData.column")
//              //console.log(11)
//             // root.sortIndicatorColumn = styleData.column
//          }
//        }


          itemDelegate:Rectangle{
              id:rowD
              width: 60
              height: 20
              color:"transparent"
              Text{
                  text: styleData.value
                  anchors.centerIn: parent
                  color:"white"
              }
          }
          rowDelegate: Rectangle{
              width:60
              height: 20
              color:styleData.selected?"#0D476F":"#3C3C3C"
          }

          model: listModel



          ListModel {
              id:listModel;
              ListElement {
                  name: "战狼1"
                  type: "视频"
                  thumbnail:"空"
                  resolution:"1024x576"
                  videoTime:"02:10:12"
              }
              ListElement {
                  name: "战狼0"
                  type: "视频"
                  thumbnail:"空"
                  resolution:"1024x571"
                  videoTime:"02:10:12"
              }
              ListElement {
                  name: "战狼3"
                  type: "视频"
                  thumbnail:"空"
                  resolution:"1024x572"
                  videoTime:"02:10:12"
              }

              function swapListElement(element1,element2){
                  var temp = element1.name;
                  element1.name = element2.name;
                  element2.name = temp;

                  temp = element1.type;
                  element1.type = element2.type;
                  element2.type = temp;

                  temp = element1.thumbnail;
                  element1.thumbnail = element2.thumbnail;
                  element2.thumbnail = temp;

                  temp = element1.resolution;
                  element1.resolution = element2.resolution;
                  element2.resolution = temp;

                  temp = element1.videoTime;
                  element1.videoTime = element2.videoTime;
                  element2.videoTime = temp;

              }

              function sort(column,order){
                  print(column)
                  var rowCount = listModel.count;

                  //var map = {"1":name,"2":"type","3":"thumbnail","4":"resolution"}
                  for(var i = 0; i < root.rowCount; i++)
                      {
                          for(var j = 0; i + j <root.rowCount - 1; j++)
                          {
                              switch(column){
                                case 0:
                                    if(order === Qt.AscendingOrder)
                                    { if(listModel.get(j).name > listModel.get(j+1).name)
                                        {
                                            swapListElement(listModel.get(j),listModel.get(j+1))
                                        }
                                    }
                                    else{

                                        if(listModel.get(j).name< listModel.get(j+1).name)
                                          {
                                              swapListElement(listModel.get(j),listModel.get(j+1))
                                          }
                                    }
                                    break;
                                case 1:
                                    if(order === Qt.AscendingOrder)
                                    { if(listModel.get(j).type > listModel.get(j+1).type)
                                        {
                                            swapListElement(listModel.get(j),listModel.get(j+1))
                                        }
                                    }
                                    else{

                                        if(listModel.get(j).type < listModel.get(j+1).type)
                                          {
                                             swapListElement(listModel.get(j),listModel.get(j+1))
                                          }
                                    }
                                    break;
                                case 3:
                                    if(order === Qt.AscendingOrder)
                                    { if(listModel.get(j).resolution > listModel.get(j+1).resolution)
                                        {
                                           swapListElement(listModel.get(j),listModel.get(j+1))
                                        }
                                    }
                                    else{

                                        if(listModel.get(j).resolution < listModel.get(j+1).resolution)
                                          {
                                             swapListElement(listModel.get(j),listModel.get(j+1))
                                          }
                                    }
                                    break;
                                case 4:
                                    if(order === Qt.AscendingOrder)
                                    { if(listModel.get(j).videoTime > listModel.get(j+1).videoTime)
                                        {
                                            swapListElement(listModel.get(j),listModel.get(j+1))
                                        }
                                    }
                                    else{

                                        if(listModel.get(j).videoTime < listModel.get(j+1).videoTime)
                                          {
                                             swapListElement(listModel.get(j),listModel.get(j+1))
                                          }
                                    }
                                    break;
                                default:
                                    break;


                              }



                          }
                      }
              }


          }
          Component.onCompleted: {
              //listModel.sort()
          }

    }



