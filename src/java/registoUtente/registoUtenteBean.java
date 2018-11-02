<<<<<<< HEAD
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registoUtente;

import java.sql.*;
import java.io.Serializable;
import java.util.*;
/**
 *
 * @author Ruben
 */
public class registoUtenteBean implements Serializable {
    
    private int utentenumber;
    private String nome = null;
    private String telefone = null;
    private String email = null;
    private String morada = null;
    private java.sql.Date datanasc = null;
    private Boolean sexo = null;
    private java.sql.Date data_reg_ut = null;
    private java.sql.Date dataproxconsulta = null;
    private String username = null;
    private int alta = 0;
    private int registo;
    
    
    public void setUtenteNumber(int un) {
            utentenumber = un;
    }
    public void setUsername(String un) {
            username = un;
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
    public void setDataNasc(java.sql.Date dn) {
            datanasc = dn;
    }
    public void setSexo(Boolean s) {
            sexo = s;
    }
    public void setDataRegistoUtente(java.sql.Date dru) {
            data_reg_ut = dru;
    }
    public void setDataProxConsulta(java.sql.Date  dpc) {
            dataproxconsulta = dpc;
    }
    public void setAlta(int a) {
            alta = a;
    }
    
    public int getUtenteNumber() {
            return utentenumber;
    }
    public String getUsername() {
            return username;
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
    public java.sql.Date getDataNasc() {
           return datanasc;
    }
    public Boolean getSexo() {
            return sexo;
    }
    public java.sql.Date  getDataRegistoUtente() {
            return data_reg_ut;
    }
    public java.sql.Date  getDataProxConsulta() {
            return dataproxconsulta;
    }
    public int getAlta() {
            return alta;
    }
    
    
    //INSERIR
    public boolean setDBRecord() {
            try {
                System.out.println(utentenumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryRegisto());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }

    //INSERT QUERY
    
    private String getInsertQueryRegisto() {
            
            String query = "INSERT INTO registo_utente ( nome, morada, telefone, email, data_nasc, sexo, data_reg_ut, data_prox_consulta, username) "
                    + "VALUES('"+nome+"','"+morada+"',"+telefone+",'"+email+"','"+datanasc+"',"+sexo+",'"+data_reg_ut+"',"+dataproxconsulta+",'"+username+"');\n";
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
    
    public boolean verificaNumeroUtente() {
           try {
           //ligação a registo_user para obter o user_number a partir do username
           String resource = "jdbc:mysql://localhost:3306/diabetes?user=root&password=";
           Class.forName ("com.mysql.jdbc.Driver").newInstance();
           Connection conn = DriverManager.getConnection (resource);
           java.sql.Statement s = conn.createStatement ();
           String cmd = "SELECT * FROM registo_utente WHERE ut_number ="+utentenumber+";";
           System.out.println(cmd);
           ResultSet rs = s.executeQuery(cmd);
               if (rs.next())alta = rs.getInt("alta");
               {
                   if(alta == 0)
                   {
                       setUtenteNumber(0);
                   }
                   else
                   {
                       setNome(rs.getString("nome"));
                       System.out.println(nome);
                       setUtenteNumber(rs.getInt("ut_number"));
                       System.out.println("aqui" +utentenumber);
                   }
               }    
           s.close ();
           conn.close();

           } catch (ClassNotFoundException e){ e.printStackTrace(); } catch (InstantiationException e) {
               e.printStackTrace();
           } catch (IllegalAccessException e) {
               e.printStackTrace();
           } catch (SQLException e) {
               e.printStackTrace();
           }

           return (alta == 0 ? false : true);
      }
    //EDIÇAO DADOS
    public boolean editarDados() {
            try {
                System.out.println(utentenumber);
                registo = updateDB(getInsertSelectQueryEdicao());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertSelectQueryEdicao() {
            StringBuffer query = new StringBuffer();
		query.append("UPDATE registo_utente SET ");
		
                if (nome != null )
                    if (query.toString().endsWith("SET "))
				query.append("nome='"+nome+"'");
			else 
				query.append("  nome='"+nome+"'");                
		if (morada != null )
                    if (query.toString().endsWith("SET "))
				query.append("morada='"+morada+"'");
			else 
				query.append(" , morada='"+morada+"'");
		if (telefone != null )
                    if (query.toString().endsWith("SET "))
				query.append("telefone='"+telefone+"'");
			else 
				query.append(" , telefone='"+telefone+"'");
		if( email != null )
                    if (query.toString().endsWith("SET "))
				query.append("email = '"+email+"' ");
			else 
				query.append(" , email = '"+email+"' " );
                
		query.append("WHERE ut_number ='"+utentenumber+"';"); 
                System.out.println("getInsertQuery: " + query+"\n----------");
		return query.toString();
    }
    public void resetDados() {
           nome = null;
           morada = null;
           telefone = null;
           email = null;
   } 
    //ALTA
    public boolean darAlta() {
            try {
                System.out.println(utentenumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryAlta());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryAlta() {
            
            String query = "UPDATE registo_utente SET alta='0' WHERE ut_number ="+utentenumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    //READMISSAO
    public boolean darReadmissao() {
            try {
                System.out.println(utentenumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryReadmissao());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryReadmissao() {
            
            String query = "UPDATE registo_utente SET alta='1' WHERE ut_number ="+utentenumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    //MARCAR CONSULTA
    public boolean marcarConsulta() {
            try {
                System.out.println(utentenumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryConsulta());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryConsulta() {
            
            String query = "UPDATE registo_utente SET data_prox_consulta ='"+dataproxconsulta+"' WHERE ut_number ="+utentenumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    
    //PESQUISAR
   
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
		query.append("SELECT * FROM registo_utente WHERE nome = '"+nome+"' ");
		
		if (morada != null )
			query.append(" AND registo_utente.morada='"+morada+"'");
				
		if (telefone != null )
			query.append(" AND registo_utente.telefone='"+telefone+"'");
		if( email != null )
			query.append(" AND registo_utente.email LIKE '"+email+"'" );

		if( datanasc != null )
			query.append(" AND registo_utente.data_nasc='"+datanasc+"' ");
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
		Vector utentes = getUtentes(rs);
		rs.close();
		s.close ();
		conn.close();
		return utentes;
	}
    
    private Vector getUtentes (ResultSet rs) throws Exception {
		Vector utentes = new Vector();
		while (rs.next()) {
                        registoUtenteBean utentebean = new registoUtenteBean();
                        utentebean.setNome(rs.getString("nome"));
                        System.out.println(utentebean.nome);
                        utentebean.setUtenteNumber(rs.getInt("ut_number"));
                        System.out.println(utentebean.utentenumber);
                        utentebean.setDataNasc(rs.getDate("data_nasc"));
                        System.out.println(utentebean.datanasc);
                        utentebean.setMorada(rs.getString("morada"));
                        System.out.println(utentebean.morada);
			utentebean.setTelefone(rs.getString("telefone"));
                        System.out.println(utentebean.telefone);
                        utentebean.setEmail(rs.getString("email"));
                        System.out.println(utentebean.email);
			utentes.addElement(utentebean);
		}
		return utentes;
	}
    public void reset() {
           username = null;
           utentenumber = 0;
           System.out.println("resetou");

   }   
}
=======
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registoUtente;

import java.sql.*;
import java.io.Serializable;
import java.util.*;
/**
 *
 * @author Ruben
 */
public class registoUtenteBean implements Serializable {
    
    private int utentenumber;
    private String nome = null;
    private String telefone = null;
    private String email = null;
    private String morada = null;
    private java.sql.Date datanasc = null;
    private Boolean sexo = null;
    private java.sql.Date data_reg_ut = null;
    private java.sql.Date dataproxconsulta = null;
    private String username = null;
    private int alta = 0;
    private int registo;
    
    
    public void setUtenteNumber(int un) {
            utentenumber = un;
    }
    public void setUsername(String un) {
            username = un;
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
    public void setDataNasc(java.sql.Date dn) {
            datanasc = dn;
    }
    public void setSexo(Boolean s) {
            sexo = s;
    }
    public void setDataRegistoUtente(java.sql.Date dru) {
            data_reg_ut = dru;
    }
    public void setDataProxConsulta(java.sql.Date  dpc) {
            dataproxconsulta = dpc;
    }
    public void setAlta(int a) {
            alta = a;
    }
    
    public int getUtenteNumber() {
            return utentenumber;
    }
    public String getUsername() {
            return username;
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
    public java.sql.Date getDataNasc() {
           return datanasc;
    }
    public Boolean getSexo() {
            return sexo;
    }
    public java.sql.Date  getDataRegistoUtente() {
            return data_reg_ut;
    }
    public java.sql.Date  getDataProxConsulta() {
            return dataproxconsulta;
    }
    public int getAlta() {
            return alta;
    }
    
    
    //INSERIR
    public boolean setDBRecord() {
            try {
                System.out.println(utentenumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryRegisto());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }

    //INSERT QUERY
    
    private String getInsertQueryRegisto() {
            
            String query = "INSERT INTO registo_utente ( nome, morada, telefone, email, data_nasc, sexo, data_reg_ut, data_prox_consulta, username) "
                    + "VALUES('"+nome+"','"+morada+"',"+telefone+",'"+email+"','"+datanasc+"',"+sexo+",'"+data_reg_ut+"',"+dataproxconsulta+",'"+username+"');\n";
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
    
    public boolean verificaNumeroUtente() {
           try {
           //ligação a registo_user para obter o user_number a partir do username
           String resource = "jdbc:mysql://localhost:3306/diabetes?user=root&password=";
           Class.forName ("com.mysql.jdbc.Driver").newInstance();
           Connection conn = DriverManager.getConnection (resource);
           java.sql.Statement s = conn.createStatement ();
           String cmd = "SELECT * FROM registo_utente WHERE ut_number ="+utentenumber+";";
           System.out.println(cmd);
           ResultSet rs = s.executeQuery(cmd);
               if (rs.next())alta = rs.getInt("alta");
               {
                   if(alta == 0)
                   {
                       setUtenteNumber(0);
                   }
                   else
                   {
                       setNome(rs.getString("nome"));
                       System.out.println(nome);
                       setUtenteNumber(rs.getInt("ut_number"));
                       System.out.println("aqui" +utentenumber);
                   }
               }    
           s.close ();
           conn.close();

           } catch (ClassNotFoundException e){ e.printStackTrace(); } catch (InstantiationException e) {
               e.printStackTrace();
           } catch (IllegalAccessException e) {
               e.printStackTrace();
           } catch (SQLException e) {
               e.printStackTrace();
           }

           return (alta == 0 ? false : true);
      }
    //EDIÇAO DADOS
    public boolean editarDados() {
            try {
                System.out.println(utentenumber);
                registo = updateDB(getInsertSelectQueryEdicao());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertSelectQueryEdicao() {
            StringBuffer query = new StringBuffer();
		query.append("UPDATE registo_utente SET ");
		
                if (nome != null )
                    if (query.toString().endsWith("SET "))
				query.append("nome='"+nome+"'");
			else 
				query.append("  nome='"+nome+"'");                
		if (morada != null )
                    if (query.toString().endsWith("SET "))
				query.append("morada='"+morada+"'");
			else 
				query.append(" , morada='"+morada+"'");
		if (telefone != null )
                    if (query.toString().endsWith("SET "))
				query.append("telefone='"+telefone+"'");
			else 
				query.append(" , telefone='"+telefone+"'");
		if( email != null )
                    if (query.toString().endsWith("SET "))
				query.append("email = '"+email+"' ");
			else 
				query.append(" , email = '"+email+"' " );
                
		query.append("WHERE ut_number ='"+utentenumber+"';"); 
                System.out.println("getInsertQuery: " + query+"\n----------");
		return query.toString();
    }
    public void resetDados() {
           nome = null;
           morada = null;
           telefone = null;
           email = null;
   } 
    //ALTA
    public boolean darAlta() {
            try {
                System.out.println(utentenumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryAlta());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryAlta() {
            
            String query = "UPDATE registo_utente SET alta='0' WHERE ut_number ="+utentenumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    //READMISSAO
    public boolean darReadmissao() {
            try {
                System.out.println(utentenumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryReadmissao());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryReadmissao() {
            
            String query = "UPDATE registo_utente SET alta='1' WHERE ut_number ="+utentenumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    //MARCAR CONSULTA
    public boolean marcarConsulta() {
            try {
                System.out.println(utentenumber);
                System.out.println(nome);
                registo = updateDB(getInsertQueryConsulta());
            } catch (Exception e){ 
                    e.printStackTrace(); 
            }
            return (registo != 1 ? false : true);
    }
    private String getInsertQueryConsulta() {
            
            String query = "UPDATE registo_utente SET data_prox_consulta ='"+dataproxconsulta+"' WHERE ut_number ="+utentenumber+";";
            System.out.println("getInsertQuery: " + query+"\n----------");
            return query;
    }
    
    //PESQUISAR
   
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
		query.append("SELECT * FROM registo_utente WHERE nome = '"+nome+"' ");
		
		if (morada != null )
			query.append(" AND registo_utente.morada='"+morada+"'");
				
		if (telefone != null )
			query.append(" AND registo_utente.telefone='"+telefone+"'");
		if( email != null )
			query.append(" AND registo_utente.email LIKE '"+email+"'" );

		if( datanasc != null )
			query.append(" AND registo_utente.data_nasc='"+datanasc+"' ");
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
		Vector utentes = getUtentes(rs);
		rs.close();
		s.close ();
		conn.close();
		return utentes;
	}
    
    private Vector getUtentes (ResultSet rs) throws Exception {
		Vector utentes = new Vector();
		while (rs.next()) {
                        registoUtenteBean utentebean = new registoUtenteBean();
                        utentebean.setNome(rs.getString("nome"));
                        System.out.println(utentebean.nome);
                        utentebean.setUtenteNumber(rs.getInt("ut_number"));
                        System.out.println(utentebean.utentenumber);
                        utentebean.setDataNasc(rs.getDate("data_nasc"));
                        System.out.println(utentebean.datanasc);
                        utentebean.setMorada(rs.getString("morada"));
                        System.out.println(utentebean.morada);
			utentebean.setTelefone(rs.getString("telefone"));
                        System.out.println(utentebean.telefone);
                        utentebean.setEmail(rs.getString("email"));
                        System.out.println(utentebean.email);
			utentes.addElement(utentebean);
		}
		return utentes;
	}
    public void reset() {
           username = null;
           utentenumber = 0;
           System.out.println("resetou");

   }   
}
>>>>>>> cd4a4f5d9b07d9896ad7c51d49dd9bb9ad4ed2df
