﻿<%@ Application Language="C#" %>

<script RunAt="server">
    System.Threading.Thread Th;//線上使用者逾時檢查執行緒
    // 在應用程式啟動時執行的程式碼
    void Application_Start(object sender, EventArgs e)
    {
        Hashtable L = new Hashtable();///儲存線上名單用的雜湊表
        Application["L"] = L;//儲存線上名單的網站公用變數
        Queue Q = new Queue();//儲存發言內容的佇列集合物件
        Application["Q"] = Q;//儲存發言內容的網站公用變數
        Th = new System.Threading.Thread(chkList);//'宣告上線名單逾時檢查執行緒
        Th.IsBackground = true;//設為背景執行緒以免無法順利關閉
        Th.Start();//執行上線名單逾時檢查執行緒
    }
    //  在應用程式關閉時執行的程式碼
    void Application_End(object sender, EventArgs e)
    {
        Th.Abort();//刪除執行緒
    }   
    //上線名單逾時檢查
    private void chkList()
    {
        while (true)
        {
            Hashtable L = (Hashtable)Application["L"];//定義線上名單為雜湊表L
            if (L.Count > 0)//有人在線上時
            {
                Application.Lock();//鎖定網站變數
                Hashtable G = new Hashtable();//新的線上名單
                foreach (var h in L.Keys) //所有線上人
                {
                    if (h != "")
                    {
                        DateTime t = (DateTime)L[h];//客戶最後打卡時間
                        double s = new TimeSpan(DateTime.Now.Ticks - t.Ticks).TotalSeconds;
                        if ((int)s <= 2)//如果沒逾時2秒
                        {
                            G.Add(h, t);//客戶仍在線上加入新名單G
                        }
                    }
                }
                Application["L"] = G;//重設線上名單
                Application.UnLock();//解除鎖定網站變數
            }
            System.Threading.Thread.Sleep(1000);//暫停一秒鐘
        }
    }
    
    void Application_Error(object sender, EventArgs e)
    {
        // 在發生未處理的錯誤時執行的程式碼
    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新的工作階段啟動時執行的程式碼
    }

    void Session_End(object sender, EventArgs e)
    {
        // 在工作階段結束時執行的程式碼
        // 注意: 只有在  Web.config 檔案中將 sessionstate 模式設定為 InProc 時，
        // 才會引起 Session_End 事件。如果將 session 模式設定為 StateServer 
        // 或 SQLServer，則不會引起該事件。

    }
       
</script>