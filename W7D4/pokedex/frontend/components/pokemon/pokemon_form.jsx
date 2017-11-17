import React from 'react';

export class PokemonForm extends React.Component{
  constructor(props) {
    super(props);
    this.state = { name: "", image_url: "", poke_type: "", attack: "",
    defense: "", moves: {} };
  }
}
