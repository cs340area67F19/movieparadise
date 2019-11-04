//Function to open and close the CRUD modal
function modalShow(type) {
    $(".selector").click(function() {
        $(".modal").toggle();
        popModal(type);
    });

    $(".close").click(function() {
        $(".modal").toggle();
    });
};

function popModal(type){
    var modal = document.getElementsByClassName("modal-content");
    switch(type){
        case "create":
            break;
        case "update":
            break;
        case "delete":
            var text = document.createTextNode("Are you sure you want to delete this entry?")
            modal.appendChild(text);
            break;
    }
}
