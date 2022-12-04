#connects to exchange online
connect-exchangeonline
#prompts user to enter calendar being shared. It then pulls an array of all users and everyone in the company gets editor rights. It then shares the calendars with everybody.
$User = Read-Host "Enter email address of person giving permissions to"
$Mailboxes= (Get-mailbox -resultsize unlimited)
foreach ($mailbox in $mailboxes){
    add-mailboxfolderpermission -identity $user":\Calendar" -user $mailbox.identity -accessrights editor
    Add-MailboxFolderPermission -identity $Mailbox":\Calendar" -user $user -AccessRights editor
}
Read-Host -prompt "Press Enter when Done"
