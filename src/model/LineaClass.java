package model;

public class LineaClass extends Connect{
	
	protected int idLinea;
	protected String nombre_producto;
	protected int cantidad;
	protected double precio_linea;
	protected int idProducto;
	protected int idFactura;
	
	public LineaClass() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getIdLinea() {
		return idLinea;
	}

	public void setIdLinea(int idLinea) {
		this.idLinea = idLinea;
	}

	public String getNombre_producto() {
		return nombre_producto;
	}

	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getPrecio_linea() {
		return precio_linea;
	}

	public void setPrecio_linea(double precio_linea) {
		this.precio_linea = precio_linea;
	}

	public int getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public int getIdFactura() {
		return idFactura;
	}

	public void setIdFactura(int idFactura) {
		this.idFactura = idFactura;
	}

}
