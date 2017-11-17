import React from 'react';

export const ItemDetail = ({ item }) => (
  <div>
    <h2>{item.name}</h2>
    <p>Happiness: {item.happiness}</p>
    <p>Price: {item.price}</p>
  </div>
);
