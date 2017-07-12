export const fetchSearchGiphys = (searchTerm) => {
  let api = `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`;
  return $.ajax({
    url: api,
    type: 'GET'
  });
};
