#this function gives editor rights to a user's EO calendar and then gives the user editor rights on everyone in the tenant's calendar.
#Example exchange-calendarshare -user tony@hawk.com
function Exchange-CalendarShare
{
    param($user)
    connect-exchangeonline
    It then pulls an array of all users and everyone in the company gets editor rights
    $Mailboxes= (Get-mailbox -resultsize unlimited)
    foreach ($mailbox in $mailboxes){
        add-mailboxfolderpermission -identity $user":\Calendar" -user $mailbox.identity -accessrights editor
    }
    #This section shares the calendars of everyone in the organization with the original selected user as editor
    Foreach ($Mailbox in $Mailboxes) {
        Add-MailboxFolderPermission -identity $Mailbox":\Calendar" -user $user -AccessRights editor
    }
}
Exchange-CalendarShare
