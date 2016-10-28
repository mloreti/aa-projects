import React from 'react';

// import PokemonDetailItem from './pokemon_detail_item';

class ItemDetail extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    let item = this.props.item;
    return(
      <ul className="items">
        <li><h2>{item.name}</h2></li>
        <li>happiness: {item.happiness}</li>
        <li>price: {item.price}</li>
      </ul>
    );
  }
}

export default ItemDetail;
