$(document.querySelectorAll('.dropdown-toggle')).on("click", function () {
    new bootstrap.Dropdown($(this)).toggle();
})
