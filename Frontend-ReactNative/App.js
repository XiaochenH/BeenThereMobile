import React from 'react';
import { ScrollView, Alert, Button, StyleSheet, Text, View, Image, FlatList } from 'react-native';
import { List, ListItem, SearchBar, Avatar } from 'react-native-elements';
import { LoginPage } from './screens/LoginPage'

export default class App extends React.Component {
  render() {
    return (
      <LoginPage/>
    );
  }
}
