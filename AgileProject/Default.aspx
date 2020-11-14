<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AgileProject._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%
    var countries = new string[] { "Finland", "Vietnam", "Sweden", "Germany" };
    var maps = new[] {
        new {
            name= "Finland",
            src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7003780.407196273!2d17.08951310509818!3d64.62330188800408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4681cadf4b32f6dd%3A0x146d63c75a810!2sFinland!5e0!3m2!1sen!2sfi!4v1605311139089!5m2!1sen!2sfi",
        },
         new {
            name= "Vietnam",
            src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7643519.716236487!2d102.59419294165671!3d15.669003011997733!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31157a4d736a1e5f%3A0xb03bb0c9e2fe62be!2sVietnam!5e0!3m2!1sen!2sfi!4v1605311333312!5m2!1sen!2sfi",
        },
          new {
            name= "Sweden",
            src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7306814.269669237!2d8.946352962711765!3d62.599213395443115!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x465cb2396d35f0f1%3A0x22b8eba28dad6f62!2sSweden!5e0!3m2!1sen!2sfi!4v1605311395266!5m2!1sen!2sfi",
        },
           new {
            name= "Germany",
            src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5132299.3990673795!2d5.967878662437957!3d51.08990479102128!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x479a721ec2b1be6b%3A0x75e85d6b8e91e55b!2sGermany!5e0!3m2!1sen!2sfi!4v1605311431290!5m2!1sen!2sfi"
        }
     };

    var selectedCountry = Request["country"];
    var selectedDate = Request["date"];
    var errorMessage = "";

      // Make up data by using random util
    var random = new Random();
    // number of death
    int newDeath = 0;
    // number from last weeks
    int lastWeek = 0;

    if (selectedCountry == "")
    {
        errorMessage = "Country should be selected!";

    }
    else if (selectedDate == "")
    {

        errorMessage = "Date should be picked!";
    }
    else { 
      // Make up data by using random util
    // number of death
    newDeath = random.Next(0, 1000);
    // number from last weeks
    lastWeek = random.Next(-300, 300);
    }

  


%>
<div class="pane">
    <div class="map col-3">
      <iframe
          src=" <%: 
          maps.FirstOrDefault(m => m.name == selectedCountry)?.src
          %> "
          width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
          tabindex="0"></iframe>
    </div>
    <div class="cards col-1">
      <div class="card">
        <form action="Default.aspx" id="search-form" method="get">
          <div class="input-group">
            <label for="country">Country:</label>
              <select name="country" id="country">
                  <option value="">Select Country</option>
                <% foreach (string country in countries)
                    { %>
                     <option 
                         value="<%: country %>"
                         <%: country == selectedCountry ? "selected": "" %>
                         ><%: country %></option>
                <% } %>
              </select>
          </div>
          <div class="input-group">
            <label for="date">Date:</label>
            <input 
                type="date" 
                name="date" 
                id="date"
                max="<%:DateTime.Today.ToString("yyyy-MM-dd")%>""
                value="<%: selectedDate %>"">
          </div>
              <% if (errorMessage != "")
                  { %>
                <div class="error-message">
                    <%: errorMessage %>
                </div>
            <% } %>

          <button class="btn" id="search-btn">Search</button>
        </form>
      </div>
      <div class="card" id="card-info">
        <h2 class="card-header">Statistics:</h2>
        <div class="text-group">
          <p>New deaths: <span><%: newDeath > 0 ? "+": "" %><%: newDeath %></span></p>
          <p>Change from last week: <span> <%: lastWeek > 0 ? "+": "" %><%: lastWeek %></span></p>
        </div>
    </div>
  </div>
  
</asp:Content>
