package enggaarden.app.models.interfaces;

import enggaarden.app.models.Entities.Member;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.Date;

/*
Lavet af alle
*/

public interface SubLogRepositoryInterface
{
    SqlRowSet getSubLogs();
    void post(Date date, Member member, String username);
    void clearLog();
}
