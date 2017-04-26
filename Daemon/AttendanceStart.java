/**
 * Created by Kuba on 26.04.2017.
 */

import org.apache.commons.validator.routines.InetAddressValidator;
import pl.techdra.eobecnosc.*;
import pl.techdra.eobecnosc.view.TrayModeView;
import javax.swing.*;
import java.net.DatagramPacket;
import java.net.DatagramSocket;


public class AttendanceStart {
    private static DatagramSocket socket;


    public static void main(String[] args) {
        try {
            AttendanceStart.socket = new DatagramSocket(8992);
            ELS card = new ELS();
            byte[] buffer = new byte[256];
            DatagramPacket packet = new DatagramPacket(buffer, buffer.length);
            InetAddressValidator IPv4Validator = new InetAddressValidator();

            UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
            UIManager.put("swing.boldMetal", Boolean.FALSE);
            SwingUtilities.invokeLater(new Runnable() {
                public void run() {
                    TrayModeView.createAndShowGUI();
                }
            });

            AttendanceStart.socket.receive(packet);
            String ip = new String(buffer);  //Teacher's computer ip address
            while (! IPv4Validator.isValidInet4Address(ip) ) {
                AttendanceStart.socket.receive(packet);
                ip = new String(buffer);
            }

            JOptionPane.showMessageDialog(null, "");

        } catch (Exception ex) {
            ex.printStackTrace();
        }



    }
}
