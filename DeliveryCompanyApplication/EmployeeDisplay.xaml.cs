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
    /// Interaction logic for EmployeeDisplay.xaml
    /// </summary>
    public partial class EmployeeDisplay : Window
    {
        public EmployeeDisplay()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            DeliveryCompanyApplication.DataSet1 dataSet1 = ((DeliveryCompanyApplication.DataSet1)(this.FindResource("dataSet1")));
            // Load data into the table PRACOWNICY. You can modify this code as needed.
            DeliveryCompanyApplication.DataSet1TableAdapters.PRACOWNICYTableAdapter dataSet1PRACOWNICYTableAdapter = new DeliveryCompanyApplication.DataSet1TableAdapters.PRACOWNICYTableAdapter();
            dataSet1PRACOWNICYTableAdapter.Fill(dataSet1.PRACOWNICY);
            System.Windows.Data.CollectionViewSource pRACOWNICYViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("pRACOWNICYViewSource")));
            pRACOWNICYViewSource.View.MoveCurrentToFirst();
        }
    }
}
