import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;

public class Exemple {
  public static void main(String[] args)
    throws SQLException, ClassNotFoundException, java.io.IOException {
    // Preparation de la connexion.
    OracleDataSource ods = new OracleDataSource();
    ods.setUser("user");
    ods.setPassword("password");
    // URL de connexion, on remarque que le pilote utilise est "thin".
    ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");

    Connection conn = null;
    Statement stmt = null;
    try {
      conn = ods.getConnection();
      stmt = conn.createStatement();
      // Execution de la requete.
      ResultSet rset = stmt.executeQuery("select A.NOM_ACTEUR, count(*) " 
					 + "from ACTEUR A, ROLE RO "
					 + "where A.NUMERO_ACTEUR = RO.NUMERO_ACTEUR "
					 + "group by A.NOM_ACTEUR");

      while (rset.next()) {
        // Affichage du resultat.
	System.out.println(rset.getString(1) + " a "
			   + rset.getInt(2) + " roles");
      }
    }
    finally {
      if (stmt != null) {
	stmt.close();
      }
      if (conn != null) {
	conn.close();
      }
    }
  }
}
