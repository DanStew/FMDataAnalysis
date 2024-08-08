//Implementing two variables that are global and can only be set once
let currentlySorted = ""
let currentOrder = false

//Function to implement the click event listeners
window.onload =  () => {
    //Getting all the table headers
    tableHeader = document.getElementsByTagName("th")
    //Adding sort column event listener to all th's
    for (let th of tableHeader){
        th.addEventListener("click", (e) => sortRow(e.srcElement.innerText))
    }
}

//Function to get the index of the column that you are trying to sort
function getSortIndex(headerName){
    console.log(headerName)
    let tableHeaders = document.getElementsByTagName("th")
    for (let i=0; i<tableHeaders.length; i++){
        console.log(tableHeaders[i].innerText)
        if (tableHeaders[i].innerText == headerName){
            console.log("Matching")
            return i
        }
    }
    //If you can't find the header name, return false
    return "False"
}

//Function used to implement the sorting of columns
function sortRow(headerName){
    //Using the headerName, seeing what index the data needs to be sorted by
    let sortIndex = getSortIndex(headerName)
    //Ensuring there are no errors
    //Needs to be string as otherwise index 0 would cause an error
    if (sortIndex == "False"){
        return
    }
    //Getting the table element
    tables = document.getElementsByTagName("table")
    for (table of tables){
        //Finding the way in which the column needs to be sorted
        currentlySorted == headerName ? currentOrder = !currentOrder : currentOrder = false
        //Sorting the table by the column
        sortTable(table,sortIndex,currentOrder)
        currentlySorted = headerName
    }
}

//Function to format the wage attribute, so it can correctly be sorted
function formatWage(wageString){
    temp = wageString.substring(1,wageString.length-3)    
    content = ""
    contentParts = temp.split(",")
    for (let nmb in contentParts){
        content += contentParts[nmb]
    }
    return content
}

//Code to sort the rows of the table by a column
//This code is adapted from the solution found here : https://stackoverflow.com/questions/14267781/sorting-html-table-with-javascript
function sortTable(table, col, reverse) {
    var tb = table.tBodies[0], // use `<tbody>` to ignore `<thead>` and `<tfoot>` rows
        tr = Array.prototype.slice.call(tb.rows, 0), // put rows into array
        i;
    reverse = -((+reverse) || -1);
    tr = tr.sort(function (a, b) {
        let contentA = a.cells[col].textContent.trim()
        let contentB = b.cells[col].textContent.trim()
        //Including some special formatting of strings for certain attributes
        //This is to ensure the attributes are correclty sorted by the function
        //Formatting transfer value attribute
        if (col==6){
            contentA = contentA.split(" - ")[0]
            contentA = contentA.substring(1,contentA.length-1)
            contentB = contentB.split(" - ")[0]
            contentB = contentB.substring(1,contentB.length-1)
        }
        //Formatting wage attribute
        if (col==7){
            contentA = formatWage(contentA)
            contentB = formatWage(contentB)
        }
        return reverse // `-1 *` if want opposite order
            * (contentA.localeCompare(contentB,undefined, {"numeric":true}));
    });
    for(i = 0; i < tr.length; ++i) tb.appendChild(tr[i]); // append each row in order
}