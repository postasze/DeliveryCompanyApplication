using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DeliveryCompanyApplication
{
    public partial class AdministatorMDIPanel : Form
    {
        private int childFormNumber = 0;

        public AdministatorMDIPanel()
        {
            InitializeComponent();
        }

        private void ShowNewForm(object sender, EventArgs e)
        {
            Form childForm = new Form();
            childForm.MdiParent = this;
            childForm.Text = "Window " + childFormNumber++;
            childForm.Show();
        }

        private void OpenFile(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
            openFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*";
            if (openFileDialog.ShowDialog(this) == DialogResult.OK)
            {
                string FileName = openFileDialog.FileName;
            }
        }

        private void SaveAsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
            saveFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*";
            if (saveFileDialog.ShowDialog(this) == DialogResult.OK)
            {
                string FileName = saveFileDialog.FileName;
            }
        }

        private void ExitToolsStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CutToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void CopyToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void PasteToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void ToolBarToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void StatusBarToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void CascadeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.Cascade);
        }

        private void TileVerticalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileVertical);
        }

        private void TileHorizontalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileHorizontal);
        }

        private void ArrangeIconsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.ArrangeIcons);
        }

        private void CloseAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form childForm in MdiChildren)
            {
                childForm.Close();
            }
        }

        private void zakładanieKontToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void modyfikowanieKontToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void usuwanieKontToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void dodawanieLokalizacjiToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void modyfikowanieLokalizacjiToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void wyświetlanieKontToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void wyświetlaniePracownikówToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void wyświetlanieNadawcówToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void wyświetlaniePrzesyłekToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void wyświetlaniePrzesyłekToolStripMenuItem1_Click(object sender, EventArgs e)
        {

        }

        private void wyświetlaniePaczekToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void wyświetlanieAdresówToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void wyświetlaniePojazdówToolStripMenuItem_Click(object sender, EventArgs e)
        {
            VehiclesDisplay vehiclesDisplay = new VehiclesDisplay();
        }
    }
}
