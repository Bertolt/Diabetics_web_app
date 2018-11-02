<<<<<<< HEAD
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registoUser;

import java.sql.*;
import java.io.Serializable;
import java.util.*;

public class registoUserBean implements Serializable {
	
    private int usernumber;
    private String username = null;
    private String nome = null;
    private String telefone = null;
    private String email = null;
    private String morada = null;
    private String password = null;
    private int nivel;
    private java.sql.Date data_reg = null;
    private int registo;

    public void setUsernumber(int un) {
            usernumber = un;
    }
    public void setUsername(String un) {
            username = un;
    }
    public void setPassword(String pw) {
            password = pw;
    }
    public void setNome(String n) {
            nome = n;
    }
    public void setTelefone(String t) {
            telefone = t;
    }
    public void setEmail(String e) {
            email = e;
    }
    public void setMorada(String m) {
            morada = m;
    }
    public void setNivel(int a) {
            nivel = a;
    }
    public void setDataRegisto(java.sql.Date dr) {
            data_reg = dr;
    }
    
    public int getUsernumber() {
            return usernumber;
    }
    public String getUsername() {
            return username;
    }
    public String getPassword() {
            return password;
    }
    public String getNome() {
            return nome;
    }
    public String getEmail() {
            return email;
    }
    public String getTelefone() {
            return telefone;
    }
    public String getMorada() {
            return  morada;
    }
    public int getNivel() {
            return nivel;
    } 
    public java.sql.Date getDataRegisto() {
            return data_reg;
    }
    
    
    //INSERIR
    public void setDBRecord() {
            try {
                    if( updateDB(getInsertQueryRegisto()) != -1 ){
                        updateDB(getInsertQueryLogin());
                    }
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
    }

    //INSERT QUERY
    
    private String getInsertQueryRegisto() {
            System.out.println(password);
            String query = "INSERT INTO registo_user( nome, email, telefone, morada, data_reg, username) VALUES('"+nome+"','"+email+"',"+telefone+",'"+morada+"','"+data_reg+"','"+username+"');\n";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    private String getInsertQueryLogin() {
            String query = "INSERT INTO login(user_number, password) VALUES( (SELECT  user_number FROM registo_user WHERE username = '"+username+"'),'"+password+"');\n";
            System.out.println("getInsertLoginQuery: " + query+"\n----------");
            return query;
    }
    private int updateDB(String cmd) throws Exception {
		try{
			String bd ="jdbc:mysql://localhost:3306/diabetes?user=root&password=";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection(bd);
			Statement s = conn.createStatement();
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
    //Pesquisar Utilizadores
    public Vector getUserDBRecords() {
		Vector records = new Vector();
		
		try { 
			records = queryDB(getSelectQueryPesquisaUser());
		} catch (Exception e){ 
			e.printStackTrace(); 
		}
		return records;
	}
    
    private String getSelectQueryPesquisaUser() {
		StringBuffer query = new StringBuffer();
		query.append("SELECT * FROM registo_user WHERE ");
		
                if (nome != null )
                    if (query.toString().endsWith("WHERE "))
				query.append("nome='"+nome+"'");
			else 
				query.append("  nome='"+nome+"'");
                if (usernumber != 0 )
                    if (query.toString().endsWith("WHERE "))
				query.append("telefone=" +usernumber+ "");
			else 
				query.append("  nome='"+nome+"'");                    
		if (morada != null )
                    if (query.toString().endsWith("WHERE "))
				query.append("morada='"+morada+"'");
			else 
				query.append(" AND morada='"+morada+"'");
		if (telefone != null )
                    if (query.toString().endsWith("WHERE "))
				query.append("telefone='"+telefone+"'");
			else 
				query.append(" AND telefone='"+telefone+"'");
		if( email != null )
                    if (query.toString().endsWith("WHERE "))
				query.append("email = '"+email+"' ");
			else 
				query.append(" AND email = '"+email+"' " );
		query.append(";"); 
		return query.toString();
	}
    //LISTAGEM PEDIDOS 
    public Vector getDBRecords() {
		Vector records = new Vector();
		
		try { 
			records = queryDB(getSelectQuery());
		} catch (Exception e){ 
			e.printStackTrace(); 
		}
		return records;
	}
    
    private String getSelectQuery() {
		StringBuffer query = new StringBuffer();
		query.append("SELECT * FROM registo_user WHERE nivel = '0' ");
		query.append(";"); 
		return query.toString();
	}
    
    private Vector queryDB(String cmd) throws Exception {
		String bd ="jdbc:mysql://localhost:3306/diabetes?user=root&password=";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = DriverManager.getConnection(bd);
		Statement s = conn.createStatement();
		System.out.println(cmd);
		ResultSet rs = s.executeQuery(cmd);
		Vector ulizadores = getUlizadores(rs);
		rs.close();
		s.close ();
		conn.close();
		return ulizadores;
	}
    
    private Vector getUlizadores (ResultSet rs) throws Exception {
		Vector ulizadores = new Vector();
		while (rs.next()) {
                        registoUserBean utilizadorbean = new registoUserBean();
                        utilizadorbean.setUsernumber(rs.getInt("user_number"));
                        System.out.println(utilizadorbean.usernumber);
                        utilizadorbean.setNome(rs.getString("nome"));
                        System.out.println(utilizadorbean.nome);
                        utilizadorbean.setEmail(rs.getString("email"));
                        System.out.println(utilizadorbean.email);
                        utilizadorbean.setTelefone(rs.getString("telefone"));
                        System.out.println(utilizadorbean.telefone);
                        utilizadorbean.setMorada(rs.getString("morada"));
                        System.out.println(utilizadorbean.morada);
                        utilizadorbean.setDataRegisto(rs.getDate("data_reg"));
                        System.out.println(utilizadorbean.data_reg);

			ulizadores.addElement(utilizadorbean);
		}
		return ulizadores;
	}
    
    //ADICIONAR UTILIZADOR
    public boolean adicionarUser() {
            try {
                System.out.println(usernumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryAdicionar());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryAdicionar() {
            
            String query = "UPDATE registo_user SET nivel='1' WHERE user_number ="+usernumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
     //ADICIONAR Admin
    public boolean adicionarAdmin(){
            try {
                System.out.println(usernumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryAddAdmin());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryAddAdmin() {
            
            String query = "UPDATE registo_user SET nivel='2' WHERE user_number ="+usernumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    
}
=======
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registoUser;

import java.sql.*;
import java.io.Serializable;
import java.util.*;

public class registoUserBean implements Serializable {
	
    private int usernumber;
    private String username = null;
    private String nome = null;
    private String telefone = null;
    private String email = null;
    private String morada = null;
    private String password = null;
    private int nivel;
    private java.sql.Date data_reg = null;
    private int registo;

    public void setUsernumber(int un) {
            usernumber = un;
    }
    public void setUsername(String un) {
            username = un;
    }
    public void setPassword(String pw) {
            password = pw;
    }
    public void setNome(String n) {
            nome = n;
    }
    public void setTelefone(String t) {
            telefone = t;
    }
    public void setEmail(String e) {
            email = e;
    }
    public void setMorada(String m) {
            morada = m;
    }
    public void setNivel(int a) {
            nivel = a;
    }
    public void setDataRegisto(java.sql.Date dr) {
            data_reg = dr;
    }
    
    public int getUsernumber() {
            return usernumber;
    }
    public String getUsername() {
            return username;
    }
    public String getPassword() {
            return password;
    }
    public String getNome() {
            return nome;
    }
    public String getEmail() {
            return email;
    }
    public String getTelefone() {
            return telefone;
    }
    public String getMorada() {
            return  morada;
    }
    public int getNivel() {
            return nivel;
    } 
    public java.sql.Date getDataRegisto() {
            return data_reg;
    }
    
    
    //INSERIR
    public void setDBRecord() {
            try {
                    if( updateDB(getInsertQueryRegisto()) != -1 ){
                        updateDB(getInsertQueryLogin());
                    }
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
    }

    //INSERT QUERY
    
    private String getInsertQueryRegisto() {
            System.out.println(password);
            String query = "INSERT INTO registo_user( nome, email, telefone, morada, data_reg, username) VALUES('"+nome+"','"+email+"',"+telefone+",'"+morada+"','"+data_reg+"','"+username+"');\n";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    private String getInsertQueryLogin() {
            String query = "INSERT INTO login(user_number, password) VALUES( (SELECT  user_number FROM registo_user WHERE username = '"+username+"'),'"+password+"');\n";
            System.out.println("getInsertLoginQuery: " + query+"\n----------");
            return query;
    }
    private int updateDB(String cmd) throws Exception {
		try{
			String bd ="jdbc:mysql://localhost:3306/diabetes?user=root&password=";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection(bd);
			Statement s = conn.createStatement();
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
    //Pesquisar Utilizadores
    public Vector getUserDBRecords() {
		Vector records = new Vector();
		
		try { 
			records = queryDB(getSelectQueryPesquisaUser());
		} catch (Exception e){ 
			e.printStackTrace(); 
		}
		return records;
	}
    
    private String getSelectQueryPesquisaUser() {
		StringBuffer query = new StringBuffer();
		query.append("SELECT * FROM registo_user WHERE ");
		
                if (nome != null )
                    if (query.toString().endsWith("WHERE "))
				query.append("nome='"+nome+"'");
			else 
				query.append("  nome='"+nome+"'");
                if (usernumber != 0 )
                    if (query.toString().endsWith("WHERE "))
				query.append("telefone=" +usernumber+ "");
			else 
				query.append("  nome='"+nome+"'");                    
		if (morada != null )
                    if (query.toString().endsWith("WHERE "))
				query.append("morada='"+morada+"'");
			else 
				query.append(" AND morada='"+morada+"'");
		if (telefone != null )
                    if (query.toString().endsWith("WHERE "))
				query.append("telefone='"+telefone+"'");
			else 
				query.append(" AND telefone='"+telefone+"'");
		if( email != null )
                    if (query.toString().endsWith("WHERE "))
				query.append("email = '"+email+"' ");
			else 
				query.append(" AND email = '"+email+"' " );
		query.append(";"); 
		return query.toString();
	}
    //LISTAGEM PEDIDOS 
    public Vector getDBRecords() {
		Vector records = new Vector();
		
		try { 
			records = queryDB(getSelectQuery());
		} catch (Exception e){ 
			e.printStackTrace(); 
		}
		return records;
	}
    
    private String getSelectQuery() {
		StringBuffer query = new StringBuffer();
		query.append("SELECT * FROM registo_user WHERE nivel = '0' ");
		query.append(";"); 
		return query.toString();
	}
    
    private Vector queryDB(String cmd) throws Exception {
		String bd ="jdbc:mysql://localhost:3306/diabetes?user=root&password=";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = DriverManager.getConnection(bd);
		Statement s = conn.createStatement();
		System.out.println(cmd);
		ResultSet rs = s.executeQuery(cmd);
		Vector ulizadores = getUlizadores(rs);
		rs.close();
		s.close ();
		conn.close();
		return ulizadores;
	}
    
    private Vector getUlizadores (ResultSet rs) throws Exception {
		Vector ulizadores = new Vector();
		while (rs.next()) {
                        registoUserBean utilizadorbean = new registoUserBean();
                        utilizadorbean.setUsernumber(rs.getInt("user_number"));
                        System.out.println(utilizadorbean.usernumber);
                        utilizadorbean.setNome(rs.getString("nome"));
                        System.out.println(utilizadorbean.nome);
                        utilizadorbean.setEmail(rs.getString("email"));
                        System.out.println(utilizadorbean.email);
                        utilizadorbean.setTelefone(rs.getString("telefone"));
                        System.out.println(utilizadorbean.telefone);
                        utilizadorbean.setMorada(rs.getString("morada"));
                        System.out.println(utilizadorbean.morada);
                        utilizadorbean.setDataRegisto(rs.getDate("data_reg"));
                        System.out.println(utilizadorbean.data_reg);

			ulizadores.addElement(utilizadorbean);
		}
		return ulizadores;
	}
    
    //ADICIONAR UTILIZADOR
    public boolean adicionarUser() {
            try {
                System.out.println(usernumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryAdicionar());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryAdicionar() {
            
            String query = "UPDATE registo_user SET nivel='1' WHERE user_number ="+usernumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
     //ADICIONAR Admin
    public boolean adicionarAdmin(){
            try {
                System.out.println(usernumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryAddAdmin());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryAddAdmin() {
            
            String query = "UPDATE registo_user SET nivel='2' WHERE user_number ="+usernumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    
}
>>>>>>> cd4a4f5d9b07d9896ad7c51d49dd9bb9ad4ed2df
