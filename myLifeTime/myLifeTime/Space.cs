using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace myLifeTime
{
    public class Space:UnitMaterion
    {
        public float x;
        public float y;
        public float z;
        public float volume;

        public Space(float inX, float inY, float inZ)
        {
            x = inX;
            y = inY;
            z = inZ;
            spaseVolumeSet();
        }

        public void spaseSet(float inX, float inY, float inZ)
        {
            x = inX;
            y = inY;
            z = inZ;
            spaseVolumeSet();
        }

        public void spaseXSet(float inX)
        {
            x = inX;
        }

        public void spaseYSet(float inY)
        {
            y = inY;
        }

        public void spaseZSet(float inZ)
        {
            z = inZ;
        }

        public void spaseVolumeSet()
        {
            volume = x * y * z;
        }
       
    }
}
