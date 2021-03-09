<%@ page import="com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
    //Insert item
    if(request.getParameter("itemCode") != null)
    {
    	Item itemObj =  new Item();
    	
    	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
    			        request.getParameter("itemName"),
    			        request.getParameter("itemPrice"),
    			        request.getParameter("itemDesc"));
    	
    	session.setAttribute("statusMsg",stsMsg);
    	
    	
    }
    //Delete Item
    if(request.getParameter("itemID") != null){
    	Item itemObj = new Item();
    	String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
    	session.setAttribute("statusMsg", stsMsg); 
    	
    	
    }



%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
      <div class="container">
        <div class="row">
           <div class="col-6">
             <h1>Items Management...</h1>
             <form method="post" action="Item.jsp">
                  
                   Item Code        : <input name="itemCode" type="text" class="fprm-control form-control-sm"><br><br>
                   Item Name        : <input name="itemName"type="text" class="fprm-control form-control-sm"><br><br>
                   Item Price       : <input name="itemPrice"type="text" class="fprm-control form-control-sm"><br><br>
                   Item Description : <input name="itemDesc" type="text" class="fprm-control form-control-sm"><br><br>
              
                   <input name="btnSubmit" type="submit" value="SAVE" class="btn btn-primary">
             
             </form>
              <div class="alert alert-success">
             <%
            
               out.print(session.getAttribute("statusMsg"));
             
             %>
             </div>
             <br>
             <%
                Item itemObj = new Item();
                out.print(itemObj.readItems());
             
             %>
            </div>
         </div>    
      </div> 
</body>
</html>