package pl.techdra.eobecnosc.view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;

/**
 * Created by Kuba on 26.04.2017.
 */
public class TrayModeView {
    public static void createAndShowGUI() {
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
        URL imageURL = TrayModeView.class.getResource(path);

        if (imageURL == null) {
            System.err.println("Resource not found: " + path);
            return null;
        } else {
            return (new ImageIcon(imageURL, description)).getImage();
        }
    }
}
