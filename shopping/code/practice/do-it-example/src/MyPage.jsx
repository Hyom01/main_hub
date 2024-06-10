// MyPage.jsx
import React, { Component } from 'react';
import PropTypes from 'prop-types';

import Logo from './cloths/LOGO.PNG';
import "./App.css";

class MyPage extends Component {
  
    constructor(props) {
      super(props);
      this.state = {

      };

      this.setRef = this.setRef.bind(this);
      this.onMove = this.onMove.bind(this);
      this.onLogout = this.onLogout.bind(this);
      /*this.onClickHandler = this.onClickHandler.bind(this);*/
    }
  
    setRef(ref) {
      this.ref = ref && ref.getBoundingClientRect ? ref : null;
    }
  
  
    /*onClickHandler() {
      axios.get('http://date.jsontest.com/')
        .then((response) => {
          if (response.data.success) {
            this.props.navigate("/logout");
          } else {
            alert("로그아웃 하시겠습니까?");
          }
        });
    }*/

    onMove(){
        sessionStorage.removeItem('userId');
        document.location.href = 'http://localhost:3000/';
    }

    onLogout() {
      sessionStorage.removeItem('userId');
      document.location.href = '/';
    }
  
    render() {
      const { info } = this.props;
      const { isLogin } = this.props;

      return (
        <>
          <div className="flex_container">
            <div className="menu">
              <h1><a href='http://localhost:3000/'>STOPBUGS</a></h1>
              <h1><a href='http://localhost:3000/'>SHOP v10.0</a></h1>
              <span className='message-container'>{this.props.info}</span> <button onClick={this.onLogout}>Logout</button>  MyPage             
              <h5>NEW</h5>
              <h5>Selected</h5>
              <h5><a href='https://simonejin.github.io/'>Top</a></h5>
              <h5>Bottom</h5>
  
              
          </div>
          <ul className="main_scroll" id="main">
              <img id="Logo" src={Logo}></img>
              </ul>
        </div>
        </>

      );
    }
  }

  MyPage.propTypes={
    info: PropTypes.string,
  }
  
export default MyPage;