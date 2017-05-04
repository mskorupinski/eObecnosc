﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
namespace eObecnosc_App
{
    /// <summary>
    /// Interaction logic for UC_Dodaj.xaml
    /// </summary>
    public partial class UC_Dodaj : UserControl
    {
        private static UC_Dodaj _instancja;

        public static UC_Dodaj Instancja
        {
            get
            {
                if (_instancja == null)
                {
                    _instancja = new UC_Dodaj();
                }
                return _instancja;
            }
        }
        public UC_Dodaj()
        {
            InitializeComponent();
        }

        private  async void Przycisk_Sprawdz_Click(object sender, RoutedEventArgs e)
        {
            DataGrid_Dodani_studenci.Items.Clear();
            Przycisk_Sprawdz.IsEnabled = false;
            string temp= await obecny();
            IList<string> Lista_studentow = temp.Split(new string[] { Environment.NewLine }, StringSplitOptions.None).ToList();
            Lista_studentow = Lista_studentow.Distinct().ToList();
            foreach(string student in Lista_studentow)
            {
                string[] dane = student.Split(new char[] { ' ', '\t' }, StringSplitOptions.RemoveEmptyEntries);
                DataGrid_Dodani_studenci.Items.Add(new dane(dane[0], dane[1], dane[2]));
            }
            Przycisk_Sprawdz.IsEnabled = true;
            DataGrid_Dodani_studenci.Visibility = Visibility.Visible;
            Dodaj.Visibility = Visibility.Visible;
            Usun.Visibility = Visibility.Visible;
            Potwierdz.Visibility = Visibility.Visible;

        }
        private long czas=0;
        private Task<string> obecny()
        {
            return Task.Run(() => 
            {
                
                string temp = "";
                Timer odmierz = new Timer();
                odmierz.Interval = 5000;
                odmierz.Start();
                odmierz.Elapsed += Czas_wykonaj;
                while(czas<600)
                {
                   SocketListener sprawdz = new SocketListener();
                   sprawdz.StartListening();
                   temp+= sprawdz.Data+Environment.NewLine;
                }

                odmierz.Stop();
                czas = 0;
                temp = "Patryk Smol 122097" + Environment.NewLine + "Kasia Nowak 1258" + Environment.NewLine + "Marcin Kowal 123";
                return temp;
            });
        }

        private  void Czas_wykonaj(Object source, System.Timers.ElapsedEventArgs e)
        {
            SocketListener wyslij = new SocketListener();
            wyslij.SendBroadcast();
            czas += 5000;
        }

        private void Usun_Click(object sender, RoutedEventArgs e)
        {
            if (DataGrid_Dodani_studenci.SelectedItem != null)
            {
                DataGrid_Dodani_studenci.Items.RemoveAt(DataGrid_Dodani_studenci.SelectedIndex);
            }
        }

        private void Dodaj_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Zatwierdz_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
