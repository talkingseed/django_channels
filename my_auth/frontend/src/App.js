import React, { Component }  from 'react';
import logo from './logo.svg';
import './App.css';

import FacebookLogin from 'react-facebook-login';
import GoogleLogin from 'react-google-login';
import fbLogin from "./services/fbLogin"
import googleLogin from "./services/googleLogin"

class App extends Component {
  render() {
    const responseFacebook = async (response) => {
      let fbResponse  = await fbLogin(response.accessToken)
      console.log(fbResponse);
      console.log(response);
    }

    const responseGoogle = async(response) => {
      let googleResponse  = await googleLogin(response.accessToken)
      console.log(googleResponse);
      console.log(response);
    }

    const StringifyObject = () => (
      <pre>
        {JSON.stringify(process.env, null, 2)}
      </pre>
    )

    return (
      <div className="App">

        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
        </header>

        <FacebookLogin
          appId={process.env.REACT_APP_FACEBOOK_CLIENT_ID}
          fields="name,email,picture"
          callback={responseFacebook}
        />
        <br />
        <br/>
        <GoogleLogin
          clientId={process.env.REACT_APP_GOOGLE_CLIENT_ID}
          buttonText="LOGIN WITH GOOGLE"
          onSuccess={responseGoogle}
          onFailure={responseGoogle}
        />

      </div>
    );
  }
}
export default App;
