import java.util.Scanner;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Main {
    public static void main(String[] args) {
        Connection connection=null;
        Statement statement =null;
        try{
           String url="jdbc:postgresql://127.0.0.1:5432/postgis";
           String user="postgres";
           String password = "l67266380";
           Class.forName("org.postgresql.Driver");
           connection= DriverManager.getConnection(url, user, password);
           System.out.println("是否成功连接pg数据库"+connection);
           statement=connection.createStatement();
        }catch(Exception e){
            throw new RuntimeException(e);
        }finally{
            try{
                statement.close();
            }
            catch(SQLException e){
                e.printStackTrace();
                throw new RuntimeException(e);
            }finally{
                try{
                    connection.close();
                }
                catch(SQLException e){
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }
            }
        }

    }
}
