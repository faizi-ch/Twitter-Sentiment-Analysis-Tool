using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Aylien.TextApi;
using Hammock.Authentication.OAuth;
using TweetSharp;


public partial class _Default : System.Web.UI.Page
{
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
        twitterClientInfo.ConsumerKey = "jfaKfFmSdtvZRAwO8waULkGqK";
        twitterClientInfo.ConsumerSecret = "4a9RpM2ujRJb9WoE3avzwvvNUyjQC0ox3e0mess2YBAmcuV7MD";

        TwitterService service = new TwitterService(twitterClientInfo);

        service.AuthenticateWith("368763386-jgygtatu9MZLGeEvR6pbGKvL1rjLSapSW6Q5Dq5m",
            "BZl9edQUEk6uGpeLi63gXGzcae1kOSpdTNi3kyrio9VLT");


        //Sentiment sentiment = null;

        string maxid = "100000"; // dummy value
        
        string count = "50";
        string polarity = "";
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
                        //sentiment = client.Sentiment(text: tweet.Text);
                        
                    }

                    if (tweet.Text.Contains("🙂") || tweet.Text.Contains("❤️") || tweet.Text.Contains("👍") || tweet.Text.Contains("😡"))
                    {
                        polarity = "positive";
                    }
                    else if (tweet.Text.Contains("😛") || tweet.Text.Contains("😠") || tweet.Text.Contains("😡") || tweet.Text.Contains("☹️") || tweet.Text.Contains("👎"))
                    {
                        polarity = "negative";
                    }
                    else
                    {
                        //polarity = sentiment.Polarity;
                    }

                    if (polarity=="positive")
                    {
                        positiveCount++;
                    }
                    else if (polarity == "negative")
                    {
                        negativeCount++;
                    }
                    else if (polarity == "neutral")
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
                        dr["Semantic_Polarity"] = ""; //polarity;
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
                            //sentiment = client.Sentiment(text: tweet.Text);
                        }
                        
                        dr = dt.NewRow();
                        if (tweet.Text.Contains("🙂") || tweet.Text.Contains(":)") || tweet.Text.Contains(":-)") || tweet.Text.Contains("❤️") || tweet.Text.Contains("👍"))
                        {
                            polarity = "positive";
                        }
                        else if (tweet.Text.Contains("😛") || tweet.Text.Contains(":P") || tweet.Text.Contains(":-P") || tweet.Text.Contains("😠") || tweet.Text.Contains("😡") || tweet.Text.Contains("☹️") || tweet.Text.Contains("👎"))
                        {
                            polarity = "negative";
                        }
                        else
                        {
                            //polarity = sentiment.Polarity;
                        }

                        if (polarity == "positive")
                        {
                            positiveCount++;
                        }
                        else if (polarity == "negative")
                        {
                            negativeCount++;
                        }
                        else if (polarity == "neutral")
                        {
                            neutralCount++;
                        }

                        dr["No."] = tweetcount;
                        dr["Name"] = tweet.User.Name;
                        dr["Location"] = tweet.User.Location;
                        dr["Tweet"] = tweet.Text;
                        if (tweet.Text != null)
                        {
                            dr["Semantic_Polarity"] = ""; //polarity;
                        }
                        dt.Rows.Add(dr);
                        //ResultSearch.Add(new KeyValuePair<String, String>(tweet.Id.ToString(), tweet.Text));
                        tweetcount++;
                    }
                    catch { }
                }
            }

        }


        /*double total = positiveCount + negativeCount + neutralCount;

        double postivePercentage = (positiveCount / total) * 100;
        double negativePercentage = (negativeCount / total) * 100;
        double neutralPercentage = (neutralCount / total) * 100;

        postiveTextBox.Visible = true;
        negativeTextBox.Visible = true;
        neutralTextBox.Visible = true;

        postiveTextBox.Text = postivePercentage.ToString()+"%";
        negativeTextBox.Text= negativePercentage.ToString()+"%";
        neutralTextBox.Text=neutralPercentage.ToString()+"%";*/



        ViewState["CurrentTable"] = dt;

            GridView1.DataSource = dt;
            GridView1.DataBind();
        
    }

    
}