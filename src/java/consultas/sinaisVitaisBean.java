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
public class sinaisVitaisBean implements Serializable {
    
    private int utentenumber;
    private Date dataconsulta = null;
    private int pulso;
    private int parterial;
    private int rresp;
    private int temp;
    private int spo2;
    private int dor;
    private int peso;
    private int pabdominal;
    private int altura;
    private int bmi;
    private int exercicio;
    private int cfv;
    private int tabaco;
    private String username = null;
    private int registo;
    
    public void setUtenteNumber(int un) {
            utentenumber = un;
    }
    public void setDataConsulta(Date n) {
            dataconsulta = n;
    }
    public void setPulso(int p) {
            pulso = p;
    }
    public void setParterial(int pa) {
            parterial = pa;
    }
    public void setRresp(int r) {
            rresp = r;
    }
    public void setTemp(int t) {
            temp = t;
    }
    public void setSpo2(int s) {
            spo2 = s;
    }
    public void setDor(int d) {
            dor = d;
    }
    public void setPeso(int pe) {
           peso = pe;
    }
    public void setPabdominal(int pab) {
            pabdominal = pab;
    }
    public void setAltura(int a) {
            altura = a;
    }
    /*public void setBmi(int b) {
            bmi = b;
    }*/
    public void setExercicio(int e) {
            exercicio = e;
    }
    public void setCfv(int c) {
            cfv = c;
    }
    public void setTabaco(int t) {
            tabaco = t;
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
    public int getPulso() {
            return pulso;
    }
    public int getParterial() {
            return parterial;
    }
    public int getRresp() {
            return rresp;
    }
    public int getTemp() {
            return temp;
    }
    public int getSpo2() {
            return  spo2;
    }
    public int getDor() {
            return dor;
    }
    public int getPeso() {
            return peso;
    } 
    public int getPabdominal() {
            return pabdominal;
    }
    public int getAltura() {
            return altura;
    }
    /*public int getBmi() {
            return bmi;
    }*/
    public int getExercicio() {
            return exercicio;
    }
    public int getCfv() {
            return cfv;
    }
    public int getTabaco() {
            return tabaco;
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

    
    //CALCULAR BMI
    private int calculaBmi(){ 
    bmi = ((peso)/(altura * altura));
    return bmi;
    }
    
    //INSERT QUERY
    
    private String getInsertQuery() {
            String query = "INSERT INTO sinais_vitais( ut_number , data_consulta, pulso, parterial, freq_resp, temp, spo2, dor, peso, altura, bmi, p_adominal, exercico, cfv, hab_tabag, username) "
                    + "VALUES(" +utentenumber+",'"+dataconsulta+"',"+pulso+","+parterial+","+rresp+","+temp+","+spo2+","+dor+","+peso+","+altura+","+bmi+","+pabdominal+","+exercicio+","+cfv+","+tabaco+",'"+username+"');\n";
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
