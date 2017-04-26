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
       

        private static string server = "46.4.74.155";
        private static string database = "wireks2_kuba";
        private static string uid = "wireks2_kuba";
        private static string password = "G4zQIBgm";
        private static string connectionString= "SERVER=" + server + ";" + "DATABASE=" + database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";

        private void Przycisk_Zaloguj_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                
                MySqlConnection con = new MySqlConnection(connectionString);
                con.Open();
                String readCommand = "SELECT COUNT(*) FROM Uzytkownicy";
                MySqlCommand m = new MySqlCommand(readCommand, con);

                MessageBox.Show(Convert.ToString(m.ExecuteScalar()));
                /*
                String readCommand = "SELECT COUNT(*) WHERE Login = @param_val_1 AND Password = @param_val_2;";
                MySqlCommand m = new MySqlCommand(readCommand, con);
                m.Parameters.AddWithValue("@param_val_1", Login.Text);
                m.Parameters.AddWithValue("@param_val_2", Haslo.Password);
                int liczba_uzytkownikow = Convert.ToInt32(m.ExecuteScalar());
                if (liczba_uzytkownikow == 1)
                {
                    Widok.Children.Clear();
                    Widok.Children.Add(new Sterowanie());
                }
                
                con.Close();
                */
            }
            catch (Exception b)
            {
                MessageBox.Show(b.Message, "Błąd");

            }
        }
    }
}
