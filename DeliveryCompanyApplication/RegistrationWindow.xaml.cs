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
using System.Windows.Shapes;

namespace DeliveryCompanyApplication
{
    /// <summary>
    /// Interaction logic for RegistrationWindow.xaml
    /// </summary>
    /// 

    public partial class RegistrationWindow : Window
    {
        DatabaseEntities dbContext;
        public int inputStreetNumber { get; set; }
        public int inputHomeNumber { get; set; }
        public int accountType { get; set; }
        public int employeeType { get; set; }
        public int inputCity { get; set; }
        public int inputRegion { get; set; }
        public int inputCountry { get; set; }
        public String inputLogin { get; set; }
        public String inputMail { get; set; }
        public String inputPassword1 { get; set; }
        public String inputPassword2 { get; set; }
        public String inputStreet { get; set; }
        public String inputPostalCode { get; set; }
        public String name { get; set; }
        public String secondName { get; set; }
        public String surname { get; set; }

        public RegistrationWindow()
        {
            InitializeComponent();
            AccountComboBox.Items.Add("Konto użytkownika");
            AccountComboBox.Items.Add("Konto pracownika");
            AccountComboBox.Items.Add("Konto z prawami administratora");
            for (int i = 0; i < ADRESY.Countries.Count(); i++)
                CountryComboBox.Items.Add(ADRESY.Countries[i]);
            for (int i = 0; i < 8; i++)
                RegionComboBox.Items.Add(ADRESY.Regions[i]);
            for (int i = 0; i < 3; i++)
                CityComboBox.Items.Add(ADRESY.Cities[i]);
            
            AccountComboBox.SelectedIndex = 0;
            CityComboBox.SelectedIndex = 0;            
            RegionComboBox.SelectedIndex = 0;
            CountryComboBox.SelectedIndex = 0;
            this.DataContext = this;
        }
        
        private void RegistrationButton_Click(object sender, RoutedEventArgs e)
        {
            dbContext = new DatabaseEntities();
            Random random = new Random();

            inputPassword1 = PasswordBox1.Password;
            inputPassword2 = PasswordBox2.Password;

            if (!String.Equals(inputPassword1, inputPassword2))
            {
                MessageBox.Show("Hasła powinny być takie same");
                return;
            }

            inputCountry = CountryComboBox.SelectedIndex + 1;

            if(inputCountry == 1) // Polska
            {
                inputRegion = RegionComboBox.SelectedIndex + 1;
                switch(inputRegion)
                {
                    case 1:
                        inputCity = CityComboBox.SelectedIndex + 1;
                        break;
                    case 2:
                        inputCity = CityComboBox.SelectedIndex + 4;
                        break;
                    case 3:
                        inputCity = CityComboBox.SelectedIndex + 5;
                        break;
                    case 4:
                        inputCity = CityComboBox.SelectedIndex + 6;
                        break;
                    case 5:
                        inputCity = CityComboBox.SelectedIndex + 7;
                        break;
                    case 6:
                        inputCity = CityComboBox.SelectedIndex + 8;
                        break;
                    case 7:
                        inputCity = CityComboBox.SelectedIndex + 11;
                        break;
                    case 8:
                        inputCity = CityComboBox.SelectedIndex + 13;
                        break;
                }
            }
            else if (inputCountry == 2) // Niemcy
            {
                inputRegion = RegionComboBox.SelectedIndex + 9;
                inputCity = CityComboBox.SelectedIndex + 14;
            }

            int addressQuantity = dbContext.ADRESY.Count();

            ADRESY adres = new ADRESY() { ID_ADRESU = addressQuantity + 1, ULICA = inputStreet, 
                NUMER_DOMU = inputStreetNumber, NUMER_MIESZKANIA = inputHomeNumber, 
                KOD_POCZTOWY = inputPostalCode, 
                MIASTO = inputCity, WOJEWÓDZTWO = inputRegion , PAŃSTWO = inputCountry};

            dbContext.ADRESY.Add(adres);

            int accountQuantity = dbContext.KONTA.Count();
            
            KONTA konto = new KONTA() { ID_KONTA = accountQuantity + 1, NICK = inputLogin,
                TYP_KONTA = 3 - AccountComboBox.SelectedIndex, HASŁO = inputPassword1, MAIL = inputMail };

            Console.WriteLine(konto);

            dbContext.KONTA.Add(konto);

            if(AccountComboBox.SelectedIndex == 0) // konto uzytkownika
            {
                int senderQuantity = dbContext.NADAWCY.Count();

                NADAWCY nadawca = new NADAWCY()
                {
                    ID_NADAWCY = senderQuantity + 1,
                    ID_KONTA = accountQuantity + 1,
                    ADRES_ZAMIESZKANIA = addressQuantity + 1,
                    PIERWSZE_IMIE = name,
                    DRUGIE_IMIE = secondName,
                    NAZWISKO = surname,
                };

                dbContext.NADAWCY.Add(nadawca);
            }
            else if(AccountComboBox.SelectedIndex == 1) // konto pracownika
            {
                int employeeQuantity = dbContext.PRACOWNICY.Count();
                int localizationId = 0;

                if (employeeType == 0)
                    localizationId = random.Next(7, 11);
                else if (employeeType == 1)
                    localizationId = random.Next(2, 7);

                PRACOWNICY pracownik = new PRACOWNICY()
                {
                    ID_PRACOWNIKA = employeeQuantity + 1,
                    TYP_PRACOWNIKA = employeeType + 4,
                    ADRES_ZAMIESZKANIA = addressQuantity + 1,
                    ID_LOKALIZACJI = localizationId,
                    ID_KONTA = accountQuantity + 1,
                    PIERWSZE_IMIE = name,
                    DRUGIE_IMIE = secondName,
                    NAZWISKO = surname,
                    WYNAGRODZENIE = random.Next(1500, 8001)                  
                };

                dbContext.PRACOWNICY.Add(pracownik);
            }
            else if (AccountComboBox.SelectedIndex == 2) // konto z prawami administratora
            {
                int employeeQuantity = dbContext.PRACOWNICY.Count();
                int localizationId = 0;

                if (employeeType == 0)
                    localizationId = 1;
                else if (employeeType == 1 || employeeType == 2)
                    localizationId = random.Next(2, 7);

                PRACOWNICY pracownik = new PRACOWNICY()
                {
                    ID_PRACOWNIKA = employeeQuantity + 1,
                    TYP_PRACOWNIKA = employeeType + 1,
                    ADRES_ZAMIESZKANIA = addressQuantity + 1,
                    ID_LOKALIZACJI = localizationId,
                    ID_KONTA = accountQuantity + 1,
                    PIERWSZE_IMIE = name,
                    DRUGIE_IMIE = secondName,
                    NAZWISKO = surname,
                    WYNAGRODZENIE = random.Next(3000, 20001) 
                };

                dbContext.PRACOWNICY.Add(pracownik);
            }

            dbContext.SaveChanges();
            this.Close();
        }

