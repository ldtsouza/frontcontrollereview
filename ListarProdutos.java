package command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class ListarProdutos implements Command {

	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	    ProdutoService produtoService = new ProdutoService();
	  
	    ArrayList<Produto> listarProdutos = null;
		 
		listarProdutos = produtoService.listarProdutos ();
			
		response.setContentType ("text/html"); 
		
		
		PrintWriter saida = response.getWriter();
	
		saida.println ("<br>  <h3> Lista de Produtos </h3> ");
		
	    saida.println (" <br>" + " " );	  
	 
		saida.println ("<html>");
		saida.println ("<body>");
		saida.println ("<table>");
					
		saida.println ("<tr>");
		
		saida.println ("<th>Codigo</th>");
		saida.println ("<th>Nome</th>");
		saida.println ("<th>Descricao</th>");
		saida.println ("<th>Valor</th>");
		saida.println ("<th>Estoque</th>");
		
	
		saida.println ("</tr>");
		
		

	    listarProdutos.forEach (
	    	p ->{
	    		
	    		
	    		
	    		saida.println ("<tr>");
		    	
	    		
	      		saida.println ("<td>" );
	    		
	    		saida.println(p.getCodigo());
	    		
	    		saida.println ("</td>");
	    		
	    		
	    		
	    		saida.println ("<td>");
	    		saida.println(p.getNome());
	    		saida.println ("</td>");
	    		
	    		
	    		saida.println ("<td>");
	    		saida.println(p.getDescricao());
	    		saida.println ("</td>");
	    		
	    		saida.println ("<td>");
	    		saida.println(p.getValor());
	    		saida.println ("</td>");
	    		
	    		saida.println ("<td>");
	    		saida.println(p.getEstoque());
	    		saida.println ("</td>");
	    		
	    		saida.println ("</tr>");
	    		
	   	
	    	}
	    
	    );
	    saida.println ("</table>");
	   
		saida.println ("</body>");
		
		 saida.println ("</html>");
		 

		 
		// Antes de despachar o usuário acicionar um atributo a requisição:
			request.setAttribute("mensagem", "lista encontrada  com sucesso!");
			
			// Despachar o usuário à aprte de visão (apresentação view):
			
			RequestDispatcher view = request.getRequestDispatcher("cadastro.jsp");
			
			view.forward (request, response);
		
		
	}

}
		
		
		
		
		
		
		
		
		
		
