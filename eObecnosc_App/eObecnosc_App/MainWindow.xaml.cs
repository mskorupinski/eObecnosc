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
using MahApps.Metro.Controls;

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
