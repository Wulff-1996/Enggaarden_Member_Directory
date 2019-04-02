package enggaarden.app.models.interfaces;

/*
Lavet af Christian
*/

public interface EmailRepositoryInterface
{
    String emailForPrimary();
    String emailForSecondary();
    String emailForExternal();
    String emailForAll();
    String emailForBoard();
}
