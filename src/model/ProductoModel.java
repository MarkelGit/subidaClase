package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductoModel extends ProductoClass{
	
	private ArrayList<ProductoModel> list = new ArrayList<ProductoModel>();

	// ---- CONSTRUCTOR----

	public ProductoModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ProductoModel> getList() {
		return list;
	}

	// ---- methods
	public void loadData() throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("CALL allProductos");
		
		while (rs.next()) // reads the table line by line
		{ 
			ProductoModel newC = new ProductoModel();
			newC.setIdProducto(rs.getInt("id_producto"));
			newC.setIdSubcategoria(rs.getInt("id_subcategoria"));
			newC.setNombre_producto(rs.getString("nombre_producto"));
			newC.setPrecio_producto(rs.getDouble("precio_producto"));
			newC.setDescripcion(rs.getString("descripcion"));
			newC.setStock(rs.getInt("stock"));
			newC.setImagen(rs.getString("imagen"));
			this.list.add(newC);
		}
		this.con.close();
	}
	public void loadProductoBySubcategoria(int id) throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("CALL productosByIdSubcategoria("+id+")");
		
		while (rs.next()) // reads the table line by line
		{ 
			ProductoModel newC = new ProductoModel();
			newC.setIdProducto(rs.getInt("id_producto"));
			newC.setIdSubcategoria(rs.getInt("id_subcategoria"));
			newC.setNombre_producto(rs.getString("nombre_producto"));
			newC.setPrecio_producto(rs.getDouble("precio_producto"));
			newC.setDescripcion(rs.getString("descripcion"));
			newC.setStock(rs.getInt("stock"));
			newC.setImagen(rs.getString("imagen"));
			this.list.add(newC);
		}
		this.con.close();
	}
	public void loadProductoById(int id) throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("CALL productosByIdProducto("+id+")");
		
		while (rs.next()) // reads the table line by line
		{ 
			ProductoModel newC = new ProductoModel();
			newC.setIdProducto(rs.getInt("id_producto"));
			newC.setIdSubcategoria(rs.getInt("id_subcategoria"));
			newC.setNombre_producto(rs.getString("nombre_producto"));
			newC.setPrecio_producto(rs.getDouble("precio_producto"));
			newC.setDescripcion(rs.getString("descripcion"));
			newC.setStock(rs.getInt("stock"));
			newC.setImagen(rs.getString("imagen"));
			this.list.add(newC);
		}
		this.con.close();
	}
	public void loadProductoByCategoria(int id) throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("CALL productosByIdCategoria("+id+")");
		
		while (rs.next()) // reads the table line by line
		{ 
			ProductoModel newC = new ProductoModel();
			newC.setIdProducto(rs.getInt("id_producto"));
			newC.setIdSubcategoria(rs.getInt("id_subcategoria"));
			newC.setNombre_producto(rs.getString("nombre_producto"));
			newC.setPrecio_producto(rs.getDouble("precio_producto"));
			newC.setDescripcion(rs.getString("descripcion"));
			newC.setStock(rs.getInt("stock"));
			newC.setImagen(rs.getString("imagen"));
			this.list.add(newC);
		}
		this.con.close();
	}
	


}