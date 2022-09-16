function set-auditing {

param($URL)
	$webapp = Get-SPWebApplication $URL
	$auditmask = [Microsoft.SharePoint.SPAuditMaskType]::Delete -bxor [Microsoft.SharePoint.SPAuditMaskType]::Update -bxor [Microsoft.SharePoint.SPAuditMaskType]::SecurityChange

$webapp.sites | % {

	$_.TrimAuditLog = $true
	$_.Audit.AuditFlags = $auditmask
	$_.Audit.Update()
	$_.AuditLogTrimmingRetention = 30
	}
}

set-auditing http://portal
