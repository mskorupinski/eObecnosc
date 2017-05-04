using System;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Windows;
using System.Net.NetworkInformation;

namespace eObecnosc_App
{
    public  class SocketListener
    {

       
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
            Console.WriteLine(IPAddress.Broadcast.ToString());
            UdpClient udpClient = new UdpClient(8080);

            while (true)
            {

                IPEndPoint RemoteIpEndPoint = new IPEndPoint(IPAddress.Any, 8080);
                Byte[] receiveBytes = udpClient.Receive(ref RemoteIpEndPoint);
                string returnData = Encoding.ASCII.GetString(receiveBytes);
                Console.WriteLine(RemoteIpEndPoint.Address.ToString() + ":" + returnData.ToString());
            }

        }
        public  IPAddress GetBroadcastAddress(IPAddress address, IPAddress subnetMask)
        {
            byte[] ipAdressBytes = address.GetAddressBytes();
            byte[] subnetMaskBytes = subnetMask.GetAddressBytes();

            if (ipAdressBytes.Length != subnetMaskBytes.Length)
                throw new ArgumentException("Za długi adres IP i maska.");

            byte[] broadcastAddress = new byte[ipAdressBytes.Length];
            for (int i = 0; i < broadcastAddress.Length; i++)
            {
                broadcastAddress[i] = (byte)(ipAdressBytes[i] | (subnetMaskBytes[i] ^ 255));
            }
            return new IPAddress(broadcastAddress);
        }

        public  void SendBroadcast()
        {
            UdpClient udpClient = new UdpClient();
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
                    byte[] msg = Encoding.ASCII.GetBytes("Dupa");
                    udpClient.Connect(broadcast.ToString(), 8080);
                    udpClient.Send(msg, msg.Length);

                }
            }
        }
    }
}