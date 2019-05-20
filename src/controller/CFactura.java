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
 * Servlet implementation class CFactura
 */
@WebServlet("/CFactura")
public class CFactura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CFactura() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("inNombre");
		String apellido = request.getParameter("inApellido");
		String direccion = request.getParameter("inDireccion");
		String propietario = request.getParameter("inOwner");
		String cvc = request.getParameter("inCvv");
		String numero_tarjeta = request.getParameter("inCardNumber");
		String caducidad_tarjeta = request.getParameter("inCardNumber");
		String mes = request.getParameter("inMes");
		int year = Integer.parseInt(request.getParameter("inYear"));
		
		FacturaModel newFactura = new FacturaModel();
		
//		myConflict.setIdConflict(idSelected);
//		myConflict.setSince(since);
//		myConflict.setDeaths(deaths);
//		myConflict.setDisplacedPeople(displacedPeople);
//		myConflict.update();
		
		request.setAttribute("newFactura", newFactura);
		request.getRequestDispatcher("admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
