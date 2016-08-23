using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoWinFormsApp
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btnQueryApi_Click(object sender, EventArgs e)
        {
            // set the hourglass
            this.Cursor = Cursors.WaitCursor;

            
            QueryApi tmpQueryApi = new QueryApi();

            // get the results of the api
            List<QueryApi.SQLVersionData> tmpAPIResults = tmpQueryApi.CallAPI(txtVersion.Text, cbxMissingUpdates.Checked);

            // we need to convert the List to a BindingList and BindingSource so we can bind it to the DataGridView
            // You could change the return type of CallAPI however I have kept that class the same as I use in MVC webapps etc
            BindingList<QueryApi.SQLVersionData> tmpData = new BindingList<QueryApi.SQLVersionData>(tmpAPIResults);
            BindingSource tmpSource = new BindingSource(tmpData, null);
            lblUri.Text = tmpQueryApi.apiUri;

            dataGvwApiResults.DataSource = tmpSource;

            // add the index of the row (Row Number) to the rowheader of eadh row for display purposes
            for (int iRow = 0; iRow < dataGvwApiResults.Rows.Count; iRow++)
            {
                DataGridViewRowHeaderCell cell = dataGvwApiResults.Rows[iRow].HeaderCell;
                cell.Value = (iRow + 1).ToString();
                dataGvwApiResults.Rows[iRow].HeaderCell = cell;
            }

            // make sure we can see the row numbers
            dataGvwApiResults.RowHeadersWidth = 70;

            // return the cursor
            this.Cursor = Cursors.Default;
        }

    }
}
