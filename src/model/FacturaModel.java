package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class FacturaModel extends FacturaClass implements datos_empresa{
	
	private ArrayList<FacturaClass> list = new ArrayList<FacturaClass>();

	// ---- CONSTRUCTOR----

	public FacturaModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<FacturaClass> getList() {
		return list;
	}

	// ---- methods
	public void loadData() throws SQLException 
	{
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM factura");
		
		while (rs.next()) // reads the table line by line
		{ 
			FacturaModel newC = new FacturaModel();
			newC.setIdFactura(Integer.parseInt(rs.getString(1)));
			newC.setNombre_cliente(rs.getString(2));
			newC.setApellido_cliente(rs.getString(3));
			newC.setDireccion_cliente(rs.getString(4));
			newC.setNumero_tarjeta(rs.getString(5));
			newC.setCaducidad_tarjeta(rs.getString(6));
			newC.setCvc_tarjeta(rs.getString(6));
			newC.setFecha_compra(rs.getString(6));
			newC.setPrecio_total(Double.parseDouble(rs.getString(6)));
			this.list.add(newC);
		}
		this.con.close();
	}

}
