using Microsoft.Office.Interop.Outlook;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Email
{
    public class OutlookEmails
    {
        public string EmailFrom { get; set; }
        public string EmailSubject { get; set; }
        public string EmailBody { get; set; }

        public string EmailEntry { get; set; }

        public static List<OutlookEmails> ReadMailItems()
        {
            Application outlookApplication = null;
            NameSpace outlookNamespace = null;
            MAPIFolder inboxFolder = null;

            Items mailItems = null;
            List<OutlookEmails> listEmailDetails = new List<OutlookEmails> ();
            OutlookEmails emailDetails;

            try
            {
                outlookApplication = new Application();
                outlookNamespace = outlookApplication.GetNamespace("MAPI");
                inboxFolder = outlookNamespace.GetDefaultFolder(OlDefaultFolders.olFolderInbox);
                mailItems = inboxFolder.Items;
                foreach(MailItem item in mailItems)
                {
       
                    emailDetails = new OutlookEmails ();
                    emailDetails.EmailFrom = item.SenderEmailAddress;
                    emailDetails.EmailSubject = item.Subject;
                    emailDetails.EmailBody = item.Body;
                    emailDetails.EmailEntry = item.SenderEmailAddress + item.Subject + item.Body;
                    listEmailDetails.Add(emailDetails);
                    ReleaseComObject(item);
                }
            }
            catch(System.Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                ReleaseComObject(mailItems);
                ReleaseComObject(inboxFolder);
                ReleaseComObject(outlookNamespace);
                ReleaseComObject(outlookApplication);

            }

            return listEmailDetails;
        }

        private static void ReleaseComObject(object obj)
        {
            if(obj != null)
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);
                obj = null;
            }
        }
       
    }
}
