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

        private  void Przycisk_Sprawdz_Click(object sender, RoutedEventArgs e)
        {

        }

    }
}
