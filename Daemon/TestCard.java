/**
 * Created by Kuba on 29.03.2017.
 */
import pl.techdra.eobecnosc.*;

public class TestCard {
    public static void main(String[] args) {
        ELS card = new ELS();
        StudentFile sf = card.ReadData();

        System.out.println(sf);
    }
}
