configuration IIS_Sites
{
     Import-DscResource -ModuleName cWebAdministration
     Import-DscResource -ModuleName xWebAdministration

     node localhost
     {
          cWebSite Default.Web.Site_Site
          {
               Name = "Default Web Site"
               Ensure = "Present"
               State = "Started"
               ApplicationPool = "DefaultAppPool"
               PhysicalPath = "%SystemDrive%\inetpub\wwwroot"
               LogFileDirectory = "D:\LogFiles\"
               DependsOn = "[cAppPool]DefaultAppPool_Pool"
               BindingInfo = 
                         @(
                              PSHOrg_cWebBindingInformation 
                              {
                                   Protocol = "http"
                                   Port = "81"
                                   IPAddress = "*"
                              }
                         )
               WebConfigProp = 
                         @(
                              PSHOrg_cWebConfigProp 
                              {
                                   Location = "Default Web Site/aspnet_client"
                                   Filter = "/system.webServer/directoryBrowse"
                                   Name = "enabled"
                                   Value = "false"
                                   PSPath = "MACHINE/WEBROOT/APPHOST"
                              }
                              PSHOrg_cWebConfigProp 
                              {
                                   Location = "Default Web Site/aspnet_client"
                                   Filter = "/system.webServer/directoryBrowse"
                                   Name = "showFlags"
                                   Value = "0"
                                   PSPath = "MACHINE/WEBROOT/APPHOST"
                              }
                              PSHOrg_cWebConfigProp 
                              {
                                   Location = "Default Web Site/aspnet_client"
                                   Filter = "/system.webServer/handlers"
                                   Name = "accessPolicy"
                                   Value = "Read"
                                   PSPath = "MACHINE/WEBROOT/APPHOST"
                              }
                              PSHOrg_cWebConfigProp 
                              {
                                   Location = "Default Web Site/aspnet_client"
                                   Filter = "/system.webServer/defaultDocument"
                                   Name = "enabled"
                                   Value = "false"
                                   PSPath = "MACHINE/WEBROOT/APPHOST"
                              }
                         )
        }
		  
    }
}
