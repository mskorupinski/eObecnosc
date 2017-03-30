package pl.techdra.eobecnosc;


import javax.smartcardio.*;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kuba on 25.03.2017.
 */

public class ELS {
    private static final byte[] SELECT_MF = {(byte) 0x00, (byte) 0xA4, (byte) 0x00, (byte) 0x0C, (byte) 0x02, (byte) 0x3F, (byte) 0x00};
    private static final byte[] SELECT_DF_T0 = {(byte) 0x00, (byte) 0xA4, (byte) 0x04, (byte) 0x00, (byte) 0x07, (byte) 0xD6, (byte) 0x16, (byte) 0x00, (byte) 0x00, (byte) 0x30, (byte) 0x01, (byte) 0x01};
    private static final byte[] SELECT_DF_T1 = {(byte) 0x00, (byte) 0xA4, (byte) 0x04, (byte) 0x04, (byte) 0x07, (byte) 0xD6, (byte) 0x16, (byte) 0x00, (byte) 0x00, (byte) 0x30, (byte) 0x01, (byte) 0x01};
    private static final byte[] SELECT_ELS_T0 = {(byte) 0x00, (byte) 0xA4, (byte) 0x00, (byte) 0x00, (byte) 0x02, (byte) 0x00, (byte) 0x02};
    private static final byte[] SELECT_ELS_T1 = {(byte) 0x00, (byte) 0xA4, (byte) 0x02, (byte) 0x04, (byte) 0x02, (byte) 0x00, (byte) 0x02};
    private static final byte[] READ_ELS = {(byte) 0x00, (byte) 0xB0, (byte) 0x00, (byte) 0x00, (byte) 0xFF};

    private boolean STATUS = true;  //Error flag

    private CardTerminal Terminal;
    private Card StudentCard;
    private CardChannel Channel;


    public ELS(int TerminalIndex) {
        TerminalFactory tf = TerminalFactory.getDefault();
        try {
            this.Terminal = tf.terminals().list().get(TerminalIndex);
        } catch (CardException e) {
            System.err.println("Brak czytnika kart" + e.toString());
        }
    }

    public ELS() {
        this(0);
    }


    private void WaitForCard() {
        try {
            this.Terminal.waitForCardPresent(0);

        } catch (CardException e) {
            this.STATUS = false;
            System.err.println("Błąd karty");
        }
    }

    private void SetCardMode(String Protocol) {
        if (Protocol == null || Protocol.isEmpty()) {
            Protocol = "T=0";   //Set default protocol
        }

        try {
            this.StudentCard = this.Terminal.connect(Protocol);
            this.Channel = this.StudentCard.getBasicChannel();
        } catch (CardException e) {
            if (Protocol.equals("T=0")) {
                SetCardMode("T=1"); //If T="0" doesn't work, try T="1"
            } else {
                this.STATUS = false;
                System.err.println("Błąd połączenia z kartą");
            }
        }
    }

    private byte[] ExecuteCommand(byte[] Command) throws CardException {
        try {
            CommandAPDU comm = new CommandAPDU(Command);
            ResponseAPDU res = this.Channel.transmit(comm);

            return res.getBytes();

        } catch (CardException e) {
            throw e;
        }


    }


    public StudentFile ReadData() {
        StudentFile sf = new StudentFile();

        this.WaitForCard();
        this.SetCardMode(null);

        if (!this.STATUS) {
            return null;
        }

        try {
            this.ExecuteCommand(ELS.SELECT_MF);

            if (this.StudentCard.getProtocol().equals("T=0")) {
                this.ExecuteCommand(ELS.SELECT_DF_T0);
                this.ExecuteCommand(ELS.SELECT_ELS_T0);
            } else {
                this.ExecuteCommand(ELS.SELECT_DF_T1);
                this.ExecuteCommand(ELS.SELECT_ELS_T1);
            }


            byte[] CardData = this.ExecuteCommand(ELS.READ_ELS);
            List<String> res = new ArrayList<String>();
            List<Byte> buffer = new ArrayList<Byte>(); //Buffer

            for (int i = 0; i < CardData.length - 1; i++) {
                int code = (int) CardData[i];
                if ((code == (int) 0x0C) || (code == (int) 0x13) || (code == (int) 0x18)) {
                    byte[] temp = new byte[buffer.size()];
                    for (int j = 0; j < buffer.size(); j++) {
                        temp[j] = buffer.get(j).byteValue();
                    }

                    res.add(new String(temp, Charset.forName("UTF-8")));
                    buffer.clear();
                    i++;
                } else {
                    buffer.add(CardData[i]);
                }

            }

            sf.setSurname(res.get(3).substring(0, res.get(3).indexOf('0') > 0 ? res.get(3).indexOf('0') : res.get(3).length() ));
            sf.setFirstName(res.get(4).substring(0, res.get(4).indexOf('0') > 0 ? res.get(4).indexOf('0') : res.get(4).length()));
            try {
                Integer.parseInt(res.get(5)); //if person has got a second name
                sf.setIndex(res.get(5));
                sf.setPESEL(res.get(7));
            } catch (NumberFormatException e) {
                sf.setSecondName(res.get(5).substring(0, res.get(5).indexOf('0') > 0 ? res.get(5).indexOf('0') : res.get(5).length()));
                sf.setIndex(res.get(6));
                sf.setPESEL(res.get(8));
            }



        } catch (Exception e) {
            System.err.println(e.toString());
        }

        return sf;
    }


}
