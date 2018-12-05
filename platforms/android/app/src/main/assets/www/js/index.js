/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

var list = [
  permissions.ACCESS_FINE_LOCATION,
  permissions.ACCESS_COARSE_LOCATION,
  permissions.WRITE_EXTERNAL_STORAGE
];


function error() {
  console.warn('Camera or Accounts permission is not turned on');
}

function success( status ) {
  if( !status.hasPermission ) {

    permissions.requestPermissions(
      list,
      function(status) {
        if( !status.hasPermission ) error();
      },
      error);
  }


var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },

    // deviceready Event Handler
    //
    // Bind any cordova events here. Common events are:
    // 'pause', 'resume', etc.
    onDeviceReady: function() {
        this.receivedEvent('deviceready');
    },

    // Update DOM on a Received Event
    receivedEvent: function(id) {
        
        document.getElementById("item-showMap").onclick=function(){
            //显示地图
            cordova.exec((winParam)=>{
                         console.log('ssssss', winParam);
                         },
                         (error)=>{
                         console.error(error);
                         },
                         "cordova-plugin-ipsmapSDK",
                         "showMap"
                         );
        };
        document.getElementById("item-naviTo").onclick=function(){
//            permissions.hasPermission(list, callback, null);


            //导航到具体位置
        };
        document.getElementById("item-location").onclick=function(){
            //判断是否在地图内
        };
        
    }
};

app.initialize();
