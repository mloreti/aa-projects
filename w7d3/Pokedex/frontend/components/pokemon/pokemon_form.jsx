import React from 'react';

class PokemonForm extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      name: "",
      image_url: "",
      poke_type: "",
      attack: "",
      defense: "",
      moves: ["", ""]
    };
    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.errors=this.errors.bind(this);
  }

  errors(){
    return(
      this.props.errors.map((error, idx) => (
        <li key={idx}>{error}</li>
      ))
    );
  }



  update(property){
    if (property === "move1"){
      return e => this.setState({["moves"]: [e.target.value, this.state.moves[1]]});
    } else if (property === "move2") {
      return e => this.setState({["moves"]: [ this.state.moves[0], e.target.value]});
    } else {
      return e => this.setState({[property]: e.target.value});
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createPokemon(this.state);
  }

  render(){
    return(
      <div className="pokemon-detail">
        <ul className="errors">
          {this.errors()}
        </ul>
        <form onSubmit={this.handleSubmit} className="pokemon-form">
          <label>Name
          <input type="text" value={this.state.name} name="pokemon[name]" onChange={this.update("name")}></input>
          </label>
          <label> Image URL
          <input type="text" value={this.state.image_url} name="pokemon[image_url]" onChange={this.update("image_url")}></input>
          </label>
          <label> Type
            <select name ="pokemon[poke_type]" onChange={this.update("poke_type")} value={this.state.poke_type}>
              <option value=""></option>
            {window.POKEMON_TYPES.map((type,idx) => (
              <option key={idx} value={type}>{type}</option>
            ))}
          </select>
          </label>
          <label>Attack
            <input type="number" value={this.state.attack} name="pokemon[attack]" onChange={this.update("attack")}></input>
          </label>
          <label>Defense
            <input type="number" value={this.state.defense} name="pokemon[defense]" onChange={this.update("defense")}></input>
          </label>
          <label>Move 1
            <input type="text" value={this.state.moves[0]} name="pokemon[moves]" onChange={this.update("move1")}></input>
          </label>
          <label>Move 2
            <input type="text" value={this.state.moves[1]} name="pokemon[moves]" onChange={this.update("move2")}></input>
          </label>
          <button>Create Pokemon</button>
        </form>
      </div>
    );
  }
}


export default PokemonForm;
