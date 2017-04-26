/**
 * Created by Kuba on 29.03.2017.
 */

import pl.techdra.eobecnosc.*;
import pl.techdra.eobecnosc.view.TrayModeView;

import javax.swing.*;


public class TestCard {
    public static void main(String[] args) {
        try {
            JOptionPane.showMessageDialog(null, Broadcast.GetBroadcast());
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            //UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        UIManager.put("swing.boldMetal", Boolean.FALSE);

        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                TrayModeView.createAndShowGUI();
            }
        });

        ELS card = new ELS();
        StudentFile sf = card.ReadData();

        JOptionPane.showMessageDialog(null, sf);
    }


}
