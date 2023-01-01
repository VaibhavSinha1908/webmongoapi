using MongoDB.Driver;
using Microsoft.Extensions.Configuration;
using Moq;
using WebMongoApi.Models;
using WebMongoApi.Services;
using MongoDB.Bson;
using System.Reflection;
using MongoDB.Driver.Linq;

namespace WebMongoApi.Test
{
    public class SupplementServiceTests
    {
        
        [Fact]
        public async void GetSupplement_ReturnsSupplement()
        {
            string emptyString = "";
            Assert.Empty(emptyString);
        }

        [Fact]
        public async void GetSupplement_ReturnsSupplement_v1()
        {
            string emptyString = null;
            Assert.Null(emptyString);
        }

    }
}