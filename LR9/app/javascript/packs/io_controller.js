function show_result(data){
    var result = document.getElementById("result");
    insertToHTML = "<table>";
    if (data.type == "Array") {
        arr = data.value;
        for (i = 0 ; i < arr.length - 1; i++) {
            insertToHTML += "<tr><td>" + (i+1) + "</td><td>" +
                arr[i] + "</td><td> NO </td></tr>";
        }
        insertToHTML += "<tr><td>" + arr.length + "</td><td>" +
            data.value[arr.length-1] + "</td><td> YES </td></tr>";
    } else {
        insertToHTML += data.value;
    }
    insertToHTML += "</table>";
    console.log("hello")
    result.innerHTML = "<hr/>Result is: " + data.value + "<hr/><p>"+Date()+"</p>";
}

handleAjaxSuccess = function (event) {
    [data, status, xhr] = event.detail;
    show_result(data);
}

document.addEventListener('DOMContentLoaded', function () {
    document.querySelector("#input_form").addEventListener(
        'ajax:success', handleAjaxSuccess)
})
