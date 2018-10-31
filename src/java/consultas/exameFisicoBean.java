/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consultas;

import java.io.Serializable;
import java.sql.*;

/**
 *
 * @author Ruben
 */
public class exameFisicoBean implements Serializable {
    
    private int utentenumber;
    private Date data_consulta = null;
    private int acuidadevisual;
    private int pesensibilidade;
    private int petemp;
    private int pepulsoperif;
    private int peintegridade;
    private String username;
    private int registo;

    public void setUtenteNumber(int un) {
            utentenumber = un;
    }
    public void setDataConsulta(Date n) {
            data_consulta = n;
    }
    public void setAcuidadeVisual(int un) {
            acuidadevisual = un;
    }
     public void setPeSensibilidade(int un) {
            pesensibilidade = un;
    }
      public void setPeTemp(int un) {
            petemp = un;
    }
       public void setPePulsoPerif(int un) {
            pepulsoperif = un;
    }
        public void PeIntegridade(int un) {
            peintegridade = un;
    }
    public void setUsername(String un) {
            username = un;
    }
    
    public int getUtenteNumber() {
            return utentenumber;
    }
    public Date getDataConsulta() {
            return data_consulta;
    }
    public int getAcuidadeVisual() {
            return acuidadevisual;
    }
    public int getPeSensibilidade() {
            return pesensibilidade;
    }
    public int getPeTemp() {
            return petemp;
    }
    public int getPePulsoPerif() {
            return pepulsoperif;
    }
    public int getIntegridade() {
            return peintegridade;
    }
    
    //INSERIR
    public boolean setDBRecord() {
            try {
                
                registo = updateDB(getInsertQuery());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    
    //INSERT QUERY
    
    private String getInsertQuery() {
            String query = "INSERT INTO exame_fisico( ut_number, data_consulta, acuidade_visual, pe_sensibilidade, pe_temp, pe_pulsoperif, pe_integridade, username) "
                    + "VALUES("+utentenumber+",'"+data_consulta+"',"+acuidadevisual+","+pesensibilidade+","+petemp+","+pepulsoperif+","+peintegridade+","+username+");\n";
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