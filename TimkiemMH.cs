using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Quản_lý_bán_hàng
{
    public partial class formTKMH : Form
    {
        public formTKMH()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-NL36GS2\SQLEXPRESS;Initial Catalog=Quanlybanhang;Integrated Security=True");

        private void timkiem_Load(object sender, EventArgs e)
        {
            conn.Open();
        }

        private void timkiem_FormClosing(object sender, FormClosingEventArgs e)
        {
            conn.Close();
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            if (txtmaMH.TextLength == 0) MessageBox.Show("Mã mặt hàng không để trống", "Chú ý");
            string sqlTimkiem = " Select* from tblMatHang where maMH= @maMH ";
            SqlCommand cmd = new SqlCommand(sqlTimkiem, conn);  // đọc lệnh
            cmd.Parameters.AddWithValue("maMH", txtmaMH.Text);
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);           // bảng đọc dữ liệu của sql datareader
            DataGridView.DataSource = dt;
        }

        private void btnthoat_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmMain fmh = new frmMain();
            fmh.ShowDialog();
            this.Close();
        }
    }
}
