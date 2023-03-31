using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsApp.Model
{
    public record NewsItem
    {
        public int ItemID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ItemLink { get; set; }
        public string Image { get; set; }
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string LogoImage { get; set; }
        public int NumberTimesClicked { get; set; }
        public string? YouTubeLink { get; set; }
    }
}
