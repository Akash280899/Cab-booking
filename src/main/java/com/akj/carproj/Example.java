package com.akj.carproj;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.*;
import javax.servlet.http.HttpSession;

import java.io.*;
public class Example {
	static String otpTemp =  null;
	static String numberTemp = null;
	public static void main(String[] args) throws SQLException{ 
		Statement statement = null;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring","root","");
		statement = connection.createStatement(); 
		String query = "SELECT * From booking,customer where booking.booking_id = customer.booking_id ORDER BY customer.id DESC LIMIT 1" ;
		ResultSet resultset = statement.executeQuery(query); 
		while(resultset.next()) { 
			otpTemp = resultset.getString(12);
			numberTemp = resultset.getString(16);
		}
		System.out.println(Example.sendSms()); 
		}
	public static String sendSms() {
		
	try {
		// Construct data
		String apiKey = "apikey=" + "API_KEY";
		String message = "&message=" + "Thanks for using V Cabs!!Your booking is confirmed.Share this OTP number: " +otpTemp + " when driver arrives to start the ride.";
		String sender = "&sender=" + "TXTLCL";
		String numbers = "&numbers=" + numberTemp;
		
		// Send data
		HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
		String data = apiKey + numbers + message + sender;
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
		conn.getOutputStream().write(data.getBytes("UTF-8"));
		final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		final StringBuffer stringBuffer = new StringBuffer();
		String line;
		while ((line = rd.readLine()) != null) {
			stringBuffer.append(line);
		}
		rd.close();
		return(stringBuffer.toString());
	} catch (Exception e) {
		System.out.println("Error SMS "+e);
		return "Error "+e;
	} }
}
