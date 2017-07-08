document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  let addPlaceButton = document.querySelector(".favorite-submit");
  addPlaceButton.addEventListener("click", (event) => {
    event.preventDefault();

    let text = document.querySelector('.favorite-input').value;
    let newLine = document.createElement("li");
    let newContent = document.createTextNode(text);
    newLine.appendChild(newContent);

    let ul = document.getElementById('restaurants');
    ul.appendChild(newLine);
  });



  let togglePhotoFormButton = document.querySelector('.photo-show-button');
  togglePhotoFormButton.addEventListener("click", (event) => {
    let photoForm = document.querySelector('.photo-form-container');

    if (photoForm.classList.contains("hidden")) {
      photoForm.classList.remove("hidden");
    } else {
      photoForm.classList.add("hidden");
    }
  });

  let newPhotoField = document.querySelector('.photo-url-input');
  let submitPhotoButton = document.querySelector('.photo-url-submit');
  submitPhotoButton.addEventListener("click", (event) => {
    event.preventDefault();

    let url = newPhotoField.value;

    let newImg = document.createElement("img");
    newImg.setAttribute("src", url);

    let newLine = document.createElement("li");
    newLine.appendChild(newImg);

    console.log(newLine);

    let photos = document.querySelector('.dog-photos');

    photos.appendChild(newLine);
  });


});
