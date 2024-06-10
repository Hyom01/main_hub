// Login.jsx
import React, { Component } from 'react';
import Input from './Input';
import MyPage from './MyPage';

class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: '',
      isLogin:false,
      ID:'',
      PW:'',
      eMail:'',
      pw_check:'',
      isRegister:false,
    };

    this.onChange = this.onChange.bind(this);
    this.loginRequestHandler = this.loginRequestHandler.bind(this);
    this.logoutRequestHandler=this.logoutRequestHandler.bind(this)
    this.signingin=this.signingin.bind(this)
    this.registerRequestHandler=this.registerRequestHandler.bind(this)
  }

  onChange(key, value) {
    this.setState({
      [key]: value,
    });
  }

  loggingin(){
    this.setState({
      isLogin:!this.state.isLogin, isRegister:false
    })
  }

  logoutRequestHandler(){
    this.loggingin()
  }

  signingin(){
    this.setState({
      isRegister:true
    })
  }

  loginRequestHandler() {
    let userId;
    let email;
    console.log(this.state)
    if (this.state.username === '홍길동' && this.state.password === '1234') {
      userId = 'gildong';
      email = 'gdhong@naver.com';
      window.confirm(`사용자 정보, 아이디: ${userId}  이메일: ${email}`);
      this.loggingin();
    } else {
      alert('사용자 정보가 틀렸습니다');
    }
  }

  registerRequestHandler() {
    if(this.state.ID==='' || this.state.PW==='' || this.state.pw_check===''){
      alert('정보를 입력하시오')
      } else if (this.state.ID === '홍길동') {
      alert('이미 사용중인 이름입니다.')
    } else if(this.state.PW !== this.state.pw_check){
      alert('비밀번호 확인을 다시 입력하시오');
    }else  {
    alert('회원가입이 완료되었습니다.')
    this.loggingin()
    }
    console.log(this.state)
  }

  render() {
    return (
      this.state.isRegister?(<div><h2>회원가입</h2>
      <h3><Input label="Username"name="ID"type="text"onChange={this.onChange}/></h3>
      <h3><Input label="Password"name="PW" type="password" onChange={this.onChange}/></h3>
      <h3><Input label="PW Check"name="pw_check"type="password"  onChange={this.onChange}/></h3>
      <h3><Input label="e-Mail"name="eMail"type="text"  onChange={this.onChange}/></h3>
      <button onClick={this.registerRequestHandler}>Register</button></div>):
      (<div>
        {this.state.isLogin?<div>
          <MyPage info={this.state.username}/>
          </div>
          :
          <div><h2>로그인</h2>
        <h2><Input label="Username" name="username" type="text" onChange={this.onChange}/></h2>
        <h2><Input label="Password" name="password" type="password" onChange={this.onChange}/></h2>
        <button onClick={this.loginRequestHandler}>Login</button>
        <button onClick={this.signingin}>Register</button>
        </div>}
      </div>)
    );
  }
}

export default Login;