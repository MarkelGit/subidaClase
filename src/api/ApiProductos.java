package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONStringer;

import model.ProductoModel;

/**
 * Servlet implementation class ApiProductos
 */
@WebServlet("/ApiProductos")
public class ApiProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiProductos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProductoModel productoModelo =new ProductoModel();
		int idSubcategoria=-1;
		int idProducto=-1;
		int idCategoria=-1;
		if (request.getParameter("idSubcategoria")!=null) {
		idSubcategoria=Integer.parseInt(request.getParameter("idSubcategoria"));
		}
		if (request.getParameter("idProducto")!=null) {
		idProducto=Integer.parseInt(request.getParameter("idProducto"));
		}
		if (request.getParameter("idCategoria")!=null) {
		idCategoria=Integer.parseInt(request.getParameter("idCategoria"));
		}
		try {
			if (idSubcategoria!=-1){
				productoModelo.loadData(idSubcategoria);
			}
			else if (idProducto!=-1) {
				productoModelo.loadProductoById(idProducto);
			}
			else if (idCategoria!=-1) {
				productoModelo.loadProductoByCategoria(idCategoria);
			}
			else {
				productoModelo.loadData();
			}
			
			String jsonString = JSONStringer.valueToString(productoModelo.getList());
			
			PrintWriter out = response.getWriter();
			
			response.setHeader("Access-Control-Allow-Origin","*"); //jsonp deia denean ez da behar
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			out.print(jsonString);
			out.flush();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
