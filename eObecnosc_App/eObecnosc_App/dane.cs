using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eObecnosc_App
{
    
    class dane
    {
        private string imie;
        private string nazwisko;
        private string indeks;

        public string Imie { get => imie; set => imie = value; }
        public string Nazwisko { get => nazwisko; set => nazwisko = value; }
        public string Indeks { get => indeks; set => indeks = value; }
        public dane(string i, string n, string ni)
        {
            Imie=i;
            Nazwisko = n;
            Indeks = ni;
        }
    }
}
