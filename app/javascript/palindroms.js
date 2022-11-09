// function show_result(data){
//     var result = document.getElementById("#res");
//     result.innerHTML = "<hr/>Result is: " + data.value +
//     "<hr/><p>"+Date()+"</p>";
//     }
//     $(document).ready(function(){
//     $("#pal_form").bind("ajax:success", function(xhr, data, status) {
//     show_result(data)
//     })
//     })


// handleAjaxSuccess = function(event) {
//     [data, xhr] = event.detail;
//     var list = document.querySelector("tab");
//     var p = document.createElement("p");
//     p.textContent = data.name;
//     list.appendChild(p);
//     }
//     document.addEventListener('DOMContentLoaded', function(){
//     document.querySelector("#pal_form")?.addEventListener(
//     'ajax:success', handleAjaxSuccess)
//     })
