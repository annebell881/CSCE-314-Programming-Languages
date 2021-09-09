import java.util.*;

public class car extends Vehicle{
	
	protected String licensePlate;
	
	public car(float speed, String LP){
		super(speed);
		this.licensePlate = LP;
	}
	
	public String getLicense(){
		return this.licensePlate;
	}
	
	public void setLicense(String L){
		this.licensePlate = L;
	}
	
	protected  String getMotor(){
		return this.motor;
	}
	
	protected void setMotor(String m){
		this.motor = m;
	}
	
	public void left(){
	
	}
	
	public void right(){
		
	}
	
	public void forward(){
		
	}
	
	public void reverse(){
		
	}
	
}