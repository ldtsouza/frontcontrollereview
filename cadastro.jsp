<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Date" %>    
<%@ page import="java.util.ArrayList,
                model.Produto,
                service.ProdutoService" %>
                
 <%@ page import="model.Produto,
                  service.ProdutoService" %>               
                    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerenciador de Produtos</title>
</head>
<body>

 
 <%

ArrayList<Produto> lista = new ArrayList<>();

ProdutoService produtoService = new ProdutoService();

lista = produtoService.listarProdutos();
 
%>

 
 <header>  🍬Loja de Chocolates &#128722;  </header>
  
  <h2> 
  <img src="chocolaterocher.jpg" class="card-img" alt="chocolate">
  </h2>
  <h4>  <%= new Date () %> </h4> 
  
    ${requestScope.mensagem } 
  
  
 <h3>Lista de Produtos </h3>
 
 <form action="controller.do"  method = "get"> 
 <input type="hidden" name="command"  value="AlterarProduto"> 
    
 <table> 
 <tr> 
    <th> Código</th>
    <th> Nome</th>
    <th> Descricao</th>
    <th> Valor </th>
    <th>Estoque</th>
      <th> Alterar  </th> 
     
  </tr>

 <% 
 for(Produto p :lista){
	
	 %>
	  <tr>
	  
	  <td> <input type="number" name="codigo_produto" value="<%= p.getCodigo()%>" /> <br></td>
	  
	  <td> <input type="text" name="nome_produto" value="<%= p.getNome()%>" /> <br></td>
	  
	  <td> <input type="text" name="descricao_produto" value="<%= p.getDescricao()%>" /> <br></td>
	  
	  <td> <input type="number" name="valor_produto" step = "0.1" value="<%= p.getValor()%>" /> <br></td>
	  
	  <td> <input type="number" name="estoque_produto" value="<%= p.getEstoque()%>" /> <br></td>
	  
	  <td>  <input type="submit" value="✏️" >  <br></td>
	  
		  
     <%
 }  
 
 %>
  </table>
 
  </form>
 

<h4  style="background-color:#fff0b3">Excluir Produto 🗑️

<form action="controller.do"  method = "get" > 
     <input type="hidden" name="command"  value="ExcluirProduto"> 
   
   <p style="color:red"> 
      Codigo: <input type="number" name="codigo_produto" /> <br>
      <br>
    
     <input type="reset"  value="Limpar"> 
   
     <button  href="ExcluirProduto?codigo='"+ p.getCodigo()+"'> Excluir </button>
   </p>

</form>

</h4>  
  
   	  
<p> <br> <button class="open-button" onclick="openForm()">Novo Produto 🍬</button> </p>
 
  <div class="form-popup" id="myForm">
 
  
 <h3>  Cadastrar 🍬</h3>
   
<form action="controller.do"  method = "post"> 
     <input type="hidden" name="command"  value="CadastrarProduto"> 

<button type="button" class="btn btn-secondary" onclick="closeForm()">Fechar</button> 
    
   <p> 
      Código: <input type="number" name="codigo_produto" /> <br>
      <br>
       Nome: <input type="text" name="nome_produto" /> <br>
      <br>
       Descrição:<input type="text" name="descricao_produto" /> <br>
      <br>
       Valor: <input type="number"  step = "0.1" name="valor_produto" /> <br>
      <br>
       Estoque: <input type="number" name="estoque_produto" /> <br>
      <br>
      <input type="submit"  value="Cadastrar"> 
      <input type="reset"  value="Limpar">
 </p>

     <img src= " crocher.jpg"  alt="Chocolate" >  
         
     
</form>
     
        <script>
         function openForm() {
        document.getElementById("myForm").style.display = "block";
        }
        
       function closeForm() {
       document.getElementById("myForm").style.display = "none";
       }
       </script>
 </div>
 


<footer>
  <p>Universidade São Judas Tadeu - Desenvolvimento Web - Prof. Igor Moreira - 2020</p>
  Aluna: Laudilene Dantas da Trindade de Souza - RA 819157991<br>
  Atividade: Gerenciador de Produtos - Entregar até 27.05.2020 <br>
</footer>
</body>

<style>


header {

  padding: 20px;
  text-align: center;
  font-size: 35px;
  color:black ;
}


h1{
  padding: 50px;
  text-align: center;
  font-size: 35px;
  color:#ff9900;
}


h2 {
  background:url('chocolaterocher.jpg');
  padding:10px;
  text-align: right;
  font-size: 15px;
  color: black;
}

h3 {
  padding: 10px;
  text-align: center;
  font-size: 30px;
  color: black;
}


h4 {
  font-size:15px;
  text-align:right;
  color: black;
  padding:2px;
   
}


table{
  padding-top: 2px;
  padding-bottom: 5px;
  text-align:center;
  color: #f2f3f2;
  width: 70%;

 
}

tr{
  background-color:  #ffcc00;
  color:black;
}

th{
  background-color:#fff0b3;
  color:black;
}


footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
}



.form-popup {
  display: inline;
  text-align: center;
  position: sticky;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 4;
  
}

.open-button {
  background-color: #ffcc00;
  float:center;
  color: white;
  padding: 10px 20px;
  border: none;
  bottom: 15px;
  right: 5px;
  
}


</style>


</html>