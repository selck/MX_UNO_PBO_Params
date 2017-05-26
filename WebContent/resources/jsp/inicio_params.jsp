<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/bootstrap-table.js"></script>


<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/bootstrap-editable.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/bootstrap-table-editable.js"></script>



<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap-table.css">

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap-editable.css">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to MX_UNO_WSD_Util</title>
<script>

$(function () {
	
	 var $table = $('#table').bootstrapTable({
        idField: 'id',
        emptytext: 'Vacio',
        url: '/MX_UNO_WSB_Utils/rest/utilController/getParameters',
        columns: [{
            field: 'id',
            title: 'Id'
        }, {
            field: 'valor',
            title: 'Valor',
            editable: {
                type: 'text',
                mode: 'inline',
                url:'/MX_UNO_WSB_Utils/rest/utilController/saveOrUpdateParameter',
                params: function (params) {
                    params.idParameter = params.pk,
                    params.value = params.value
    				return params;
                },
                success: function(k,v){
        	        console.log("k: "+k);
        	        console.log("v: "+v);
        	    }
            }
        }, {
            field: 'descripcion',
            title: 'Descripcion'
            /*editable: {
                type: 'text',
                mode: 'inline',
                url:'rest/utilController/saveOrUpdateParameter',
                params: function (params) {
                    params.idParameter = params.pk,
                    params.value = params.value
    				return params;
                },
                success: function(k,v){
        	        console.log("k: "+k);
        	        console.log("v: "+v);
        	    }
            }*/
        }]
    });
	
	
	 $table.on('editable-save.bs.table', function (e, field, row, old, $el) {
		 
 	});
	
	/*var $table2 = $('#table2').bootstrapTable({
		 editable: {
             type: 'text',
             mode: 'inline',
             url:'rest/utilController/saveOrUpdateParameter',
             params: function (params) {
                 params.idParameter = params.pk,
                 params.value = params.value
 				return params;
             },
             success: function(k,v){
     	        console.log("k: "+k);
     	        console.log("v: "+v);
     	    }
         }
	  });*/
});

</script>
</head>
<body>

	<h2>BackOffice Parametros</h2>
		
	<table id="table" 
	data-classes="table table-hover table-condensed"
	data-row-style="rowStyle"
    data-striped="true">
	</table>
	
	<br>
	<br>
	
	<!-- 
	<table 
	id="table2"
	data-toggle="table"
	data-url="rest/utilController/getParameters"
	data-sort-name="id"
	data-classes="table table-hover table-condensed"
    data-striped="true"
	>
    <thead>
    <tr>
        <th data-field="id" data-sortable="true">Id Parametro</th>
        <th data-field="valor">Valor Parametro</th>
        <th data-field="descripcion">Descripcion</th>
    </tr>
    </thead>
	</table>  -->

</body>
</html>