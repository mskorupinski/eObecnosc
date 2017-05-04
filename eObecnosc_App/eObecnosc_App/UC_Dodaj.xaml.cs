using System;
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

            tescik.Text = await obecny();

        }
        private long czas=0;
        private Task<string> obecny()
        {
            return Task.Run(() => 
            {
                string temp = "";
                Timer odmierz = new Timer();
                odmierz.Interval = 1000;
                odmierz.Start();
                odmierz.Elapsed += Czas_wykonaj;
                while(czas<60000)
                {
                    SocketListener sprawdz = new SocketListener();
                    sprawdz.StartListening();
                }

                odmierz.Stop();
                temp = "koniec";
                return temp;
            });
        }

        private  void Czas_wykonaj(Object source, System.Timers.ElapsedEventArgs e)
        {
            SocketListener wyslij = new SocketListener();
            wyslij.SendBroadcast();
            czas += 1000;
        }

    }
}
