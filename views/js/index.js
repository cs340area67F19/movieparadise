//Function to open and close the CRUD modal
function modalShow(type) {
    $(".modal").show();
    popModal(type);

    //$(".modal").click(function() {
    //    $(".modalContents").remove();
    //});
}

function modalHide(){
    $(".modal").hide();
    $(".modal-content").remove();
}

//Function to show the correct modal for creating
function createMod(){
    var elems = ["Name","Year","Type","Rating"];

    //Create the modal to show
    var modal = document.getElementsByClassName("modal");
    var modalContent = document.createElement("div");
    $(modalContent).addClass("modal-content");
    var text = document.createTextNode("Enter new information")
    $(modalContent).append(text);

    for(var i=0; i<4; i++){
        var input = document.createElement("input")
        input.setAttribute("Placeholder", elems[i])
        $(modalContent).append(input)
    }

    var button = document.createElement("button");
    $(button).append(document.createTextNode("Create"));
    $(button).addClass("Button")
    $(modalContent).append(button)
    $(modal).append(modalContent);
}

//Function to show the correct modal for updating
function updateMod(){
    var elems = ["Name","Year","Type","Rating"];
    var defaults = ["Casablanca","1942","Drama/Romance","9.6"];
    
    //Create the modal to show
    var modal = document.getElementsByClassName("modal");
    var modalContent = document.createElement("div");
    $(modalContent).addClass("modal-content");
    var text = document.createTextNode("Update existing information")
    $(modalContent).append(text);

    for(var i=0; i<4; i++){
        var input = document.createElement("input")
        input.setAttribute("Placeholder", elems[i])
        input.value = defaults[i]
        $(modalContent).append(input)
    }

    var button = document.createElement("button");
    $(button).append(document.createTextNode("Update"));
    $(button).addClass("Button")
    $(modalContent).append(button)
    $(modal).append(modalContent);
}

//Function to show the correct modal for deleting
function deleteMod(){
    var modal = document.getElementsByClassName("modal");
    var modalContent = document.createElement("div");
    $(modalContent).addClass("modal-content");
    var text = document.createTextNode("Are you sure you want to delete this entry?")
    $(modalContent).append(text);
    
    //Create the delete buttons
    var button = document.createElement("button");
    $(button).append(document.createTextNode("Delete it!"));
    $(button).addClass("Button");
    var button2 = document.createElement("button");
    $(button2).append(document.createTextNode("Cancel"));
    $(button2).addClass("Button");
    $(modalContent).append(button)
    $(modalContent).append(button2)
    $(modal).append(modalContent);
}

//Function to determine which modal to show
function popModal(type){
    switch(type){
        case "create":
            createMod();
            break;
        case "update":
            updateMod();
            break;
        case "delete":
            deleteMod();
            break;
    }
}

