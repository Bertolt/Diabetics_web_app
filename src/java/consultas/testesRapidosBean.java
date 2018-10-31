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
public class testesRapidosBean implements Serializable {
    
    private int utentenumber;
    private Date dataconsulta = null;
    private int glicemia;
    private int cetonas;
    private int proteinuria;
    private int glicosuria;
    private int ccetonicos;
    private int ph;
    private int densidade;
    private int hematuria;
    private String username = null;
    private int registo;
    
    public void setUtenteNumber(int un) {
            utentenumber = un;
    }
    public void setDataConsulta(Date n) {
            dataconsulta = n;
    }
    public void setGlicemia(int g) {
            glicemia = g;
    }
    public void setCetonas(int c) {
            cetonas = c;
    }
    public void setProteinuria(int p) {
            proteinuria = p;
    }
    public void setGlicosuria(int g) {
            glicosuria = g;
    }
    public void setCcetonicos(int c) {
            ccetonicos = c;
    }
    public void setPh(int p) {
            ph = p;
    }
    public void setDensidade(int d) {
           densidade = d;
    }
    public void setHematuria(int h) {
            hematuria = h;
    }
    public void setUsername(String un) {
            username = un;
    }
    
    public int getUtenteNumber() {
            return utentenumber;
    }
    public Date getDataConsulta() {
            return dataconsulta;
    }
    public int getGlicemia() {
            return glicemia;
    }
    public int getCetonas() {
            return cetonas;
    }
    public int getProteinuria() {
            return proteinuria;
    }
    public int getGlicosuria() {
            return glicosuria;
    }
    public int getCcetonicos() {
            return  ccetonicos;
    }
    public int getPh() {
            return ph;
    }
    public int getDensidade() {
            return densidade;
    } 
    public int getHematuria() {
            return hematuria;
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
            String query = "INSERT INTO testes_rapidos( ut_number , data_consulta, glicemia, cetonas, proteinuria, glicosuria, c_cetonicos, ph, debsidade, hematuria, username) "
                    + "VALUES(" +utentenumber+",'"+dataconsulta+"',"+glicemia+","+cetonas+","+proteinuria+","+glicosuria+","+ccetonicos+","+ph+","+densidade+","+hematuria+",'"+username+"');\n";
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