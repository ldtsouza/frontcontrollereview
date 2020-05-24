package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class AlterarProduto implements Command {

	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
					
		
		// Recebendo os parametros:
		int codigo = Integer.parseInt(request.getParameter("codigo_produto"));
		String descricao = request.getParameter("descricao_produto");
		String nome = request.getParameter ("nome_produto");
		double valor = Double.parseDouble(request.getParameter("valor_produto"));
		int estoque = Integer.parseInt(request.getParameter("estoque_produto"));
		

		// Instanciando um JavaBean de Produto:
		Produto produto = new Produto ();
		produto.setCodigo (codigo);
		produto.setNome(nome);
		produto.setDescricao (descricao);
		produto.setValor(valor);
		produto.setEstoque(estoque);
		
		
		// Instanciando uma service de produto
		ProdutoService produtoService = new ProdutoService ();
		
		 
		 @SuppressWarnings("unused")
		ArrayList<Produto> listarProdutos = null;
		 
		 listarProdutos = produtoService.listarProdutos ();
		
		// Solicitando a service que altere o produto no banco:
		 
 
		produtoService.alterar (produto);
		
		
		
		// Antes de despachar o usuário acicionar um atributo a requisição:
		request.setAttribute("mensagem", "o usuario foi alterado com sucesso!");
		
		// Despachar o usuário a parte de visão (apresentação view):
		
		RequestDispatcher view = request.getRequestDispatcher("cadastro.jsp");
		
		view.forward (request, response);
		
		
		
		
		
	}

}
