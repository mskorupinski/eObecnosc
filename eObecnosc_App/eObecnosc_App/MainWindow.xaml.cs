using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MahApps.Metro.Controls;
using MySql.Data.MySqlClient;

namespace eObecnosc_App
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : MetroWindow
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private string Nazwa_Użytkownika = "dbo674533357@10.46.135.36";
        private string Hasło_Użytkownika = "$Dallas'63";
        private string Serwer = "db674533357.db.1and1.com";
        private string Baza = "db674533357 ";

        private void Przycisk_Zaloguj_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MySqlConnection con = new MySqlConnection("server=" + Serwer + ";UID=" + Nazwa_Użytkownika + ";database=" + Baza + ";password=" + Hasło_Użytkownika);
                con.Open();
                String readCommand = "SELECT COUNT(*) WHERE Login = @param_val_1 AND Password = @param_val_2;";
                MySqlCommand m = new MySqlCommand(readCommand);
                m.Parameters.AddWithValue("@param_val_1", Login.Text);
                m.Parameters.AddWithValue("@param_val_2", Haslo.Password);
                int liczba_uzytkownikow = Convert.ToInt32(m.ExecuteScalar());
                if (liczba_uzytkownikow == 1)
                {
                    Widok.Children.Clear();
                    Widok.Children.Add(new Sterowanie());
                }
                
                con.Close();
                
            }
            catch (Exception b)
            {
                MessageBox.Show(b.Message, "Błąd");

            }
        }
    }
}
