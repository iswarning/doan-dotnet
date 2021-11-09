using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace WebApplication1
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source =.\SQLEXPRESS; Initial Catalog = QLDA; Integrated Security = True");
            SqlDataAdapter da = new SqlDataAdapter("SELECT MatKhau FROM TAIKHOAN WHERE MatKhau='" + TextBox1.Text + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count.ToString() == "1")
            {
                if (TextBox2.Text == TextBox3.Text)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE TAIKHOAN SET MatKhau='" + TextBox3.Text + "'WHERE MatKhau='" + TextBox1.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "Updated Success!";
                    Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("Green");
                }
                else
                {
                    Label1.Text = "New password and comfirm password should be same!";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}