#connects to exchange online
connect-exchangeonline
#prompts user to enter calendar being shared. It then pulls an array of all users and everyone in the company gets editor rights
$calendar= (Read-host "Enter calendar to share in this format email@email.com:\calendar")
$users= (Get-mailbox -resultsize unlimited)
foreach ($user in $users){
    add-mailboxfolderpermission -identity $calendar -user $user.identity -accessrights editor
}
#Prompts user to enter email of user who needs permissions given. Then creates an array of mailbox calendars and applies editor privelege. 
$User = Read-Host "Enter email address of person giving permissions to"
$Mailboxes = Get-Mailbox -ResultSize Unlimited
Foreach ($Mailbox in $Mailboxes) {
    Add-MailboxFolderPermission -id $Mailbox":\Calendar" -user $user -AccessRights editor
}
Read-Host -prompt "Press Enter when Done"