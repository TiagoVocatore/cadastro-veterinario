<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Esp�cie</title>
<link href='<spring:url value="/resources/css/bootstrap.css" />'
	rel="stylesheet" />
<link href='<spring:url value="/resources/css/estilo.css" />'
	rel="stylesheet" />
<script src='<spring:url value="/resources/js/jquery-3.5.1.min.js" />'></script>
<script src='<spring:url value="/resources/js/bootstrap.js" />'></script>
<spring:url value="/especie/deleta/" var="deleta"></spring:url>
<spring:url value="/especie/altera/" var="altera"></spring:url>
<spring:url value="/especie/salva/" var="salva"></spring:url>
</head>
<body>
	<div class="container">
	<div class="row">
	
	<div class="col-lg-12 mt-2">
				<c:if test="${not empty mensagemErro }">
					<div id="divMensagemErro" class="alert alert-danger" role="alert">
						${mensagemErro }
					</div>
				</c:if>
				
				<c:if test="${not empty mensagemSucesso }">
					<div id="divMensagemSucesso" class="alert alert-success" role="alert">
						${mensagemSucesso }
					</div>
				</c:if>
	</div>			

	<div class="col-lg-12 mt-2">
		<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	    </div>
	    
		<div class="col-lg-4 mt-2">
		<h3 class="bg-light"> Cadastro de esp�cie </h3>
			 <form:form action="${salva}" modelAttribute="especie"
			 enctype="multipart/form-data" class="bg-light" id="form">

					<form:hidden path="codigo" />
					
					<div class="form-group col-lg-12">
					<label>Nome</label>
					<form:input path="nome" value="${especialidade.nome}" cssClass="form-control" />
					</div>

					<input type="submit" class="btn btn-primary" name="salva"
					value="salvar" /> <br><br>

			</form:form>
			</div>

			<div class="col-lg-8 mt-2">
			
				<c:if test="${not empty especies }">
				<h3 class="bg-light"> Tabela de esp�cies </h3>
				<table class="table table-dark">
				<thead>
				<tr>
								<th scope="col">C�digo</th>
								<th scope="col">Nome</th>
								<th scope="col" colspan="2">A��es</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="especie" items="${especies}">
				<tr>
							   <td scope="row">${especie.codigo}</td>
							   <td>${especie.nome}</td>
							   <td><a href="${altera}${especie.codigo}"
							   class="btn btn-warning">Alterar</a></td>
							   <td><a href="${deleta}${especie.codigo}"
							   class="btn btn-danger"
							   onclick="return confirm('Deseja deletar essa especie?');">Deletar</a></td>
			   </tr>
			   </c:forEach>
			   </tbody>
			   </table>
			   </c:if>
			   </div>

</div>
</div>

<script type="text/javascript">
		$(document).ready(function() {
			$('#divMensagemErro').delay(5000).fadeOut('slow');
			$('#divMensagemSucesso').delay(5000).fadeOut('slow');
		});
	</script>
	
</body>
</html>