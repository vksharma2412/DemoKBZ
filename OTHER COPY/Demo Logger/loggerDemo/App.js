/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  TouchableOpacity
} from 'react-native';

import firebase from 'react-native-firebase';
import AppNative from './src/AppNative';

class App extends React.Component {

  constructor(props){
    super(props)
    this.state={
      setFCMToken: 'Token Pass'
    }
  }

  getToken = async () => {
    let fcmToken = await AsyncStorage.getItem('fcmToken');
    if (!fcmToken) {
      fcmToken = await firebase.messaging().getToken();
      if (fcmToken) {
        await AsyncStorage.setItem('fcmToken', fcmToken);
      }
    }
    AppNative.passFCMToken(fcmToken)
  };

  checkPermission = async () => {
    const enabled = await firebase.messaging().hasPermission();
    if (enabled) {
      this.getToken();
    } else {
      this.requestPermission();
    }
  };

  requestPermission = async () => {
    try {
      await firebase.messaging().requestPermission();
      this.getToken();
    } catch (error) {
      AppNative.rejectionHandle(error)
      console.log('permission rejected');
    }
  };

  createNotificationListeners = () => {
    this.onUnsubscribeNotificaitonListener = firebase
      .notifications()
      .onNotification(notification => {
        firebase.notifications().displayNotification(notification);
      });
  };

  removeNotificationListeners = () => {
    this.onUnsubscribeNotificaitonListener();
  };

  componentDidMount() {
    // Build a channel
    const channel = new firebase.notifications.Android.Channel('test-channel', 'Test Channel', firebase.notifications.Android.Importance.Max)
    .setDescription('My apps test channel');

    // Create the channel
    firebase.notifications().android.createChannel(channel);
    this.checkPermission();
    this.createNotificationListeners();
  }

  componentWillUnmount() {
    this.removeNotificationListeners();
  }
  
  render(){
  return (
    <View style={{ backgroundColor: 'grey', flex: 1, }}>
        <View style={{flex: 0.03}}></View>
        <View style={{ flex: 0.82, paddingTop: 20}}>
          <Text style={{textAlign: 'center', fontWeight: 'bold', fontSize: 30, color: 'white'}}>Event Logger</Text>
        </View>
        <View style={{ flex: 0.15, justifyContent: 'center', alignItems: 'center'}}>
        <TouchableOpacity
           style={{backgroundColor: 'green', width: '60%', alignItems: 'center', height: 45, justifyContent: 'center', borderRadius: 10}}
           onPress={()=> AppNative.logVE360({ param: 'param1', param2: "param2", param4: "param4" }, 'Login')}
        ><Text style={{ fontSize: 25, textAlign: 'center', color: 'white', fontWeight: 'bold'}}>Log Events</Text></TouchableOpacity>
        </View>
    </View>
   
  );
  }
};

export default App;
