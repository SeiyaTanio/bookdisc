const XHR = new XMLHttpRequest();
XHR.open("GET", `/tweets/search/?keyword=${keyword}`, true);
XHR.responseText = "json";
XHR.onload = () => {
  const tTagName = XHR.response.keyword;
  const searchResult = document.getElementById("search-result");
  tTagName.forEach((tag) => {
    const childElement = document.createElement("div");
    childElement.setAttribute("class", "child");
    childElement.setAttribute("id", tag.id);
    childElement.innerHTML = tag.tag_name;
    searchResult.appendChild(childElement);
  })
};