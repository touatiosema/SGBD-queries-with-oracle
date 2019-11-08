import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;

public class Joker {
  public static void main(String[] args)
      throws SQLException, ClassNotFoundException, java.io.IOException {
    // Preparation de la connexion. 
    OracleDataSource ods = new OracleDataSource();
    ods.setUser("user");
    ods.setPassword("password");
    // URL de connexion, on remarque que le pilote utilise est "thin".
    ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");

    Connection conn = null;
    // Requete parametree.
    PreparedStatement pstmt1 = null;
    try {
      conn = ods.getConnection();
      // Execution et affichage de la requete parametree pour ? (joker) allant
      // de 1 à 10.
      for (int i = 1; i <= 10; i++) {
        pstmt1 = conn.prepareStatement("select TITRE_FILM, DUREE from FILM "
    	                                + "where NUMERO_FILM = ?");
        pstmt1.setInt(1, i);
        ResultSet rset = pstmt1.executeQuery();
        while (rset.next()) {
        System.out.println("Le film " + rset.getString(1) + " dure " 
                           + rset.getFloat(2) + " minutes.");
        }
      }
    }
    finally {
      if (pstmt1 != null) {
	pstmt1.close();
      }
      if (conn != null) {
	conn.close();
      }
    }
  }
}
