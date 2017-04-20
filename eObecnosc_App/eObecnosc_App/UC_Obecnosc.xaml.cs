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
    /// Interaction logic for UC_Obecnosc.xaml
    /// </summary>
    public partial class UC_Obecnosc : UserControl
    {
        private static UC_Obecnosc _instancja;

        public static UC_Obecnosc Instancja
        {
            get
            {
                if(_instancja == null)
                {
                    _instancja = new UC_Obecnosc();
                }
                return _instancja;
            }
        }
        public UC_Obecnosc()
        {
            InitializeComponent();
        }
    }
}
