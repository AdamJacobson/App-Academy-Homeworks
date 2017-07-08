import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: "", num2: "" };

    // Bindings
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.calculate = this.calculate.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(event) {
    let n = event.currentTarget.value;
    if (n !== "") {
      n = parseInt(n);
    }
    console.log("num1: " + n);
    this.setState({num1: n });
  }

  setNum2(event) {
    let n = event.currentTarget.value;
    if (n !== "") {
      n = parseInt(n);
    }
    console.log("num2: " + n);
    this.setState({num2: n });
  }

  calculate(event) {
    event.preventDefault();
    // debugger
    let action = event.currentTarget.value;
    switch (action) {
      case "+":
        this.setState({ result: this.state.num1 + this.state.num2 });
        break;
      case "-":
        this.setState({ result: this.state.num1 - this.state.num2 });
        break;
      case "*":
        this.setState({ result: this.state.num1 * this.state.num2 });
        break;
      case "/":
        this.setState({ result: this.state.num1 / this.state.num2 });
    }
  }

  clear(event) {
    event.preventDefault();
    this.setState({ num1: "", num2: "", result: 0 });
  }

  render() {
    let { result, num1, num2 } = this.state;

    return (
      <div>
        <h1>{result}</h1>
        <input key="1" onChange={this.setNum1} value={num1}></input>
        <input key="2" onChange={this.setNum2} value={num2}></input>
        <button onClick={this.calculate} value="-" >-</button>
        <button onClick={this.calculate} value="+" >+</button>
        <button onClick={this.calculate} value="*" >*</button>
        <button onClick={this.calculate} value="/" >/</button>
        <br />
        <button onClick={this.clear}>Clear</button>
      </div>
    );
  }
}

export default Calculator;
