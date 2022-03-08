import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexioBD {

    private static Connection connexioBD = null;


    /**
     * 
     * @param: Connexio a la base de dades
     * 
     */
    public void connexio() {

        String servidor = "jdbc:mysql://localhost:3306/";
        String usuari = "root";
        String passwd = "client";
        String bbdd = "projecte2dam";

        try {
            connexioBD = DriverManager.getConnection(servidor + bbdd, usuari, passwd);
            System.out.println("Connexió amb èxit");

        } catch (SQLException e) {
            System.out.println("no funciona la connexio");
            e.printStackTrace();
        }
    }

    public static Connection getConnexioBD() {
        return connexioBD;
    }

    public void tancarConnexioBD() throws SQLException {
        connexioBD.close();
    }

}
