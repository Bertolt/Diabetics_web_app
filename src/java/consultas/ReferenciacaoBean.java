/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consultas;

import java.beans.*;
import java.io.Serializable;
import java.sql.*;

/**
 *
 * @author Ruben
 */
public class ReferenciacaoBean implements Serializable {
    
    private int utentenumber;
    private Date datareferencia = null;
    private Boolean cardio;
    private Boolean vascular;
    private Boolean oftal;
    private Boolean nefro;
    private Boolean fisio;
    private Boolean ot;
    private Boolean tabag;
    private String username = null;
    private int registo;
    
    public void setUtenteNumber(int un) {
            utentenumber = un;
    }
    public void setDataReferencia(Date n) {
            datareferencia = n;
    }
    public void setCardio(Boolean g) {
            cardio = g;
    }
    public void setVascular(Boolean c) {
            vascular = c;
    }
    public void setOftal(Boolean p) {
            oftal = p;
    }
    public void setNefro(Boolean g) {
            nefro = g;
    }
    public void setFisio(Boolean c) {
            fisio = c;
    }
    public void setOt(Boolean p) {
            ot = p;
    }
    public void setTabag(Boolean d) {
           tabag = d;
    }
    public void setUsername(String un) {
            username = un;
    }
    
    public int getUtenteNumber() {
            return utentenumber;
    }
    public Date getDataReferencia() {
            return datareferencia;
    }
    public Boolean getCardio() {
            return cardio;
    }
    public Boolean getVascular() {
            return vascular;
    }
    public Boolean getOftal() {
            return oftal;
    }
    public Boolean getNefro() {
            return nefro;
    }
    public Boolean getFisio() {
            return  fisio;
    }
    public Boolean getOt() {
            return ot;
    }
    public Boolean getTabag() {
            return tabag;
    } 
    public String getUsername() {
            return username;
    }
    
    //INSERIR
   public boolean setDBRecord() {
            try {
                System.out.println(utentenumber);
                registo = updateDB(getInsertQuery());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    
    //INSERT QUERY
    
    private String getInsertQuery() {
            String query = "INSERT INTO referencias( ut_number , data_referencia, cardio, vascular, oftal, nefro, fisio, ot, tabag, username) "
                    + "VALUES(" +utentenumber+",'"+datareferencia+"',"+cardio+","+vascular+","+oftal+","+nefro+","+fisio+","+ot+","+tabag+",'"+username+"');\n";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    
    private int updateDB(String cmd) throws Exception {
		try{
			String bd ="jdbc:mysql://localhost:3306/diabetes?user=root&password=";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection(bd);
			java.sql.Statement s = conn.createStatement();
			System.out.println(cmd);
			int res = s.executeUpdate(cmd);
			System.out.println("Result: " + res+"\n----------");
			s.close ();
			conn.close();
			return res;
		} catch (Exception e){
			e.printStackTrace();
			return (-1);
		}
	}
    
    
}
