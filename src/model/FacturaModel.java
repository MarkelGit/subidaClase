package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class FacturaModel extends FacturaClass implements datos_empresa{
	
	private ArrayList<FacturaModel> list = new ArrayList<FacturaModel>();
	private ArrayList<LineaModel> lineaList = new ArrayList<LineaModel>();
	// ---- CONSTRUCTOR----

	public FacturaModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<FacturaModel> getList() {
		return list;
	}

	// ---- methods
	public void loadData() throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("CALL allFacturas");
		
		while (rs.next()) // reads the table line by line
		{ 
			FacturaModel newC = new FacturaModel();
			newC.setIdFactura(Integer.parseInt(rs.getString(1)));
			newC.setNombre_cliente(rs.getString(2));
			newC.setApellido_cliente(rs.getString(3));
			newC.setDireccion_cliente(rs.getString(4));
			newC.setNumero_tarjeta(rs.getString(5));
			newC.setCaducidad_tarjeta(rs.getString(6));
			newC.setCvc_tarjeta(rs.getString(7));
			newC.setFecha_compra(rs.getString(8));
			newC.setPrecio_total(Double.parseDouble(rs.getString(9)));
			this.list.add(newC);
		}
		this.con.close();
	}
	public void delete_data() throws SQLException
	{
		this.createConnection();
	  	Statement st = this.con.createStatement();            	
	  	st.executeUpdate("CALL deleteFactura("+this.idFactura+")");
	              	
	        	this.con.close();
	}
	public void insert_data() throws SQLException
	{
		this.createConnection();
	  	Statement st = this.con.createStatement();            	
	  	st.executeUpdate("CALL insertFacturas('"+this.nombre_cliente+"','"+this.apellido_cliente+"','"+this.direccion_cliente+",'"+this.numero_tarjeta+"','"+this.caducidad_tarjeta+"','"+this.cvc_tarjeta+"','"+this.fecha_compra+"',"+this.precio_total+")");
	              	
	        	this.con.close();
	}
	public void insert_lineas() throws SQLException
	{
		this.createConnection();
		Statement st = this.con.createStatement();
		for (int i = 0; i < lineaList.size(); i++) {
		st.executeUpdate("CALL insertLineas ("+lineaList.get(i).getNombre_producto()+","+lineaList.get(i).getCantidad()+","+lineaList.get(i).getPrecio_linea()+","+lineaList.get(i).getIdProducto()+","+this.idFactura+")");
		
	}
		}
	
}
