using System;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Windows;
using System.Net.NetworkInformation;

namespace eObecnosc_App
{
    public static class SocketListener
    {

        // Incoming data from the client.
        private static string data = null;

        public static string Data
        {
            get
            {
                return data;
            }

            set
            {
                data = value;
            }
        }

        public static void StartListening()
        {

            byte[] bytes = new Byte[1024];

            IPHostEntry ipHostInfo = Dns.Resolve(Dns.GetHostName());
            IPAddress ipAddress = ipHostInfo.AddressList[0];
            IPEndPoint localEndPoint = new IPEndPoint(ipAddress, 11000);

            Socket listener = new Socket(AddressFamily.InterNetwork,
                SocketType.Stream, ProtocolType.Tcp);


            try
            {
                listener.Bind(localEndPoint);
                listener.Listen(10);

                String strHostName = string.Empty;

                strHostName = Dns.GetHostName();

                //Broadcast aktywnych interfejsów
                NetworkInterface[] Interfaces = NetworkInterface.GetAllNetworkInterfaces();
                foreach (NetworkInterface Interface in Interfaces)
                {
                    if (Interface.NetworkInterfaceType == NetworkInterfaceType.Loopback) continue;
                    if (Interface.OperationalStatus != OperationalStatus.Up) continue;
                    Console.WriteLine(Interface.Description);
                    UnicastIPAddressInformationCollection UnicastIPInfoCol = Interface.GetIPProperties().UnicastAddresses;
                    foreach (UnicastIPAddressInformation UnicatIPInfo in UnicastIPInfoCol)
                    {

                        IPAddress adress = UnicatIPInfo.Address;
                        IPAddress maska = UnicatIPInfo.IPv4Mask;
                        IPAddress broadcast = (GetBroadcastAddress(adress.MapToIPv4(), maska.MapToIPv4()));

                    }
                }





                while (true)
                {
                    Console.WriteLine("Waiting for a connection...");

                    Socket handler = listener.Accept();
                    data = null;

                    while (true)
                    {
                        bytes = new byte[1024];
                        int bytesRec = handler.Receive(bytes);
                        data += Encoding.ASCII.GetString(bytes, 0, bytesRec);
                        Console.WriteLine("Text received : {0}", data);
                        break;
                    }

                    byte[] msg = Encoding.ASCII.GetBytes(data);

                    handler.Send(msg);
                    handler.Shutdown(SocketShutdown.Both);
                    handler.Close();
                }

            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message, "Błąd"); 
            }

            

        }
        public static IPAddress GetBroadcastAddress(this IPAddress address, IPAddress subnetMask)
        {
            byte[] ipAdressBytes = address.GetAddressBytes();
            byte[] subnetMaskBytes = subnetMask.GetAddressBytes();

            if (ipAdressBytes.Length != subnetMaskBytes.Length)
                throw new ArgumentException("Lengths of IP address and subnet mask do not match.");

            byte[] broadcastAddress = new byte[ipAdressBytes.Length];
            for (int i = 0; i < broadcastAddress.Length; i++)
            {
                broadcastAddress[i] = (byte)(ipAdressBytes[i] | (subnetMaskBytes[i] ^ 255));
            }
            return new IPAddress(broadcastAddress);
        }
    }
}