        private void CountryComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch(CountryComboBox.SelectedIndex)
            {
                case 0:
                    RegionComboBox.Items.Clear();
                    CityComboBox.Items.Clear();

                    for (int i = 0; i < 8; i++)
                        RegionComboBox.Items.Add(ADRESY.Regions[i]);
                    for (int i = 0; i < 3; i++)
                        CityComboBox.Items.Add(ADRESY.Cities[i]);
                    RegionComboBox.SelectedIndex = 0;
                    CityComboBox.SelectedIndex = 0;
                    break;
                case 1:
                    RegionComboBox.Items.Clear();
                    CityComboBox.Items.Clear();
                    for (int i = 8; i < 12; i++)
                        RegionComboBox.Items.Add(ADRESY.Regions[i]);
                    CityComboBox.Items.Add(ADRESY.Cities[13]);
                    RegionComboBox.SelectedIndex = 0;
                    CityComboBox.SelectedIndex = 0;
                    break;

            }
        }

        private void RegionComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(CountryComboBox.SelectedIndex == 0)
            {
                switch (RegionComboBox.SelectedIndex)
                {
                    case 0:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[0]);
                        CityComboBox.Items.Add(ADRESY.Cities[1]);
                        CityComboBox.Items.Add(ADRESY.Cities[2]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 1:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[3]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 2:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[4]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 3:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[5]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 4:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[6]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 5:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[7]);
                        CityComboBox.Items.Add(ADRESY.Cities[8]);
                        CityComboBox.Items.Add(ADRESY.Cities[9]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 6:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[10]);
                        CityComboBox.Items.Add(ADRESY.Cities[11]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 7:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[12]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                }
            }
            else if (CountryComboBox.SelectedIndex == 1)
            {
                switch(RegionComboBox.SelectedIndex)
                {
                    case 0:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[13]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 1:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[14]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 2:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[15]);
                        CityComboBox.SelectedIndex = 0;
                        break;
                    case 3:
                        CityComboBox.Items.Clear();
                        CityComboBox.Items.Add(ADRESY.Cities[16]);
                        CityComboBox.SelectedIndex = 0;
                        break;                
                }
            }
        }

        private void AccountComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (AccountComboBox.SelectedIndex)
            { 
                case 0:
                    EmployeeTypeComboBox.Items.Clear();
                    break;
                case 1:
                    EmployeeTypeComboBox.Items.Clear();
                    EmployeeTypeComboBox.Items.Add("kurier");
                    EmployeeTypeComboBox.Items.Add("pracownik biura");
                    EmployeeTypeComboBox.SelectedIndex = 0;  
                    break;
                case 2:
                    EmployeeTypeComboBox.Items.Clear();
                    EmployeeTypeComboBox.Items.Add("członek zarządu");
                    EmployeeTypeComboBox.Items.Add("informatyk");
                    EmployeeTypeComboBox.Items.Add("menadżer");
                    EmployeeTypeComboBox.SelectedIndex = 0;  
                    break;
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
