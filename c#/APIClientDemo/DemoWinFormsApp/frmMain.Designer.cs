namespace DemoWinFormsApp
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.lblVersion = new System.Windows.Forms.Label();
            this.txtVersion = new System.Windows.Forms.MaskedTextBox();
            this.cbxMissingUpdates = new System.Windows.Forms.CheckBox();
            this.btnQueryApi = new System.Windows.Forms.Button();
            this.lblUri = new System.Windows.Forms.Label();
            this.dataGvwApiResults = new System.Windows.Forms.DataGridView();
            this.imgLstStatus = new System.Windows.Forms.ImageList(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dataGvwApiResults)).BeginInit();
            this.SuspendLayout();
            // 
            // lblVersion
            // 
            this.lblVersion.AutoSize = true;
            this.lblVersion.Location = new System.Drawing.Point(35, 67);
            this.lblVersion.Margin = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.lblVersion.Name = "lblVersion";
            this.lblVersion.Size = new System.Drawing.Size(130, 45);
            this.lblVersion.TabIndex = 0;
            this.lblVersion.Text = "Version";
            // 
            // txtVersion
            // 
            this.txtVersion.Location = new System.Drawing.Point(196, 54);
            this.txtVersion.Margin = new System.Windows.Forms.Padding(5);
            this.txtVersion.Mask = "00.00.0000.00";
            this.txtVersion.Name = "txtVersion";
            this.txtVersion.Size = new System.Drawing.Size(587, 53);
            this.txtVersion.TabIndex = 2;
            // 
            // cbxMissingUpdates
            // 
            this.cbxMissingUpdates.AutoSize = true;
            this.cbxMissingUpdates.Location = new System.Drawing.Point(196, 132);
            this.cbxMissingUpdates.Name = "cbxMissingUpdates";
            this.cbxMissingUpdates.Size = new System.Drawing.Size(412, 49);
            this.cbxMissingUpdates.TabIndex = 3;
            this.cbxMissingUpdates.Text = "Include Missing Updates";
            this.cbxMissingUpdates.UseVisualStyleBackColor = true;
            // 
            // btnQueryApi
            // 
            this.btnQueryApi.Location = new System.Drawing.Point(807, 55);
            this.btnQueryApi.Name = "btnQueryApi";
            this.btnQueryApi.Size = new System.Drawing.Size(172, 107);
            this.btnQueryApi.TabIndex = 4;
            this.btnQueryApi.Text = "Query API";
            this.btnQueryApi.UseVisualStyleBackColor = true;
            this.btnQueryApi.Click += new System.EventHandler(this.btnQueryApi_Click);
            // 
            // lblUri
            // 
            this.lblUri.AutoSize = true;
            this.lblUri.BackColor = System.Drawing.SystemColors.Info;
            this.lblUri.Location = new System.Drawing.Point(35, 219);
            this.lblUri.Name = "lblUri";
            this.lblUri.Size = new System.Drawing.Size(302, 45);
            this.lblUri.TabIndex = 5;
            this.lblUri.Text = "API Query = http://";
            // 
            // dataGvwApiResults
            // 
            this.dataGvwApiResults.AllowUserToAddRows = false;
            this.dataGvwApiResults.AllowUserToDeleteRows = false;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.dataGvwApiResults.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dataGvwApiResults.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGvwApiResults.Location = new System.Drawing.Point(43, 279);
            this.dataGvwApiResults.Name = "dataGvwApiResults";
            this.dataGvwApiResults.ReadOnly = true;
            this.dataGvwApiResults.RowTemplate.Height = 33;
            this.dataGvwApiResults.Size = new System.Drawing.Size(936, 368);
            this.dataGvwApiResults.TabIndex = 6;
            // 
            // imgLstStatus
            // 
            this.imgLstStatus.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imgLstStatus.ImageStream")));
            this.imgLstStatus.TransparentColor = System.Drawing.Color.Transparent;
            this.imgLstStatus.Images.SetKeyName(0, "green-156618_1280_30percent.png");
            this.imgLstStatus.Images.SetKeyName(1, "cross-157492_1280_30percent.png");
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(19F, 45F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(991, 656);
            this.Controls.Add(this.dataGvwApiResults);
            this.Controls.Add(this.lblUri);
            this.Controls.Add(this.btnQueryApi);
            this.Controls.Add(this.cbxMissingUpdates);
            this.Controls.Add(this.txtVersion);
            this.Controls.Add(this.lblVersion);
            this.Font = new System.Drawing.Font("Calibri", 13.875F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(5);
            this.Name = "frmMain";
            this.Text = "SQL Server Builds API Windows Form Demo";
            ((System.ComponentModel.ISupportInitialize)(this.dataGvwApiResults)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblVersion;
        private System.Windows.Forms.MaskedTextBox txtVersion;
        private System.Windows.Forms.CheckBox cbxMissingUpdates;
        private System.Windows.Forms.Button btnQueryApi;
        private System.Windows.Forms.Label lblUri;
        private System.Windows.Forms.DataGridView dataGvwApiResults;
        private System.Windows.Forms.ImageList imgLstStatus;
    }
}

