package enggaarden.app.models.repositories;

import enggaarden.app.models.Entities.Member;
import enggaarden.app.models.Entities.SubLog;
import enggaarden.app.models.Entities.Subscription;
import enggaarden.app.models.interfaces.SubLogRepositoryInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
Lavet af alle
*/

@Repository
public class SubLogRepository implements SubLogRepositoryInterface
{
    /*
    Fields
     */
    @Autowired
    JdbcTemplate jdbcTemplate;

    // Returns all subLogs from the db for subLogs_overview.html
    @Override
    public SqlRowSet getSubLogs()
    {
        String sql = "SELECT * FROM logView;";

        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);

        return rowSet;
    }

    // Post a new log to the db. (lavet af Jakob)
    @Override
    public void post(Date date, Member member, String username)
    {
        DateFormat correctFormat = new SimpleDateFormat("yyyy-MM-dd");
        String edit;

        // check that only one of the two dates are null
        if (date == null && member.getSubscription().getPayDay() != null ||
                date != null && member.getSubscription().getPayDay() == null)
        {
            // update edit status by subscriptions payDay value
            if (member.getSubscription().getPayDay() == null)
            {
                edit = "Status sat til ikke betalt";
            }
            else
            {
                edit = "Status sat til betalt";
            }

            String sql = "INSERT INTO subLogs " +
                    "VALUES (DEFAULT, '" + edit + "', '" + correctFormat.format(new Date()) +
                    "', " + member.getMemberId() +
                    ", '" + username + "');";

            jdbcTemplate.update(sql);
        }
    }

    // Clears all subLog entries in the db (Lavet af Jakob)
    @Override
    public void clearLog()
    {
        String sql = "DELETE FROM subLogs;";

        jdbcTemplate.update(sql);
    }
}
