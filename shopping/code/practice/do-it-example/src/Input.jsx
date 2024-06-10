import React,{Component} from "react";
import PropTypes from 'prop-types'

class Input extends Component{
    constructor(props){
        super(props)
        this.setRef=this.setRef.bind(this)
        this.handleChange=this.handleChange.bind(this)
    }

    handleChange(e){
        const {name,onChange}=this.props
        if (onChange){
            onChange(name,e.target.value)
        }
    }

    componentDidMount(){
        if (this.props.autoFocus){
            this.ref.focus();
        }
    }

    componentDidUpdate(){
        if(this.props.autoFocus){
            this.ref.focus()}
    }

    setRef(ref){
        this.ref=ref
    }

    onChange(key,value){
        this.setState=({
            [key]:value,
        })
    }

    render(){
        const {label,name,value,errorMessage,type,onFocus}=this.props
        return(
            <label>
                {label}
                <input id={`input_${name}`}
                ref={this.setRef} value={value}
                type={type} onFocus={onFocus}
                onChange={this.handleChange}/>
                {errorMessage && <span className="error">{errorMessage}</span>}
            </label>
        )
    }
}

Input.propTypes={
    label:PropTypes.string,
    name:PropTypes.string.isRequired,
    value:PropTypes.oneOfType([PropTypes.number,PropTypes.string]),
    type:PropTypes.oneOf(["text","number","password","price"]),
    autoFocus:PropTypes.bool,
    errorMessage:PropTypes.string,
    onChange:PropTypes.func,
    onFocus:PropTypes.func,
}
Input.defaultProps={
    type:"text",
    onChange: ()=>{},
    onFocus: ()=>{},
    autoFocus:false
}

export default Input