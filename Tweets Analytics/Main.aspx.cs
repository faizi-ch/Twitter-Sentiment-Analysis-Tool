using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TweetSharp;
using VaderSharp;


public partial class Main : System.Web.UI.Page
{
    //private TwitterService service;
    private string searchText = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_OnClick(object Source, EventArgs e)
    {
        searchText = search.Text;
        DoWhatThisAppNeedToDo();
        
        //Response.Write("<script>alert('" + msg +"')</script>");
    }
    private void UpdateDatabase(string token, string secret)
    {
        //do database updates
    }

    private void DoWhatThisAppNeedToDo()
    {


        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("No.", typeof(string)));
        dt.Columns.Add(new DataColumn("Name", typeof(string)));
        dt.Columns.Add(new DataColumn("Location", typeof(string)));
        dt.Columns.Add(new DataColumn("Tweet", typeof(string)));
        dt.Columns.Add(new DataColumn("Semantic_Polarity", typeof(string)));

        

        //Client client = new Client("9091d4c1", "88e03d5f1f488db656ed6ab5d4a7a91e");

        TwitterClientInfo twitterClientInfo = new TwitterClientInfo();
        twitterClientInfo.ConsumerKey = "zTYSSCTEaxfjXUAAxqE5hkTDx";
        twitterClientInfo.ConsumerSecret = "GO2ljEUk03MpA1b4F9vsHAXhLeDM57UMYdXwyR0Uz8pwk2tywm";

        TwitterService service = new TwitterService(twitterClientInfo);

        service.AuthenticateWith("368763386-jUH3zTuxEELZtdLsS8Eunxw7Q0mBbtnwhOQlZSAg",
            "BirOQsuX3LfXLTYAgI04ueSKNbPLIKbHGplwx2QB1ufCr");


        SentimentIntensityAnalyzer analyzer = new SentimentIntensityAnalyzer();
        SentimentAnalysisResults score = null;

        string maxid = "100000"; // dummy value
        
        string count = "50";
        string sentiment = "";
        int tweetcount = 1;
        int positiveCount = 0;
        int negativeCount = 0;
        int neutralCount = 0;

