package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FacturaModel;

/**
 * Servlet implementation class CBorrar
 */
@WebServlet("/CBorrar")
public class CBorrar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CBorrar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FacturaModel newFactura = new FacturaModel();
		int id;
		try {
			newFactura.loadData();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		id=Integer.parseInt(request.getParameter("id"));
		
		
		for (int i = 0; i < newFactura.getList().size(); i++) {
			if (newFactura.getList().get(i).getIdFactura()==id) {
				newFactura.getList().remove(i);
			}
		}
		
		response.sendRedirect("CAdmin.java");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
