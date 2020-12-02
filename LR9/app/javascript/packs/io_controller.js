function show_result(data)
{
    var result = document.getElementById("result");
    insertToHTML = "<table>";
    if ( data.type == "Array" )
    {
        arr = data.value;
        max = arr[0];
        for ( i = 0 ; i < arr.length - 1; i++ )
        {
            insertToHTML += "<tr><td>" + (i+1) + "</td><td>" +
                arr[i] + "</td></tr>";
            if (arr[i].length > max.length)  max = arr[i];
        }
        insertToHTML += "<tr><td>" + arr.length + "</td><td>" +
            data.value[arr.length-1] + "</td></tr>";
        insertToHTML = "<hr/>" + "maximum length rising subsequence: "+ max + insertToHTML;
    } else
    {
        insertToHTML += data.value;
    }
    insertToHTML += "</table>";
    result.innerHTML = "<hr/>"+insertToHTML;
}

handleAjaxSuccess = function (event) {
    [data, status, xhr] = event.detail;
    show_result(data);
}

document.addEventListener('DOMContentLoaded', function () {
    document.querySelector("#input_form").addEventListener(
        'ajax:success', handleAjaxSuccess)
})
