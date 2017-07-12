import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = { searchTerm: "" };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();

    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  handleChange(event) {
    event.preventDefault();
    let searchTerm = document.getElementById('search').value;

    this.setState({ searchTerm });
  }

  render() {
    return (
      <div>
        <form>
          <input id="search" type="text" onChange={this.handleChange}></input>
          <button onClick={this.handleSubmit}>Search</button>
        </form>

        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
