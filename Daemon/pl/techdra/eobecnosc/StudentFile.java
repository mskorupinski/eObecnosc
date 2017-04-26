package pl.techdra.eobecnosc;

/**
 * Created by Kuba on 29.03.2017.
 */
public class StudentFile {
    private String FirstName;
    private String SecondName;
    private String Surname;
    private String PESEL;
    private String Index;

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String firstName) {
        FirstName = firstName;
    }

    public String getSecondName() {
        return SecondName;
    }

    public void setSecondName(String secondName) {
        SecondName = secondName;
    }

    public String getSurname() {
        return Surname;
    }

    public void setSurname(String surname) {
        Surname = surname;
    }

    public String getPESEL() {
        return PESEL;
    }

    public void setPESEL(String PESEL) {
        this.PESEL = PESEL;
    }

    public String getIndex() {
        return Index;
    }

    public void setIndex(String index) {
        Index = index;
    }

    public String toString() {
        return this.getFirstName() + " " + this.getSurname() + " " + this.getPESEL() + " " + this.getIndex();
    }


}
