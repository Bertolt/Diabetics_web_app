<<<<<<< HEAD
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.

 */
package loginUser;


import java.io.Serializable;
import java.sql.*;



/**
 *
 * @author Ruben
 */
public class loginUserBean implements Serializable {

    private String username = null;
    private String password = null;
    private int usernumber;
    private int nivel = -1;

    public void setUsername(String un) {
            username = un;
    }
    public void setPassword(String p) {
            password = p;
    }
    
    public void setUsernumber (int un){
        usernumber=un;
    }

    public String getUsername() {
            return username;
    }
    public String getPassword() {
            return password;
    }
    public int getUsernumber() {
            return usernumber;
    }
    public int getNivel() {
            return nivel;
    }

    public boolean verificaCredenciais() {
        try {
            //ligação a registo_user para obter o user_number a partir do username
        String resource = "jdbc:mysql://localhost:3306/diabetes?user=root&password=";
        Class.forName ("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection (resource);
        Statement s = conn.createStatement ();
        String cmd = "SELECT * FROM registo_user WHERE username ='"+username+"';";
        System.out.println(cmd);
        ResultSet rs = s.executeQuery(cmd);
            if (rs.next())nivel = rs.getInt("nivel");
                if(nivel == 1){
                    setUsernumber(rs.getInt("user_number"));
                }else{
                    setUsernumber('0');
                }
        Statement s2 = conn.createStatement ();
        String cmd2 = "SELECT * FROM login WHERE user_number ='"+usernumber+"' AND password ='"+password+"';";
        System.out.println(cmd2);
        ResultSet rs2 = s2.executeQuery(cmd2);
            if (rs2.next())nivel = rs2.getInt("nivel");        
        s2.close();    
        s.close ();
	conn.close();
        
        } catch (ClassNotFoundException e){ e.printStackTrace(); } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("aqui");
        System.out.println("nivel: " +nivel+ "\n");
        return (nivel <= 0 ? false : true);
   }
   
        public void reset() {
        username = null;
        usernumber = 0;
        password = null;
        nivel = -1;
        System.out.println("resetou");

}
}

=======
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.

 */
package loginUser;


import java.io.Serializable;
import java.sql.*;



/**
 *
 * @author Ruben
 */
public class loginUserBean implements Serializable {

    private String username = null;
    private String password = null;
    private int usernumber;
    private int nivel = -1;

    public void setUsername(String un) {
            username = un;
    }
    public void setPassword(String p) {
            password = p;
    }
    
    public void setUsernumber (int un){
        usernumber=un;
    }

    public String getUsername() {
            return username;
    }
    public String getPassword() {
            return password;
    }
    public int getUsernumber() {
            return usernumber;
    }
    public int getNivel() {
            return nivel;
    }

    public boolean verificaCredenciais() {
        try {
            //ligação a registo_user para obter o user_number a partir do username
        String resource = "jdbc:mysql://localhost:3306/diabetes?user=root&password=";
        Class.forName ("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection (resource);
        Statement s = conn.createStatement ();
        String cmd = "SELECT * FROM registo_user WHERE username ='"+username+"';";
        System.out.println(cmd);
        ResultSet rs = s.executeQuery(cmd);
            if (rs.next())nivel = rs.getInt("nivel");
                if(nivel == 1){
                    setUsernumber(rs.getInt("user_number"));
                }else{
                    setUsernumber('0');
                }
        Statement s2 = conn.createStatement ();
        String cmd2 = "SELECT * FROM login WHERE user_number ='"+usernumber+"' AND password ='"+password+"';";
        System.out.println(cmd2);
        ResultSet rs2 = s2.executeQuery(cmd2);
            if (rs2.next())nivel = rs2.getInt("nivel");        
        s2.close();    
        s.close ();
	conn.close();
        
        } catch (ClassNotFoundException e){ e.printStackTrace(); } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("aqui");
        System.out.println("nivel: " +nivel+ "\n");
        return (nivel <= 0 ? false : true);
   }
   
        public void reset() {
        username = null;
        usernumber = 0;
        password = null;
        nivel = -1;
        System.out.println("resetou");

}
}

>>>>>>> cd4a4f5d9b07d9896ad7c51d49dd9bb9ad4ed2df
