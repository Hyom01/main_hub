import React, { Component } from "react";
import { random } from "lodash";
import { Modal}  from './modal'
import cloth01 from "./cloths/c1.png";
import cloth02 from "./cloths/c2.png";
import cloth03 from "./cloths/c3.png";
import cloth04 from "./cloths/c4.png";
import cloth05 from "./cloths/c5.png";
import cloth06 from "./cloths/c6.png";
import cloth07 from "./cloths/c7.png";
import cloth08 from "./cloths/c8.png";
import cloth09 from "./cloths/c9.png";
import cloth10 from "./cloths/c10.png";
import Empty_cart from "./cloths/cart3.svg";
import "./App.css";


class Scroll extends Component {
    cloth = [ cloth01 ,cloth02 ,cloth03 ,cloth04 ,cloth05 ,cloth06 ,cloth07 ,cloth08 ,cloth09 ,cloth10 ]
    cost = ['70','70','70','70','70','70','70','70','70','70',]
    constructor(props){
        super(props)
        this.state = {
            list : this.cloth,
            cost : this.cost,
            randomNumber: 0,
            modalOpen : false,
            selectedImage: null,
            Box : []
        } 
            this.setRef= this.setRef.bind(this)
            this.checkPosition = this.checkPosition.bind(this)
            window.addEventListener('scroll', this.checkPosition)
            this.handleButtonDecrease = this.handleButtonDecrease.bind(this)
            this.handleButtonIncrease = this.handleButtonIncrease.bind(this)
        }
        setRef(ref){
            this.ref = ref
        }       
        checkPosition(){
            const randomNumber = random(30, 100);

    let i = 0;
    if (this.ref && typeof this.ref.getBoundingClientRect === "function") {
      if (this.ref.getBoundingClientRect().top < window.innerHeight) {
        i = i++;
        this.setState(({ list, cost }) => ({
          list: [...list, this.cloth[Math.floor(Math.random() * 10)]], 
          cost: [...cost, randomNumber],
        }));
        console.log(i);
      }
    } else {
      console.log("exit");
    }
  }
  IamgeBox = (selectedImage)=>{
    this.setState((prevState)=> ({
      Box : [...prevState.Box,selectedImage]
    }))

  }
  openModal = (selectedImage) => {
    this.setState({ 
      selectedImage,
      modalOpen: true })
}
closeModal = () => {
    this.setState({ modalOpen: false })
}  
componentDidUpdate(){
  this.checkPosition()
}
componentDidMount(){
  this.checkPosition()
}
        componentWillUnmount() {
            window.removeEventListener('scroll',this.checkPosition)
        }
        scrollToTop() {
            window.scrollTo({ top: 0, behavior: "smooth" });
          }  
        handleButtonDecrease(){
            this.props.DecreaseCount()
        }

        handleButtonIncrease(){
            this.props.IncreaseCount()
        }
        render(){
            let { count } = this.props; 
            return(
            <> 
            <div className="flex_container">
            <div className="menu">
            <a id="Empty_cart" onClick={this.handleButtonDecrease}>
              <img id="cart" src={Empty_cart} alt="profile"></img>
              {count}
            </a>
             
                <h1>SHOPPER</h1>
                <h1>SHOP v7.3</h1>
                <p>-Login &nbsp; -Join &nbsp; -MyPage</p>
                <h5>NEW</h5>
                <h5>Selected ({count})</h5>
                <h5>Men's</h5>
                <h5>Women's</h5>
                
              <React.Fragment>
                <>
                <Modal open={this.state.modalOpen} close={this.closeModal} title="Create a chat room">
                  <img
                  width="300px"
                  src={this.state.selectedImage}
                  alt = "선택된 이미지"
                  />
                  <p>
                  제품설명
                  </p>
                </Modal>
                </>
            </React.Fragment>

               <button id="scrollToTop" onClick={this.scrollToTop}></button>
                </div>
            <ul>
            {this.state.list.map((cloth, i) => (
              <article>
                <li key={cloth + i}>
                  <a onClick={()=>this.openModal(cloth)}>
                  <img src={cloth} alt={`하의${i + 1}`} width="300" />
                  </a>
                  <br />
                  하의{i + 1}
                  <br />
                  가격:{this.state.cost[i]},000₩
                  &nbsp; <button onClick={this.handleButtonIncrease}>담기</button>
                </li>
              </article>
            ))}
            </ul>
            <div ref={this.setRef}>
              {""}
                The End
             </div>

            </div>
            //flex_container
            </>   
            )
        }
    }
    export default Scroll;