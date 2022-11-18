function show_result(data){
    var data_id = document.getElementById("data")
    var result = document.getElementById("result");
    var count = document.getElementById("counter")
    var arr = data.value[1]
    var number = data.value[0]
    if (Number(number) < 0) {
        count.innerHTML = ""
        data_id.innerHTML = ""
        result.innerHTML = ""
        alert("Numbers >= 0")
        return false
    }
        result.innerHTML = ""
        count.innerHTML = "Их количество: " + arr.length;
        for (let i = 0; i < arr.length; i++) {
            result.innerHTML += "<tr class = 'bord'>" + "<td class = 'bord'>" + arr[i] + "<td class = 'bord'>" + arr[i]**2 + "</tr>";
        }
    data_id.innerHTML = "<p>"+Date()+"</p>";
    }
$(document).ready(function(){
    $("#pal_form").bind("ajax:success", function(xhr, data, status)
    {
        show_result(data)
    })
})