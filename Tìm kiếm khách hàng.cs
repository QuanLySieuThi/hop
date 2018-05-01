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
    public partial class formTKKH : Form
    {
        public formTKKH()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-NL36GS2\SQLEXPRESS;Initial Catalog=Quanlybanhang;Integrated Security=True");

        private void formTKKH_Load(object sender, EventArgs e)
        {
            conn.Open();

        }

        private void formTKKH_FormClosing(object sender, FormClosingEventArgs e)
        {
            conn.Close();
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            if (textBox1.TextLength == 0) MessageBox.Show("Mã khách hàng không được để trống", "Chú ý");
            string sqlTimkiem = " Select* from tblKhachHang where maKH= @maKH ";
            SqlCommand cmd = new SqlCommand(sqlTimkiem, conn);  // đọc lệnh
            cmd.Parameters.AddWithValue("maKH", textBox1.Text);//chưa tìm kiếm đc ak..
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);           // bảng đọc dữ liệu của sql datareader
            dataGridView1.DataSource = dt;//đâu rồi cái ji co
        
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
