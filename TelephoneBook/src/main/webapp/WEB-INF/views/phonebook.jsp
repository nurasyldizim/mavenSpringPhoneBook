<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Telephone Book</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<style>

h2 		 { 
  text-align:center; 
  margin-bottom:50px; 
}
h2 small { 
  font-weight:normal; 
  color:#888; 
  display:block; 
}

/* form starting stylings ------------------------------- */
.group 			  { 
  position:relative; 
  margin-bottom:45px; 
}
input 				{
  font-size:18px;
  padding:10px 10px 10px 5px;
  display:block;
  width:300px;
  border:none;
  border-bottom:1px solid #757575;
}


/* LABEL ======================================= */
label 				 {
  color:#999; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:10px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label 		{
  top:-20px;
  font-size:14px;
  color:#5264AE;
}

/* BOTTOM BARS ================================= */
.bar 	{ position:relative; display:block; width:300px; }
.bar:before, .bar:after 	{
  content:'';
  height:2px; 
  width:0;
  bottom:1px; 
  position:absolute;
  background:#5264AE; 
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
  position:absolute;
  height:60%; 
  width:100px; 
  top:25%; 
  left:0;
  pointer-events:none;
  opacity:0.5;
}

/* active state */
input:focus ~ .highlight {
  -webkit-animation:inputHighlighter 0.3s ease;
  -moz-animation:inputHighlighter 0.3s ease;
  animation:inputHighlighter 0.3s ease;
}

input:vaid ~ .highlight {
  -webkit-animation:inputHighlighter 0.3s ease;
  -moz-animation:inputHighlighter 0.3s ease;
  animation:inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@-webkit-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}


@import "compass/css3";

@import "compass/css3";
@import url(https://fonts.googleapis.com/css?family=Patua+One|Open+Sans);

* { 
  -moz-box-sizing: border-box; 
  -webkit-box-sizing: border-box; 
	box-sizing: border-box; 
}

table {
  border-collapse: separate;
  background:#fff;
  @include border-radius(5px);
  margin:50px auto;
  @include box-shadow(0px 0px 5px rgba(0,0,0,0.3));
}

thead {
  @include border-radius(5px);
}

thead th {
  font-family: 'Patua One', cursive;
  font-size:16px;
  font-weight:400;
  color:#fff;
  @include text-shadow(1px 1px 0px rgba(0,0,0,0.5));
  text-align:left;
  padding:20px;
  @include background-image(linear-gradient(#646f7f, #4a5564));
  border-top:1px solid #858d99;
  
  &:first-child {
   @include border-top-left-radius(5px); 
  }

  &:last-child {
    @include border-top-right-radius(5px); 
  }
}

tbody tr td {
  font-family: 'Open Sans', sans-serif;
  font-weight:400;
  color:#5f6062;
  font-size:13px;
  padding:20px 20px 20px 20px;
  border-bottom:1px solid #e0e0e0;
  
}

tbody tr:nth-child(2n) {
  background:#f0f3f5;
}

tbody tr:last-child td {
  border-bottom:none;
  &:first-child {
    @include border-bottom-left-radius(5px);
  }
  &:last-child {
    @include border-bottom-right-radius(5px);
  }
}

tbody:hover > tr td {
  @include opacity(0.5);
  
  /* uncomment for blur effect */
  /* color:transparent;
  @include text-shadow(0px 0px 2px rgba(0,0,0,0.8));*/
}

tbody:hover > tr:hover td {
  @include text-shadow(none);
  color:#2d2d2d;
  @include opacity(1.0);
}

</style>
</head>
<body onload="load();">

        <h2>Phone Book</h2>
        
    <div class="group">      
       <input type="text" id="firstName" required="required" name="firstName">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>First Name</label>
    </div>
      
    <div class="group">      
      <input type="text" id="middleName" required="required" name="middleName">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Middle Name</label>
    </div>
    
     <div class="group">      
      <input type="text" id="lastName" required="required" name="lastName">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Last Name</label>
    </div>
      
    <div class="group">      
      <input type="number" id="telephone" required="required" name="telephone">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Telephone</label>
    </div>
    
     <div class="group">      
      <input type="email" id="email" required="required" name="email">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Email</label>
    </div>
      
    <div class="group">      
      <button onclick="submit();">Submit</button>
      <span class="highlight"></span>
      <span class="bar"></span>
    </div>
    
     
     
 
        <table id="table" border=1>
            <tr> <th> First Name </th> <th> Middle Name </th> <th> Last Name </th> <th> Telephone </th> <th> Email </th> <th> Edit </th> <th> Delete </th> </tr>
         
        </table>
             
     
    <script type="text/javascript">
    data = "";
    submit = function(){
          if($("#contactId").val()!=""){
            $.ajax({
                url:'saveOrUpdate',
                type:'POST',
                data:{contactId:$("#contactId").val(),firstName:$('#firstName').val(),middleName:$('#middleName').val(),lastName:$('#lastName').val(),telephone:$('#telephone').val(),email:$('#email').val()},
                success: function(response){
                        alert(response.message);
                        $("#contactId").val(null);
                        $("#firstName").val("");
                        $("#middleName").val("");
                        $("#lastName").val("");
                        $("#telephone").val("");
                        $("#email").val("");
                        load();    
                }              
            });    
          }else{
        	  $.ajax({
                  url:'saveOrUpdate',
                  type:'POST',
                  data:{firstName:$('#firstName').val(),middleName:$('#middleName').val(),lastName:$('#lastName').val(),telephone:$('#telephone').val(),email:$('#email').val()},
                  success: function(response){
                          alert(response.message);
                          $("#contactId").val(null);
                          $("#firstName").val("");
                          $("#middleName").val("");
                          $("#lastName").val("");
                          $("#telephone").val("");
                          $("#email").val("");
                          load();    
                  }              
              });   
          }
            
    }
     
    delete_ = function(id){     
         $.ajax({
            url:'delete',
            type:'POST',
            data:{contactId:id},
            success: function(response){
                    alert(response.message);
                    $("#contactId").val(null);
                    $("#firstName").val("");
                    $("#middleName").val("");
                    $("#lastName").val("");
                    $("#telephone").val("");
                    $("#email").val("");
                    load();
            }              
        });
}
     
 
    edit = function (index){
        $("#contactId").val(data[index].contactId);
        $("#firstName").val(data[index].firstName);
        $("#middleName").val(data[index].middleName);
        $("#lastName").val(data[index].lastName);
        $("#telephone").val(data[index].telephone);
        $("#email").val(data[index].email);
         
    }
     
     
    load = function(){ 
        $.ajax({
            url:'list',
            type:'POST',
            success: function(response){
                    data = response.data;
                    $('.tr').remove();
                    for(i=0; i<response.data.length; i++){                  
                        $("#table").append("<tr class='tr'> <td> "+response.data[i].firstName+" </td> <td> "+response.data[i].middleName+" </td> <td> "+response.data[i].lastName+" </td> <td> "+response.data[i].telephone+" </td> <td> "+response.data[i].email+" </td> <td> <a href='#' onclick= edit("+i+");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("+response.data[i].contactId+");'> Delete </a>  </td> </tr>");

                    }          
            }              
        });
         
    }
         
    </script>
   
</body>
</html>