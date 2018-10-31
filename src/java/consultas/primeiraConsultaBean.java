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
public class primeiraConsultaBean implements Serializable {
    
    private int utentenumber;
    private Date dataconsulta = null;
    private String tipodiab = null;
    private Date datadiag = null;
    private int insulina;
    private int antecedentes;
    private int neurop;
    private int retinop;
    private int nefrop;
    private int eam;
    private int avc;
    private int fumador;
    private int lipid;
    private String username = null;
    private int registo;

    public void setUtenteNumber(int un) {
            utentenumber = un;
    }
    public void setDataConsulta(Date n) {
            dataconsulta = n;
    }
    public void setTipo_diabetes(String un) {
            tipodiab = un;
    }
    public void setDataDiag(Date n) {
            datadiag = n;
    }
    public void setInsulina(int i) {
            insulina = i;
    }
    public void setAntecedentes(int a) {
            antecedentes = a;
    }
    public void setNeurop(int n) {
            neurop = n;
    }
    public void setRetinop(int r) {
            retinop = r;
    }
    public void setNefrop(int nf) {
           nefrop = nf;
    }
    public void setEam(int e) {
            eam = e;
    }
    public void setAvc(int av) {
            avc = av;
    }
    public void setFuma(int f) {
            fumador = f;
    }
    public void setLipid(int l) {
            lipid = l;
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
    public String getTipo_diabetes() {
            return tipodiab;
    }
    public Date getDataDiag() {
            return datadiag;
    }
    public int getInsulina() {
            return insulina;
    }
    public int getAntecedentes() {
            return antecedentes;
    }
    public int getNeurop() {
            return  neurop;
    }
    public int getRetinop() {
            return retinop;
    }
    public int getNefrop() {
            return nefrop;
    } 
    public int getEam() {
            return eam;
    }
    public int getAvc() {
            return avc;
    }
    public int getFuma() {
            return fumador;
    }
    public int getLipid() {
            return lipid;
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
            String query = "INSERT INTO primeira_consulta( ut_number, data_consulta, tip_diabetes, data_diag, insulina, antecedentes, neurop, retinop, nefrop, eam, avc, fumador, perf_lipidico, username) "
                    + "VALUES("+utentenumber+",'"+dataconsulta+"','"+tipodiab+"','"+datadiag+"',"+insulina+","+antecedentes+","+neurop+","+retinop+","+nefrop+","+eam+","+avc+","+fumador+","+lipid+",'"+username+"');\n";
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
