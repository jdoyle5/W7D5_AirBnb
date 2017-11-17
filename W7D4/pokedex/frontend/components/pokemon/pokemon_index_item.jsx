import React from 'react';
import { Link } from 'react-router-dom';

export const PokemonIndexItem = poke => (
  <li>
    <Link to={`/pokemon/${poke.props.id}`}>
      <img width="20px" height="20px" src={poke.props.image_url}/> &ensp;
        {poke.props.name}
    </Link>
  </li>
);
