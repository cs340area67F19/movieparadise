//Function to open and close the CRUD modal
function modalShow(type) {
    $(".modal").show();
    popModal(type);

    $(".close").click(function() {
        $(".modal").toggle();
    });
};

//Function to show the correct modal for creating
function createMod(){
    var elems = ["Name","Year","Type","Rating"];
    var modal = document.getElementsByClassName("modal-content");
    var text = document.createTextNode("Enter information for a new movie")
    $(modal).append(text);

    for(var i=0; i<4; i++){
        var input = document.createElement("input")
        input.setAttribute("Placeholder", elems[i])
        $(modal).append(input)
    }

    var button = document.createElement("button");
    $(button).append(document.createTextNode("Create"));
    $(button).addClass("Button")
    $(modal).append(button)
}

//Function to show the correct modal for updating
function updateMod(){
    var elems = ["Name","Year","Type","Rating"];
    var defaults = ["Casablanca","1942","Drama/Romance","9.6"];
    var modal = document.getElementsByClassName("modal-content");
    var text = document.createTextNode("Enter information for a new movie")
    $(modal).append(text);

    for(var i=0; i<4; i++){
        var input = document.createElement("input")
        input.setAttribute("Placeholder", elems[i])
        input.value = defaults[i]
        $(modal).append(input)
    }

    var button = document.createElement("button");
    $(button).append(document.createTextNode("Update"));
    $(button).addClass("Button")
    $(modal).append(button)
}

//Function to show the correct modal for deleting
function deleteMod(){
    var modal = document.getElementsByClassName("modal-content");
    var text = document.createTextNode("Are you sure you want to delete this entry?")
    $(modal).append(text);
    
    //Create the delete buttons
    var button = document.createElement("button");
    $(button).append(document.createTextNode("Delete it!"));
    $(button).addClass("Button");
    var button2 = document.createElement("button");
    $(button2).append(document.createTextNode("Cancel"));
    $(button2).addClass("Button");
    $(modal).append(button)
    $(modal).append(button2)
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