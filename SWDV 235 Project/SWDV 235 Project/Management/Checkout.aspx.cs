using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace SWDV_235_Project
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Creates the code for the checkout button
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Declare objects
                SqlConnection conn;
                SqlCommand comm;
                // Initialize connection
                string connectionString = ConfigurationManager.ConnectionStrings["disk_inventoryTHConnectionString"].ConnectionString;
                conn = new SqlConnection(connectionString);
                // Create command
                comm = new SqlCommand(
                   "EXECUTE sp_BorrowDisk @borrowerID, @diskID, @borrowedDate", conn);

                // Add parameter
                comm.Parameters.Add("@borrowerID", System.Data.SqlDbType.Int);
                comm.Parameters["@borrowerID"].Value = ddlBorrower.SelectedValue;
                comm.Parameters.Add("@diskID", System.Data.SqlDbType.Int);
                comm.Parameters["@diskID"].Value = ddlDisk.SelectedValue;
                comm.Parameters.Add("@borrowedDate", System.Data.SqlDbType.Date);
                comm.Parameters["@borrowedDate"].Value = txtDate.Text;
                string checkedOutDisk = ddlDisk.SelectedItem.Text;
                // Enclose database code in Try-Catch-Finally
                try
                {
                    // Open the connection
                    conn.Open();
                    // Execute the command
                    comm.ExecuteNonQuery();

                    // Display completed message
                    ddlDisk.DataBind();
                    Label1.Text = "New checkout added for borrower: " + ddlBorrower.SelectedItem
                        + " & Disk: " + checkedOutDisk;
                }
                catch (SqlException ex)
                {
                    // Display error message
                    string str;
                    str = "Source:" + ex.Source;
                    str += "\n" + "Number:" + ex.Number.ToString();
                    str += "\n" + "Message:" + ex.Message;
                    str += "\n" + "Class:" + ex.Class.ToString();
                    str += "\n" + "Procedure:" + ex.Procedure.ToString();
                    str += "\n" + "Line Number:" + ex.LineNumber.ToString();
                    str += "\n" + "Server:" + ex.Server.ToString();
                    // Display error message
                    Label1.Text = str;

                }
                finally
                {
                    // Close the connection
                    conn.Close();
                }
            }
        }
    }
}