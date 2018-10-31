/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ValidateEmail()   
{  
	var $email=document.getElementById('kmail').value;
	var $reg=/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i ;
 if($reg.test($email))  
  {  
    return (true);  
  }  
    alert("You have entered an invalid email address!")  

    return (false);
}

function goToPesquisaUtente(){
       window.location = '/someOtherJSPPage.jsp';
   }