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
    /// Interaction logic for UC_Edytuj.xaml
    /// </summary>
    public partial class UC_Edytuj : UserControl
    {
        private static UC_Edytuj _instancja;

        public static UC_Edytuj Instancja
        {
            get
            {
                if (_instancja == null)
                {
                    _instancja = new UC_Edytuj();
                }
                return _instancja;
            }
        }
        public UC_Edytuj()
        {
            InitializeComponent();
        }
        
        
        private void Dodaj_przedmiot_Click(object sender, RoutedEventArgs e)
        {
            UC_Edytuj_Dodaj_przedmiot temp = new UC_Edytuj_Dodaj_przedmiot();
            Edycja_Grid.Children.Clear();
            Edycja_Grid.Children.Add(temp);

        }
    }
}
