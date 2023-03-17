using Microsoft.AspNetCore.Mvc;

namespace NewsApp.MicroService.Controllers
{
    [ApiController]
    [Route("api/responsecontroller")]
    public class ResponseController: ControllerBase
    {
        public class ResponseFormat
        {
            public string ReturnCode { get; set; }
            public string Message { get; set; }
            public Guid ResponseID { get; set; }
            public JsonResult Data { get; set; }
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        public JsonResult BuildResponse(string code, string message, Guid responseID, object? result)
        {
            ResponseFormat responseFormat = new ResponseFormat() { ReturnCode = code, Message = message, ResponseID = responseID, Data = new JsonResult(result) };
            return new JsonResult(responseFormat);
        }
    }
}
