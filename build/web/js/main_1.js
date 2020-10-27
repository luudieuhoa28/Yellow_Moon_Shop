/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showDialogDeleteItem(cakeId) {
    var result = confirm("You want to delete this product?");
    if(result) {
        window.location.href = "DeleteCartController?btnAction=Delete" +
            "&cakeId=" + cakeId;
    }
}


