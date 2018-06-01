namespace MyactorservClient
{
    using System;
    using Microsoft.ServiceFabric.Actors;
    using Microsoft.ServiceFabric.Actors.Client;
    using Myactorserv.Interfaces;

    class Program
    {
        static void Main(string[] args)
        {
            var MyactorservTestClient = ActorProxy.Create<IMyactorserv>(new ActorId(0x100), "fabric:/FabricClusterCsharpApp" , "Myactorserv");
            int result = MyactorservTestClient.GetCountAsync().Result;
            MyactorservTestClient.SetCountAsync(result + 1).Wait();
            Console.WriteLine("Value = {0}", result);
        }
    }
}
