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
        public static string connectionString= "SERVER=" + server + ";" + "DATABASE=" + database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";
        public static int ID;
        private void Przycisk_Zaloguj_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                
                MySqlConnection con = new MySqlConnection(connectionString);
                con.Open();
                String readCommand = "select Id_Prowadzacy from Prowadzacy  where Prowadzacy.Login = @param_val_1 and Prowadzacy.Haslo = MD5(@param_val_2)";
                MySqlCommand m = new MySqlCommand(readCommand, con);
                m.Parameters.AddWithValue("@param_val_1", Login.Text);
                m.Parameters.AddWithValue("@param_val_2", Haslo.Password);
                int id = Convert.ToInt32(m.ExecuteScalar());
                if (id > 0)
                {
                    Widok.Children.Clear();
                    Sterowanie panel_g = new Sterowanie();
                    Widok.Children.Add(panel_g);
                    panel_g.Panel.Children.Add(UC_Dodaj.Instancja);
                    ID = id;
                }
                else
                {
                    MessageBox.Show("Nieporawny login lub hasło", "Informacja", MessageBoxButton.OK, MessageBoxImage.Information);
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
