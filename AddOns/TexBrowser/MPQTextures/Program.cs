using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wow.archive;
using System.IO;
using System.Configuration;

namespace MPQTextures
{
    class Program
    {
        static void Main(string[] args)
        {
            string baseDir = ConfigurationManager.AppSettings.Get("wow_data_path").Trim();
            string[] archives = ConfigurationManager.AppSettings.Get("mpq_list").Split(',');
            string[] blacklist = ConfigurationManager.AppSettings.Get("blacklistPath").Split(',');
            for (int i = 0; i < blacklist.Length; i++)
            {
                blacklist[i] = blacklist[i].ToLower().Trim();
            }
            Console.WriteLine("TexBrowserData = {");
            foreach (string archivePath in archives)
            {
                string trimmedPath = archivePath.Trim();
                string path = baseDir + Path.DirectorySeparatorChar + trimmedPath;
                Console.Error.WriteLine(String.Format("-- {0}", path));                
                try
                {
                    MpqArchive archive = new MpqArchive(path);
                    foreach (MpqArchive.FileInfo file in archive.Files)
                    {
                        string f = file.Name.ToLower();
                        if (f.EndsWith(".blp"))
                        {
                            bool skip = false;
                            foreach(string p in blacklist) {
                                if (f.StartsWith(p))
                                {
                                    skip = true;
                                    break;
                                }
                            }
                            if(!skip)
                                Console.Out.WriteLine(String.Format("\t[[{0}]],", file.Name));
                        }
                    }
                }
                catch(Exception e)
                {
                    Console.Error.WriteLine(String.Format("Unable to read {0}: {1}", path, e.Message));
                }
            }
            Console.WriteLine("}");
        }
    }
}
