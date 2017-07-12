import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
  // debugger
  return (
    <ul>
      {giphys.map((giphy, idx) => <GiphysIndexItem giphy={giphy} key={idx} />)}
    </ul>
  );
};

export default GiphysIndex;
