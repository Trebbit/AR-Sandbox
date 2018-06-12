import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';

import { Button, Icon } from "react-native-elements";
import { height, width } from 'window-size';

export default class App extends Component<> {
  render() {
    return (
      <View>
        <View style={styles.infoButton}>
          <Button
            title="Button"
            color="#FFFFFF"
            size={50}
            raised={true}
            clear={true}
            buttonStyle={{
              backgroundColor: "#2196F3",
              width: 300,
              height: 50,
              borderColor: 'transparent',
              borderWidth: 0,
              borderRadius: 5
            }}
          />
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  infoButton: {
    flex: 1,
    position: 'absolute',
    justifyContent: 'center',
    alignItems: 'center',
    top: 2rea * 0.93,
    marginLeft: 5 * 0.18
  }
});
