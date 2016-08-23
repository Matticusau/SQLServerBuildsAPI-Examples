// ----------------------------------------------------------------------------------
// Author:         Matt Lavery
// Date:           23/08/2016
// 
// Revision History:
// Name:           Date:        Description:
// Matt Lavery     23/08/2016   Initial Coding
//
// ----------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// these are needed to call the API
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;

namespace DemoWinFormsApp
{
    public class QueryApi
    {

        public class SQLVersionData
            {
            public string Version { get; set; }
            public string Product { get; set; }
            public string Branch { get; set; }
            public string Update { get; set; }
            public string Description { get; set; }
            public DateTime Released { get; set; }
            public DateTime MainstreamSupportEnd { get; set; }
            public DateTime ExtendedSupportEnd { get; set; }
        }

        // this string will be updated with the URI of the API that was used 
        // so it can be displayed on the form
        private string myApiUri = "http://";
        public string apiUri
        {
            get
            {
                return myApiUri;
            }
            set
            {
                myApiUri = value;
            }
        }

        // CallApi does the actual work of calling the API service
        public List<SQLVersionData> CallAPI(string Version, Boolean MissingUpdates)
        {
            List<SQLVersionData> tmpAPIResults = new List<SQLVersionData>();

            // setup the URL
            string url = "http://sqlserverbuildsapi.azurewebsites.net:80/api/SQLVersions";
            string urlParameters = "?Version=" + Version + "&MissingUpdates=" + MissingUpdates;

            // build the URI that will be used to call the API
            apiUri = url + urlParameters;
            
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(url);

            // Add an Accept header for JSON format.
            client.DefaultRequestHeaders.Accept.Add(
            new MediaTypeWithQualityHeaderValue("application/json"));

            // List data response.
            HttpResponseMessage response = client.GetAsync(urlParameters).Result;  // Blocking call!
            if (response.IsSuccessStatusCode)
            {
                // Parse the response body. Blocking!
                //var dataObjects = response.Content.ReadAsStringAsync<IEnumerable<DataObject>>().Result;
                HttpContent responseContent = response.Content;
                string jsonContent = responseContent.ReadAsStringAsync().Result;
                //CONTACT contact = JsonConvert.DeserializeObject<CONTACT>(jsonContent);
                List<SQLVersionData> tmpSQLVersionData = JsonConvert.DeserializeObject<List<SQLVersionData>>(jsonContent);

                // add the result to the overal list
                tmpAPIResults = tmpSQLVersionData;

            }

            return tmpAPIResults;

        }

    }
}
