package pl.techdra.eobecnosc;

/**
 * Created by Kuba on 26.04.2017.
 */

import java.net.InterfaceAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

public class Broadcast {
    public static String GetBroadcast() {
        try {
            Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces();
            while (en.hasMoreElements()) {
                NetworkInterface in = en.nextElement();
                List<InterfaceAddress> list = in.getInterfaceAddresses();
                Iterator<InterfaceAddress> it = list.iterator();

                if (in.isLoopback() || in.isVirtual() || !in.isUp()) continue;

                while (it.hasNext()) {
                    InterfaceAddress ia = it.next();
                    if ( ia.getBroadcast() != null ) return ia.getBroadcast().toString();
                }
            }
        } catch (Exception e) {
            return null;
        }

        return null;
    }
}
