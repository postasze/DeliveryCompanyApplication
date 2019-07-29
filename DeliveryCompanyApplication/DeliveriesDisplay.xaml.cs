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
    /// Interaction logic for DeliveriesDisplay.xaml
    /// </summary>
    public partial class DeliveriesDisplay : Window
    {
        public DeliveriesDisplay()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            DeliveryCompanyApplication.DataSet1 dataSet1 = ((DeliveryCompanyApplication.DataSet1)(this.FindResource("dataSet1")));
            // Load data into the table PRZESYŁKI. You can modify this code as needed.
            DeliveryCompanyApplication.DataSet1TableAdapters.PRZESYŁKITableAdapter dataSet1PRZESYŁKITableAdapter = new DeliveryCompanyApplication.DataSet1TableAdapters.PRZESYŁKITableAdapter();
            dataSet1PRZESYŁKITableAdapter.Fill(dataSet1.PRZESYŁKI);
            System.Windows.Data.CollectionViewSource pRZESYŁKIViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("pRZESYŁKIViewSource")));
            pRZESYŁKIViewSource.View.MoveCurrentToFirst();
        }
    }
}
