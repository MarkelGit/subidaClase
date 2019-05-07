package model;

public class FacturaClass extends Connect{
	
	protected int idFactura;
	protected String nombre_cliente;
	protected String apellido_cliente;
	protected String direccion_cliente;
	protected String numero_tarjeta;
	protected String caducidad_tarjeta;
	protected String cvc_tarjeta;
	protected String fecha_compra;
	protected double precio_total;
	
	public FacturaClass() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getIdFactura() {
		return idFactura;
	}

	public void setIdFactura(int idFactura) {
		this.idFactura = idFactura;
	}

	public String getNombre_cliente() {
		return nombre_cliente;
	}

	public void setNombre_cliente(String nombre_cliente) {
		this.nombre_cliente = nombre_cliente;
	}

	public String getApellido_cliente() {
		return apellido_cliente;
	}

	public void setApellido_cliente(String apellido_cliente) {
		this.apellido_cliente = apellido_cliente;
	}

	public String getDireccion_cliente() {
		return direccion_cliente;
	}

	public void setDireccion_cliente(String direccion_cliente) {
		this.direccion_cliente = direccion_cliente;
	}

	public String getNumero_tarjeta() {
		return numero_tarjeta;
	}

	public void setNumero_tarjeta(String numero_tarjeta) {
		this.numero_tarjeta = numero_tarjeta;
	}

	public String getCaducidad_tarjeta() {
		return caducidad_tarjeta;
	}

	public void setCaducidad_tarjeta(String caducidad_tarjeta) {
		this.caducidad_tarjeta = caducidad_tarjeta;
	}

	public String getCvc_tarjeta() {
		return cvc_tarjeta;
	}

	public void setCvc_tarjeta(String cvc_tarjeta) {
		this.cvc_tarjeta = cvc_tarjeta;
	}

	public String getFecha_compra() {
		return fecha_compra;
	}

	public void setFecha_compra(String fecha_compra) {
		this.fecha_compra = fecha_compra;
	}

	public double getPrecio_total() {
		return precio_total;
	}

	public void setPrecio_total(double precio_total) {
		this.precio_total = precio_total;
	}

}
