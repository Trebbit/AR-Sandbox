import React, { Compenent } from 'react';
import { Text, View, StyleSheet, TouchableOpacity } from 'react-native';
import { Button, Avatar, Badge, Icon } from 'react-native-elements';
import Feather from 'react-native-vector-icons/Feather';

export class startScreen extends React.Component {
    static navigationOptions = {
        headerStyle: {
            backgroundColor: 'rgba(0,0,0,1)',
        },
    };
    render() {
        return (
            <View>
                <View style={styles.backgroundTop}>
                    <View style={styles.BackButton}>
                        <TouchableOpacity>
                            <Feather name='arrow-left' size={20} color='#FFFFFF' />
                        </TouchableOpacity>

                    </View>
                </View>
                <View style={styles.backgroundbot}>
                    <View style={styles.NextButton}>
                        <Button
                            backgroundColor="#F1888A"
                            raised={true}
                            title='next'
                            fontFamily='Roboto'
                            fontSize={20}
                            fontWeight='500'
                        />
                    </View>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    backgroundTop: {
        backgroundColor: '#2196F3',
        width: '100%',
        height: '20%',

    },
    backgroundbot: {
        backgroundColor: '#BBDEFB',
        width: '100%',
        height: '80%',
        zIndex: -1
    },

    BackButton: {
        width: '4%',
        backgroundColor: 'rgba(0,0,0,0)',
        marginTop: 12,
        marginLeft: 12
    },

    NextButton: {
        width: '35%',
        height: '40%',
        marginTop: 450,
        marginLeft: 260
    },
});
