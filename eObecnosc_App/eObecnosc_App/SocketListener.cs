﻿using System;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Windows;
using System.Net.NetworkInformation;

namespace eObecnosc_App
{
    public class SocketListener
    {


        public string data = null;

        public string Data
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

        public void StartListening()
        {

            try
            {
                UdpClient udpClient = new UdpClient(8993);
                udpClient.Client.ReceiveTimeout = 500;
                Console.WriteLine(IPAddress.Broadcast.ToString());
                IPEndPoint RemoteIpEndPoint = new IPEndPoint(IPAddress.Any, 8993);
                Byte[] receiveBytes = udpClient.Receive(ref RemoteIpEndPoint);
                data = Encoding.ASCII.GetString(receiveBytes);
                Console.WriteLine(RemoteIpEndPoint.Address.ToString() + ":" + data.ToString());
                udpClient.Close();
                if (RemoteIpEndPoint.Address != null)
                {
                    udpClient = new UdpClient();
                    udpClient.Connect(RemoteIpEndPoint.Address.ToString(), 8994);
                    udpClient.Client.SendTimeout = 500;
                    Byte[] senddata = Encoding.ASCII.GetBytes("Ack");
                    udpClient.Send(senddata, senddata.Length);
                    udpClient.Close();
                }
            }
            catch (Exception e) { }

        }
        public IPAddress GetBroadcastAddress(IPAddress address, IPAddress subnetMask)
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

        public void SendBroadcast()
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
                    byte[] msg = Encoding.ASCII.GetBytes(adress.MapToIPv4().ToString());
                    udpClient.Connect(broadcast.ToString(), 8992);
                    udpClient.Send(msg, msg.Length);

                }
            }
            udpClient.Close();

        }
    }
}