import React from 'react';
import { Text, View, StyleSheet } from 'react-native';
import { Button, Slider } from 'react-native-elements';

export class startScreen extends React.Component {
    render() {
        return (
            <View style={styles.test}>
                <Text style={styles.textStyle}>AR Sandbox</Text>
                <View style={styles.startButton}>
                    <Button
                        title='START'
                        backgroundColor='#F1888A'
                        raised={true} />
                </View>
            </View >
        );
    }
}

const styles = StyleSheet.create({
    startButton: {
        width: '45%',
        height: '25%',
        marginTop: 125,
    },
    textStyle: {
        color: '#000000',
        textAlign: 'center',
        textShadowColor: 'rgba(255,255,0,1)',
        fontWeight: 'bold',
        fontSize: 24,
        textShadowRadius: 3,
        marginTop: 300
    },
    test: {
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center'
    }
});
