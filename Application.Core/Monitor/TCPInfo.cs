using System.Linq;
using System.Net.NetworkInformation;

namespace Application.Monitor
{
    public class TCPInfo
    {
        public static int GetTCPCount()
        {
            IPGlobalProperties properties = IPGlobalProperties.GetIPGlobalProperties();
            TcpConnectionInformation[] connections = properties.GetActiveTcpConnections();
            return connections.Count();
        }
    }
}
