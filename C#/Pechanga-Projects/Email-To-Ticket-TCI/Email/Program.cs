using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Email
{
    internal class Program
    {
        static void Main(string[] args)
        {
           var mails = OutlookEmails.ReadMailItems();
            int i = 1;
            foreach (var mail in mails)
            {
               string Emailfrom = mail.EmailFrom.ToString();
               if(Emailfrom.Contains("@tciresort.com"))
               {
                    File.WriteAllText(@"C:\Users\aalim\Desktop\email.txt", "Mail# " + i + "\n" + mail.EmailEntry);
                    //Console.WriteLine("Mail No: " + i);
                    // Console.WriteLine("Mail Received from: " + mail.EmailFrom);
                   //// File.WriteAllText(@"C:\Users\aalim\Desktop\email.txt", "Mail Received from: " + mail.EmailFrom);
                    // Console.WriteLine("Mail Subject: " + mail.EmailSubject);
                   //// File.WriteAllText(@"C:\Users\aalim\Desktop\email.txt", "Mail Subject: " + mail.EmailSubject);
                    // Console.WriteLine("Mail Body: " + mail.EmailBody);
                   //// File.WriteAllText(@"C:\Users\aalim\Desktop\email.txt", "Mail Body: " + mail.EmailBody);
                    Console.WriteLine("");
                    
               }
                i++;

            }

            Console.ReadKey();
        }
    }
}

//task scheduler to run every 60sec