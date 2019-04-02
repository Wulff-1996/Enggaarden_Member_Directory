package enggaarden.app.models.interfaces;

import org.springframework.jdbc.support.rowset.SqlRowSet;

/*
Lavet af alle
*/

public interface StatisticRepositoryInterface
{
    SqlRowSet get();
    double getSum();
}