package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import model.FacturaModel;
import model.LineaModel;

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
		String numero_tarjeta = request.getParameter("inCardNumber");
		String cvc = request.getParameter("inCvv");
		String mes = request.getParameter("inMes");
		String yearStr = request.getParameter("inYear");
		
		String caducidad_tarjeta;
		
		if (yearStr != "") {
			int year = Integer.parseInt(yearStr);
			caducidad_tarjeta = mes + "/" + year;
		}else {
			caducidad_tarjeta = "";
		}
		
		String total = request.getParameter("totalFactura");
		JSONObject vTotal = new JSONObject(total);
		
		FacturaModel newFactura = new FacturaModel();
		
		newFactura.setNombre_cliente(nombre);
		newFactura.setApellido_cliente(apellido);
		newFactura.setDireccion_cliente(direccion);
		newFactura.setNumero_tarjeta(numero_tarjeta);
		newFactura.setCaducidad_tarjeta(caducidad_tarjeta);
		newFactura.setCvc_tarjeta(cvc);
		newFactura.setPrecio_total(vTotal.getDouble("total"));
		
		try {
			newFactura.insert_data();
			newFactura.last_id();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String carrito = request.getParameter("carritoFactura");
		JSONArray vCarrito = new JSONArray(carrito);
		
		for (int i = 0; i < vCarrito.length(); i++) {
			LineaModel newLinea = new LineaModel();
			
			JSONObject compra = vCarrito.getJSONObject(i);
			
			newLinea.setNombre_producto(compra.getString("nombre"));
			newLinea.setCantidad(compra.getInt("cantidad"));
			newLinea.setPrecio_linea(compra.getDouble("precio"));
			newLinea.setIdProducto(compra.getInt("id"));
			newLinea.setIdFactura(newFactura.getIdFactura());
			
			newFactura.getLineaList().add(newLinea);
		}
		
		try {
			newFactura.insert_lineas();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("newFactura", newFactura);
		request.getRequestDispatcher("factura.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
