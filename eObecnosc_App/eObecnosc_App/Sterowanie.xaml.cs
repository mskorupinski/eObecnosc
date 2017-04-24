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
    /// Logika interakcji dla klasy Sterowanie.xaml
    /// </summary>
    public partial class Sterowanie : UserControl
    {
        public Sterowanie()
        {
            InitializeComponent();
        }
        private void Przycisk_Wyswietl_Click(object sender, RoutedEventArgs e)
        {
            Panel.Children.Clear();

            Panel.Children.Add(UC_Obecnosc.Instancja);
        }

        private void Przycisk_Dodaj_Click(object sender, RoutedEventArgs e)
        {
            Panel.Children.Clear();

            Panel.Children.Add(UC_Dodaj.Instancja);
        }

        private void Przycisk_Edytuj_Click(object sender, RoutedEventArgs e)
        {
            Panel.Children.Clear();

            Panel.Children.Add(UC_Edytuj.Instancja);
        }

      
    }
}
