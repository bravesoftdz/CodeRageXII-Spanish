using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Usar la libreria RestSharp
        RestClient client = new RestClient("http://localhost:8080/");
        var request = new RestRequest("Country", Method.GET);
        var response = client.Execute(request);
        RestSharp.Deserializers.JsonDeserializer jsonds = new RestSharp.Deserializers.JsonDeserializer();
        var LResult = jsonds.Deserialize<List<CountryEntity>>(response);
        GridView1.DataSource = LResult;
        GridView1.DataBind();
    }

}