        if (maxid != null)
        {
            var tweets =
                service.Search(new SearchOptions
                {
                    Q = searchText,
                    Count = Convert.ToInt32(count),
                    Lang = "en",
                    Resulttype = TwitterSearchResultType.Mixed

                });

            List<TwitterStatus> resultList = new List<TwitterStatus>(tweets.Statuses);
            maxid = resultList.Last().IdStr;

            if (tweets != null)
            {

                foreach (var tweet in tweets.Statuses)
                {
                    if (tweet.Text!=null)
                    {
                        try
                        {
                            score = analyzer.PolarityScores(tweet.Text);
                        }
                        catch (Exception e)
                        {
                            Response.Write("<script>alert('" + e.Message + "')</script>");
                        }
                        
                        
                    }

                    if (tweet.Text.Contains("🙂") || tweet.Text.Contains("❤️") || tweet.Text.Contains("👍") || tweet.Text.Contains("😡"))
                    {
                        sentiment = "positive";
                    }
                    else if (tweet.Text.Contains("😛") || tweet.Text.Contains("😠") || tweet.Text.Contains("😡") || tweet.Text.Contains("☹️") || tweet.Text.Contains("👎"))
                    {
                        sentiment = "negative";
                    }
                    else
                    {
                        try
                        {
                            if (score.Compound > 0)
                            {
                                sentiment = "positive";
                            }
                            else if (score.Compound < 0)
                            {
                                sentiment = "negative";
                            }
                            else
                            {
                                sentiment = "neutral";
                            }
                        }
                        catch (Exception e)
                        {
                            
                        }
                    }

                    if (sentiment=="positive")
                    {
                        positiveCount++;
                    }
                    else if (sentiment == "negative")
                    {
                        negativeCount++;
                    }
                    else if (sentiment == "neutral")
                    {
                        neutralCount++;
                    }

                    

                    dr = dt.NewRow();

                    dr["No."] = tweetcount;
                    dr["Name"] = tweet.User.Name;
                    dr["Location"] = tweet.User.Location;
                    dr["Tweet"] = tweet.Text;
                    if (tweet.Text != null)
                    {
                        dr["Semantic_Polarity"] = sentiment;
                    }
                    dt.Rows.Add(dr);
                    //ResultSearch.Add(new KeyValuePair<String, String>(tweet.Id.ToString(), tweet.Text));
                    tweetcount++;
                }
            }
            else
            {
                Response.Write("<script>alert('Fail')</script>");
            }

            while (maxid != null && tweetcount < Convert.ToInt32(count))
            {
                maxid = resultList.Last().IdStr;
                tweets =
                                service.Search(new SearchOptions
                                {
                                    Q = searchText,
                                    Count = Convert.ToInt32(count),
                                    MaxId = Convert.ToInt64(maxid),
                                    Lang = "en",
                                    Resulttype = TwitterSearchResultType.Mixed
                                });                //resultList = new List<TwitterStatus>(tweets_search.Statuses);
                foreach (var tweet in tweets.Statuses)
                {
                    try
                    {

                        if (tweet.Text != null)
                        {
                            try
                            {
                                score = analyzer.PolarityScores(tweet.Text);
                            }
                            catch (Exception e)
                            {
                                
                            }
                        }
                        
                        dr = dt.NewRow();
                        if (tweet.Text.Contains("🙂") || tweet.Text.Contains(":)") || tweet.Text.Contains(":-)") || tweet.Text.Contains("❤️") || tweet.Text.Contains("👍"))
                        {
                            sentiment = "positive";
                        }
                        else if (tweet.Text.Contains("😛") || tweet.Text.Contains(":P") || tweet.Text.Contains(":-P") || tweet.Text.Contains("😠") || tweet.Text.Contains("😡") || tweet.Text.Contains("☹️") || tweet.Text.Contains("👎"))
                        {
                            sentiment = "negative";
                        }
                        else
                        {
                            try
                            {
                                if (score.Compound > 0)
                                {
                                    sentiment = "positive";
                                }
                                else if (score.Compound < 0)
                                {
                                    sentiment = "negative";
                                }
                                else
                                {
                                    sentiment = "neutral";
                                }
                            }
                            
catch (Exception e)
                            {

                            }
                        }

                        if (sentiment == "positive")
                        {
                            positiveCount++;
                        }
                        else if (sentiment == "negative")
                        {
                            negativeCount++;
                        }
                        else if (sentiment == "neutral")
                        {
                            neutralCount++;
                        }

                        dr["No."] = tweetcount;
                        dr["Name"] = tweet.User.Name;
                        dr["Location"] = tweet.User.Location;
                        dr["Tweet"] = tweet.Text;
                        if (tweet.Text != null)
                        {
                            dr["Semantic_Polarity"] = sentiment;
                        }
                        dt.Rows.Add(dr);
                        //ResultSearch.Add(new KeyValuePair<String, String>(tweet.Id.ToString(), tweet.Text));
                        tweetcount++;
                    }
                    catch { }
                }
            }

        }


        double total = positiveCount + negativeCount + neutralCount;

        double postivePercentage = (positiveCount / total) * 100;
        double negativePercentage = (negativeCount / total) * 100;
        double neutralPercentage = (neutralCount / total) * 100;

        postiveTextBox.Visible = true;
        negativeTextBox.Visible = true;
        neutralTextBox.Visible = true;

        postiveTextBox.Text = postivePercentage.ToString()+"%";
        negativeTextBox.Text= negativePercentage.ToString()+"%";
        neutralTextBox.Text=neutralPercentage.ToString()+"%";



        ViewState["CurrentTable"] = dt;

            GridView1.DataSource = dt;
            GridView1.DataBind();
        Page.ClientScript.RegisterStartupScript(
    GetType(),
    "4444",
    "showGraph("+positiveCount+","+negativeCount+","+neutralCount+");",
    true);
        

    }
}