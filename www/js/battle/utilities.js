'use strict';

// Common functions / operator

function randomNumber(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min +1)) + min;
}

function loadDataFromDomStorage(name)
{
    var jsonData;

    jsonData = window.localStorage.getItem(name);
    return JSON.parse(jsonData);
}

function saveDataToDomStorage(name, data)
{
    var jsonData;

    jsonData = JSON.stringify(data);
    window.localStorage.setItem(name, jsonData);
}

function getJSON(url) {
    let gn = this;
    let xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function () {
        let response = JSON.parse(this.responseText);
        gn.list.push(response);
    };

    xmlhttp.open("GET", url, false);
    xmlhttp.send();
}
