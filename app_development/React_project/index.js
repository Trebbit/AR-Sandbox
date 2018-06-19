import React, { Compenent } from 'react';
import { AppRegistry, View } from 'react-native';
import { StackNavigator } from 'react-navigation';

import { startScreen } from './pages/startScreen';
import { grondInfo } from './pages/grondInfo';
import { luchtInfo } from './pages/luchtInfo';
import { waterInfo } from './pages/waterInfo';
import { sliderPage } from './pages/sliderPage';
import { test } from './pages/test';

const App = StackNavigator({
    grondInfo: { screen: grondInfo },
    startScreen: { screen: startScreen },
    luchtInfo: { screen: luchtInfo },
    waterInfo: { screen: waterInfo },
    sliderPage: { screen: sliderPage }
},
    {
        headerMode: 'none',
        initialRouteName: 'sliderPage',
    }
);


export default class ARSandbox extends React.Component {

    static navigationOptions = {
        title: 'welcome'
    };

    render() {
        return <App />;
    }
}

AppRegistry.registerComponent('React_project', () => App);
