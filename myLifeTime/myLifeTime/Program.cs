using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace myLifeTime
{
    class Program
    {

        static void Main(string[] args)
        {
            float xSpace;
            float ySpace;
            float zSpace;
            xSpace = 100000;
            zSpace = 100000;
            ySpace = 100000;

            Space space = new Space(xSpace, zSpace, ySpace);
            Console.Write( space.volume.ToString());
            Console.ReadLine();
        }
    }
}
