import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;

public class Exemple {
  public static void main(String[] args)
    throws SQLException, ClassNotFoundException, java.io.IOException {
    // Preparation de la connexion.
    OracleDataSource ods = new OracleDataSource();
    ods.setUser("otouati");
    ods.setPassword("otouati");

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
      System.out.println("les metadata:"+rset.getMetaData()+'\n'+rset.getMetaData().getColumnCount()+"\n\n");
      while (rset.next()) {
        // Affichage du resultat.
	      System.out.println(rset.getString(1) + " a "
         + rset.getInt(2) + " roles");
      }
      rset = stmt.executeQuery("select * from ACTEUR");
      ResultSetMetaData result_set_meta = rset.getMetaData();
      System.out.println("there are "+rset.getMetaData().getColumnCount()+"columns");
      for (int i = 0 ; i<result_set_meta.getColumnCount(); i++){
        System.out.println("le column num. "+ i+ "est" +result_set_meta.getColumnName(i) + "son type est " + result_set_meta.getColumnTypeName(i));
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
