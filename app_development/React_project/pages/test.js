import React, { Compenent } from 'react';
import { Text, View, StyleSheet, Image } from 'react-native';
import { Button } from 'react-native-elements';

export class test extends React.Component {
    render() {
        return (
            <View style={styles.ImageBg}><Image
                source={{
                    uri: 'https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2F4.bp.blogspot.com%2F-5W1Edrta-4k%2FTiX7YNngfRI%2FAAAAAAAAC64%2FwM1LMJ23q8s%2Fs1600%2Fdog_1.jpg&f=1',
                    cache: 'only-if-cached',
                }}
                style={{ width: 400, height: 300, zIndex: 5 }}
            />
                <Text>sdsd</Text>
            </View >
        );
    }
}

const styles = StyleSheet.create({
    ImageBg: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
        zIndex: 2,
    }
});