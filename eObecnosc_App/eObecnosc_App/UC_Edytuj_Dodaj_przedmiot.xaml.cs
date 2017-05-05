using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
    /// Logika interakcji dla klasy UC_Edytuj_Dodaj_przedmiot.xaml
    /// </summary>
    public partial class UC_Edytuj_Dodaj_przedmiot : UserControl
    {
      
        public UC_Edytuj_Dodaj_przedmiot()
        {
            InitializeComponent();
        }


        private void UC_Edytuj_Dodaj_przedmiot_Przycisk_dodaj_Click(object sender, RoutedEventArgs e)
        {
            if (UC_Edytuj_Dodaj_przedmiot_Nazwa_przedmiotu.Text != "")
            {
                MySqlConnection con = new MySqlConnection(MainWindow.connectionString);
                con.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO Przedmiot(Nazwa,Id_Prowadzacy) VALUES(?nazwa,?id)";
                cmd.Parameters.Add("?id", MySqlDbType.Int16).Value = MainWindow.ID;
                cmd.Parameters.Add("?nazwa", MySqlDbType.VarChar).Value = UC_Edytuj_Dodaj_przedmiot_Nazwa_przedmiotu.Text;
                cmd.ExecuteNonQuery();
                UC_Edytuj_Dodaj_przedmiot_Nazwa_przedmiotu.Text = "";
            }
        }
    }

}