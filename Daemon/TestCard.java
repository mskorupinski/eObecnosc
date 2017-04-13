/**
 * Created by Kuba on 29.03.2017.
 */
import pl.techdra.eobecnosc.*;

import javax.swing.*;
import java.awt.*;
import java.net.URL;
import java.awt.event.*;

public class TestCard {
    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            //UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
        } catch (UnsupportedLookAndFeelException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        } catch (InstantiationException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        UIManager.put("swing.boldMetal", Boolean.FALSE);

        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUI();
            }
        });

        ELS card = new ELS();
        StudentFile sf = card.ReadData();

        JOptionPane.showMessageDialog(null, sf);
    }

    private static void createAndShowGUI() {
        //Check the SystemTray support
        if (!SystemTray.isSupported()) {
            System.out.println("SystemTray is not supported");
            return;
        }
        final PopupMenu popup = new PopupMenu();
        final TrayIcon trayIcon =
                new TrayIcon(createImage("images/icon.gif", "eObecnosc"));
        final SystemTray tray = SystemTray.getSystemTray();

        // Create a popup menu components
        CheckboxMenuItem fb_set = new CheckboxMenuItem("Facebook forms");
        MenuItem exitItem = new MenuItem("Exit");

        //Add components to popup menu
        popup.add(fb_set);
        popup.addSeparator();
        popup.add(exitItem);

        trayIcon.setPopupMenu(popup);
        trayIcon.setImageAutoSize(true);

        try {
            tray.add(trayIcon);
        } catch (AWTException e) {
            System.out.println("Ikona nie może zostać dodana");
            return;
        }

        exitItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                tray.remove(trayIcon);
                System.exit(0);
            }
        });



    }

    //Obtain the image URL
    protected static Image createImage(String path, String description) {
        URL imageURL = TestCard.class.getResource(path);

        if (imageURL == null) {
            System.err.println("Resource not found: " + path);
            return null;
        } else {
            return (new ImageIcon(imageURL, description)).getImage();
        }
    }
}
