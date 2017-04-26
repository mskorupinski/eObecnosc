/**
 * Created by Kuba on 26.04.2017.
 */

import org.apache.commons.validator.routines.InetAddressValidator;
import pl.techdra.eobecnosc.*;
import pl.techdra.eobecnosc.view.TrayModeView;
import javax.swing.*;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;


public class AttendanceStart {
    private static DatagramSocket teacher_ip_sock;
    private static DatagramSocket student_send_sock;


    private static boolean SendIndex(String index, String ip) {
        try {
            AttendanceStart.student_send_sock = new DatagramSocket(8993);
            AttendanceStart.student_send_sock.connect(InetAddress.getByName(ip), 8993);
            byte[] buf= index.getBytes();
            DatagramPacket packet= new DatagramPacket(buf, buf.length);

            AttendanceStart.student_send_sock.send(packet);
            return true;

        } catch (Exception e) {
            return false;

        } finally {
            AttendanceStart.student_send_sock.close();
        }
    }

    public static void main(String[] args) {
        try {
            AttendanceStart.teacher_ip_sock = new DatagramSocket(8992);
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


            AttendanceStart.teacher_ip_sock.receive(packet);
            StudentFile sf = card.ReadData();

            while ((!sf.getIndex().equals("")) && (sf.getIndex() != null) ) {
                JOptionPane.showMessageDialog(null, "Bład odczytu danych z karty. Włóż ponownie kartę");
                sf = card.ReadData();
            }
            String ip = new String(buffer);  //Teacher's computer ip address

            while (! IPv4Validator.isValidInet4Address(ip) ) {
                AttendanceStart.teacher_ip_sock.receive(packet);
                ip = new String(buffer);
            }

            int TryCounter = 3;

            while (TryCounter > 0 && !AttendanceStart.SendIndex(sf.getIndex(), ip)) {
                TryCounter--;
            }

            JOptionPane.showMessageDialog(null, "Obecność zatwierdzona.\n" + sf.toString() );


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            AttendanceStart.teacher_ip_sock.close();
        }



    }
}
