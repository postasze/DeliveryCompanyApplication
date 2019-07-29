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
    /// Interaction logic for VehiclesDisplay.xaml
    /// </summary>
    public partial class VehiclesDisplay : Window
    {
        public VehiclesDisplay()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            DeliveryCompanyApplication.DataSet1 dataSet1 = ((DeliveryCompanyApplication.DataSet1)(this.FindResource("dataSet1")));
            // Load data into the table POJAZDY_KURIERSKIE. You can modify this code as needed.
            DeliveryCompanyApplication.DataSet1TableAdapters.POJAZDY_KURIERSKIETableAdapter dataSet1POJAZDY_KURIERSKIETableAdapter = new DeliveryCompanyApplication.DataSet1TableAdapters.POJAZDY_KURIERSKIETableAdapter();
            dataSet1POJAZDY_KURIERSKIETableAdapter.Fill(dataSet1.POJAZDY_KURIERSKIE);
            System.Windows.Data.CollectionViewSource pOJAZDY_KURIERSKIEViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("pOJAZDY_KURIERSKIEViewSource")));
            pOJAZDY_KURIERSKIEViewSource.View.MoveCurrentToFirst();
        }
    }
}
