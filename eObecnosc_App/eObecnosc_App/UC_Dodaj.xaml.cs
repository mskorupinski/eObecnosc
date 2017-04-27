using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
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

            string temp = "";
            long czas_poczatek = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
            long czas_roznica = 0;
            SocketListener broadcast = new SocketListener();
            broadcast.SendBroadcast();

            

                broadcast.StartListening();
                temp += (broadcast.data + Environment.NewLine);
                Console.WriteLine(czas_roznica);
                long czas_aktualny = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
                czas_roznica = czas_aktualny - czas_poczatek;

            
            tescik.Text=temp;

        }

        
    }
}
