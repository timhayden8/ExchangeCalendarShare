#connects to exchange online
connect-exchangeonline
#prompts user to enter calendar being shared. It then pulls an array of all users and everyone in the company gets editor rights
$User = Read-Host "Enter email address of person giving permissions to"
$Mailboxes= (Get-mailbox -resultsize unlimited)
foreach ($mailbox in $mailboxes){
    add-mailboxfolderpermission -identity $user":\Calendar" -user $mailbox.identity -accessrights editor
}
#This section shares the calendars of everyone in the organization with the original selected user as editor
Foreach ($Mailbox in $Mailboxes) {
    Add-MailboxFolderPermission -identity $Mailbox":\Calendar" -user $user -AccessRights editor
}
Read-Host -prompt "Press Enter when Done"
