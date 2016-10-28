import React from 'react';
import { Router, Route, Link, browserHistory } from 'react-router'
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component{
  constructor(props){
    super(props);
  }

  loadingBalls(){
    return(
      <div id="loading-container">
        <div id="loading">
          <div className="pokeball" id="normal"></div>
          <div className="pokeball" id="great"></div>
          <div className="pokeball" id="ultra"></div>
          <div className="pokeball" id="master"></div>
          <div className="pokeball" id="safari"></div>
        </div>
      </div>
    );
  }

  render(){

    let loading = (this.props.loading ? this.loadingBalls() : "");
    return(
      <div className='pokedex'>
        <ul>
          {loading}
          {this.props.pokemon.map( poke =>
            <PokemonIndexItem key={poke.id} pokemon={poke} />
          )}
        </ul>
        <div>
          {this.props.children}
        </div>
      </div>
    );
  }
}

export default PokemonIndex;
