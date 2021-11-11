Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F545D7C9
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Nov 2021 10:57:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-hc4MmvwpNvWSeS8QEGbM0A-1; Thu, 25 Nov 2021 04:57:50 -0500
X-MC-Unique: hc4MmvwpNvWSeS8QEGbM0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2A2F1018721;
	Thu, 25 Nov 2021 09:57:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3DF92AF6D;
	Thu, 25 Nov 2021 09:57:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D28974A7CA;
	Thu, 25 Nov 2021 09:57:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABFo8KO008635 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 10:50:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AAD662166B26; Thu, 11 Nov 2021 15:50:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0CD32166B2D
	for <linux-cachefs@redhat.com>; Thu, 11 Nov 2021 15:50:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11E5685A5B5
	for <linux-cachefs@redhat.com>; Thu, 11 Nov 2021 15:50:04 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1636645803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=8koVU3I++ED/Zftn/WyF+lV3xPwXlXqGlwbM9FkFAII=;
	b=O3inMUgeGevL3GYAGT2ZUDwmcyqmdhVUfKnMAxBwtOdWvw7mhjc4S80ZlSXuP+ayA8tOMC
	S8B03DLa2PudFfhLuP8/BDS/KB1IcBmWpBsvHcN6kpYYHTN6QWYlROxg08GJy9ztXWfVlz
	INM4jUXB3Tqs/8pR1Teuv8sAevITKr1ELNPpOncmyajmdut0OhbrvbDjZ4MUB9MKFQhDGW
	DDcYmmnW41NHHB28ZWCO08wvH569etacE34mr6J+AIZ1hUPaZJEWWnjrpyB9FZPTcqdBMx
	AgdH0WgAMEK2OuxioZUiET4/Q0fluXvfUDkaL4Y5AMMJxIRjxWkhulqTjQ6qag==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1636645803; a=rsa-sha256;
	cv=none;
	b=rQxA4Z75+y2DbmojKGsUaFl/NWW64MJcyrC0r1zSX6VKzqKHnsZWcE2j96XCfDSsK/Frqb
	OpqdGsQZttAYSb0JTUtXKcie5HTYXzguQVXg02sbdjN8tZlQkBS19g4yNew3nXDOLRJsGz
	rcTdmVJZSwyhfHweDAok0ng3gzjmsvU27ejGcbD26XPdj0ez3ZhRSoVU/THM4zfh61aRKo
	gBkT17vl/rbosNzOUgThTNL8DKuqlYc7AyoOwP6V6hRa48mgCQNc2OtIqUIRCJHiSsBzYf
	ps5hrVYkFxxTONl+e1XsISZebasEbdM+tE5U98+sA0tb2MdVbDYXU3jAvNzgQg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=auristor.com header.s=MDaemon header.b="KVXX/LkE";
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of jaltman@auristor.com designates
	208.125.0.235 as permitted sender)
	smtp.mailfrom=jaltman@auristor.com
Received: from sequoia-grove.ad.secure-endpoints.com
	(sequoia-grove.ad.secure-endpoints.com [208.125.0.235]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-113-4lawFTlKOqWEPfgur4kA1g-1;
	Thu, 11 Nov 2021 10:50:02 -0500
X-MC-Unique: 4lawFTlKOqWEPfgur4kA1g-1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=auristor.com; s=MDaemon; r=y; t=1636645545; x=1637250345;
	i=jaltman@auristor.com; q=dns/txt; h=Message-ID:Date:
	MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	References:From:Organization:In-Reply-To:Content-Type; bh=o43ddd
	RqvcOKv8dV2+541CLjyFn2jjeaDK5ooAtjc4g=; b=KVXX/LkE2EixlW4UO4v94+
	ycYpuPwZHSbTGlFqdmV1MSTo3o8Bd19Fhf3XmGjpOyP7b9jgiCEqrOiSgwZqPhZq
	pLA2CSoF+3GYlFXGxK2iOkMyOpe4Mr9CDVbSBNUA1rK13eSC/9CdQ+G9olb9Godd
	r05WIVCJFHemKppsJ9B0A=
X-MDAV-Result: clean
X-MDAV-Processed: sequoia-grove.ad.secure-endpoints.com, Thu,
	11 Nov 2021 10:45:45 -0500
Received: from [IPV6:2603:7000:73d:4f22:489a:3cea:a047:72cb] by auristor.com
	(IPv6:2001:470:1f07:f77:28d9:68fb:855d:c2a5) (MDaemon PRO v21.5.0) 
	with ESMTPSA id md5001003028602.msg; Thu, 11 Nov 2021 10:45:45 -0500
X-Spam-Processed: sequoia-grove.ad.secure-endpoints.com, Thu,
	11 Nov 2021 10:45:45 -0500
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 2603:7000:73d:4f22:489a:3cea:a047:72cb
X-MDHelo: [IPV6:2603:7000:73d:4f22:489a:3cea:a047:72cb]
X-MDArrival-Date: Thu, 11 Nov 2021 10:45:45 -0500
X-MDOrigin-Country: US, NA
X-Authenticated-Sender: jaltman@auristor.com
X-Return-Path: prvs=19492496b8=jaltman@auristor.com
X-Envelope-From: jaltman@auristor.com
X-MDaemon-Deliver-To: linux-cachefs@redhat.com
Message-ID: <2e766687-23b3-7983-7b03-cb28f49ad41f@auristor.com>
Date: Thu, 11 Nov 2021 10:45:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
	Thunderbird/91.3.0
To: "David Howells (dhowells@redhat.com)" <dhowells@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <163657847613.834781.7923681076643317435.stgit@warthog.procyon.org.uk>
	<MDAEMON-F202111101609.AA0938215md5001000000902@sequoia-grove.ad.secure-endpoints.com>
From: Jeffrey E Altman <jaltman@auristor.com>
Organization: AuriStor, Inc.
In-Reply-To: <MDAEMON-F202111101609.AA0938215md5001000000902@sequoia-grove.ad.secure-endpoints.com>
X-MDCFSigsAdded: auristor.com
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=auristor.com header.s=MDaemon header.b="KVXX/LkE";
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of jaltman@auristor.com designates
	208.125.0.235 as permitted sender)
	smtp.mailfrom=jaltman@auristor.com
X-Mimecast-Spam-Score: -5
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 25 Nov 2021 04:57:42 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	kafs-testing@auristor.com, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: Re: [Linux-cachefs] [kafs-testing] [PATCH v5 4/4] afs: Use folios
 in directory handling
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1492411360322564331=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

This is a cryptographically signed message in MIME format.
--===============1492411360322564331==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms080703040809060001010207"

This is a cryptographically signed message in MIME format.
--------------ms080703040809060001010207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2021 4:09 PM, David Howells (dhowells@redhat.com) wrote:
> Convert the AFS directory handling code to use folios.
>
> With these changes, afs passes -g quick xfstests.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Tested-by: kafs-testing@auristor.com
> cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Marc Dionne <marc.dionne@auristor.com>
> cc: linux-afs@lists.infradead.org
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/162877312172.3085614.992850861791211206.stgit@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/162981154845.1901565.2078707403143240098.stgit@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/163005746215.2472992.8321380998443828308.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/163584190457.4023316.10544419117563104940.stgit@warthog.procyon.org.uk/ # v3
> Link: https://lore.kernel.org/r/CAH2r5mtECQA6K_OGgU=_G8qLY3G-6-jo1odVyF9EK+O2-EWLFg@mail.gmail.com/ # v3
> Link: https://lore.kernel.org/r/163649330345.309189.11182522282723655658.stgit@warthog.procyon.org.uk/ # v4
Patch v5

Tested-by: kafs-testing@auristor.com


--------------ms080703040809060001010207
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCDGsw
ggXSMIIEuqADAgECAhBAAW0B1qVVQ32wvx2EXYU6MA0GCSqGSIb3DQEBCwUAMDoxCzAJBgNVBAYT
AlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQgQ0EgQTEyMB4XDTE5MDkw
NTE0MzE0N1oXDTIyMTEwMTE0MzE0N1owcDEvMC0GCgmSJomT8ixkAQETH0EwMTQxMEMwMDAwMDE2
RDAxRDZBNTQwMDAwMDQ0NDcxGTAXBgNVBAMTEEplZmZyZXkgRSBBbHRtYW4xFTATBgNVBAoTDEF1
cmlTdG9yIEluYzELMAkGA1UEBhMCVVMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCY
1TC9QeWnUgEoJ81FcAVnhGn/AWuzvkYRUG5/ZyXDdaM212e8ybCklgSmZweqNdrfaaHXk9vwjpvp
D4YWgb07nJ1QBwlvRV/VPAaDdneIygJJWBCzaMVLttKO0VimH/I/HUwFBQT2mrktucCEf2qogdi2
P+p5nuhnhIUiyZ71Fo43gF6cuXIMV/1rBNIJDuwMQ3H8zi6GL0p4mZFZDDKtbYq2l8+MNxFvMrYc
LaJqejQNQRBuZVfv0Fq9pOGwNLAk19baIw3Uxdwx+bGpTtS63Py1/57MQ0W/ZXE/Ocnt1qoDLpJe
ZIuEBKgMcn5/iN9+Ro5zAuOBEKg34wBS8QCTAgMBAAGjggKcMIICmDAOBgNVHQ8BAf8EBAMCBPAw
gYQGCCsGAQUFBwEBBHgwdjAwBggrBgEFBQcwAYYkaHR0cDovL2NvbW1lcmNpYWwub2NzcC5pZGVu
dHJ1c3QuY29tMEIGCCsGAQUFBzAChjZodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2Nl
cnRzL3RydXN0aWRjYWExMi5wN2MwHwYDVR0jBBgwFoAUpHPa72k1inXMoBl7CDL4a4nkQuwwCQYD
VR0TBAIwADCCASsGA1UdIASCASIwggEeMIIBGgYLYIZIAYb5LwAGAgEwggEJMEoGCCsGAQUFBwIB
Fj5odHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmljYXRlcy9wb2xpY3kvdHMvaW5k
ZXguaHRtbDCBugYIKwYBBQUHAgIwga0MgapUaGlzIFRydXN0SUQgQ2VydGlmaWNhdGUgaGFzIGJl
ZW4gaXNzdWVkIGluIGFjY29yZGFuY2Ugd2l0aCBJZGVuVHJ1c3QncyBUcnVzdElEIENlcnRpZmlj
YXRlIFBvbGljeSBmb3VuZCBhdCBodHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmlj
YXRlcy9wb2xpY3kvdHMvaW5kZXguaHRtbDBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vdmFsaWRh
dGlvbi5pZGVudHJ1c3QuY29tL2NybC90cnVzdGlkY2FhMTIuY3JsMB8GA1UdEQQYMBaBFGphbHRt
YW5AYXVyaXN0b3IuY29tMB0GA1UdDgQWBBR7pHsvL4H5GdzNToI9e5BuzV19bzAdBgNVHSUEFjAU
BggrBgEFBQcDAgYIKwYBBQUHAwQwDQYJKoZIhvcNAQELBQADggEBAFlmJYk4Ff1v/n0foZkv661W
4LCRtroBaVykOXetrDDOQNK2N6JdTa146uIZVgBeU+S/0DLvJBKYtkUHQ9ovjXJTsuCBmhIIw3Yl
HoFxbku0wHEpXMdFUHV3tUodFJJKF3MbC8j7dOMkag59/MdzSjszdvit0av9nTxWs/tRKKtSQQlx
tH34TouIke2UgP/Nn901QLOrJYJmtjzVz8DW3IYVxfciSBHhbhJTdley5cuEzphELo5NR4gFjBNl
xH7G57Hno9+EWILpx302FJMwTgodIBJbXLbPMHouxQbOL2anOTUMKO8oH0QdQHCtC7hpgoQa7UJY
JxDBI+PRaQ/HObkwggaRMIIEeaADAgECAhEA+d5Wf8lNDHdw+WAbUtoVOzANBgkqhkiG9w0BAQsF
ADBKMQswCQYDVQQGEwJVUzESMBAGA1UEChMJSWRlblRydXN0MScwJQYDVQQDEx5JZGVuVHJ1c3Qg
Q29tbWVyY2lhbCBSb290IENBIDEwHhcNMTUwMjE4MjIyNTE5WhcNMjMwMjE4MjIyNTE5WjA6MQsw
CQYDVQQGEwJVUzESMBAGA1UEChMJSWRlblRydXN0MRcwFQYDVQQDEw5UcnVzdElEIENBIEExMjCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANGRTTzPCic0kq5L6ZrUJWt5LE/n6tbPXPhG
t2Egv7plJMoEpvVJJDqGqDYymaAsd8Hn9ZMAuKUEFdlx5PgCkfu7jL5zgiMNnAFVD9PyrsuF+poq
mlxhlQ06sFY2hbhQkVVQ00KCNgUzKcBUIvjv04w+fhNPkwGW5M7Ae5K5OGFGwOoRck9GG6MUVKvT
NkBw2/vNMOd29VGVTtR0tjH5PS5yDXss48Yl1P4hDStO2L4wTsW2P37QGD27//XGN8K6amWB6F2X
Ogff/PmlQjQOORT95PmLkwwvma5nj0AS0CVp8kv0K2RHV7GonllKpFDMT0CkxMQKwoj+tWEWJTiD
KSsCAwEAAaOCAoAwggJ8MIGJBggrBgEFBQcBAQR9MHswMAYIKwYBBQUHMAGGJGh0dHA6Ly9jb21t
ZXJjaWFsLm9jc3AuaWRlbnRydXN0LmNvbTBHBggrBgEFBQcwAoY7aHR0cDovL3ZhbGlkYXRpb24u
aWRlbnRydXN0LmNvbS9yb290cy9jb21tZXJjaWFscm9vdGNhMS5wN2MwHwYDVR0jBBgwFoAU7UQZ
wNPwBovupHu+QucmVMiONnYwDwYDVR0TAQH/BAUwAwEB/zCCASAGA1UdIASCARcwggETMIIBDwYE
VR0gADCCAQUwggEBBggrBgEFBQcCAjCB9DBFFj5odHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29t
L2NlcnRpZmljYXRlcy9wb2xpY3kvdHMvaW5kZXguaHRtbDADAgEBGoGqVGhpcyBUcnVzdElEIENl
cnRpZmljYXRlIGhhcyBiZWVuIGlzc3VlZCBpbiBhY2NvcmRhbmNlIHdpdGggSWRlblRydXN0J3Mg
VHJ1c3RJRCBDZXJ0aWZpY2F0ZSBQb2xpY3kgZm91bmQgYXQgaHR0cHM6Ly9zZWN1cmUuaWRlbnRy
dXN0LmNvbS9jZXJ0aWZpY2F0ZXMvcG9saWN5L3RzL2luZGV4Lmh0bWwwSgYDVR0fBEMwQTA/oD2g
O4Y5aHR0cDovL3ZhbGlkYXRpb24uaWRlbnRydXN0LmNvbS9jcmwvY29tbWVyY2lhbHJvb3RjYTEu
Y3JsMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0O
BBYEFKRz2u9pNYp1zKAZewgy+GuJ5ELsMA0GCSqGSIb3DQEBCwUAA4ICAQAN4YKu0vv062MZfg+x
MSNUXYKvHwvZIk+6H1pUmivyDI4I6A3wWzxlr83ZJm0oGIF6PBsbgKJ/fhyyIzb+vAYFJmyI8I/0
mGlc+nIQNuV2XY8cypPoVJKgpnzp/7cECXkX8R4NyPtEn8KecbNdGBdEaG4a7AkZ3ujlJofZqYdH
xN29tZPdDlZ8fR36/mAFeCEq0wOtOOc0Eyhs29+9MIZYjyxaPoTS+l8xLcuYX3RWlirRyH6RPfeA
i5kySOEhG1quNHe06QIwpigjyFT6v/vRqoIBr7WpDOSt1VzXPVbSj1PcWBgkwyGKHlQUOuSbHbHc
jOD8w8wHSDbL+L2he8hNN54doy1e1wJHKmnfb0uBAeISoxRbJnMMWvgAlH5FVrQWlgajeH/6NbYb
BSRxALuEOqEQepmJM6qz4oD2sxdq4GMN5adAdYEswkY/o0bRKyFXTD3mdqeRXce0jYQbWm7oapqS
ZBccFvUgYOrB78tB6c1bxIgaQKRShtWR1zMM0JfqUfD9u8Fg7G5SVO0IG/GcxkSvZeRjhYcbTfqF
2eAgprpyzLWmdr0mou3bv1Sq4OuBhmTQCnqxAXr4yVTRYHkp5lCvRgeJAme1OTVpVPth/O7HJ7Vu
EP9GOr6kCXCXmjB4P3UJ2oU0NqfoQdcSSSt9hliALnExTEjii20B2nSDojGCAxQwggMQAgEBME4w
OjELMAkGA1UEBhMCVVMxEjAQBgNVBAoTCUlkZW5UcnVzdDEXMBUGA1UEAxMOVHJ1c3RJRCBDQSBB
MTICEEABbQHWpVVDfbC/HYRdhTowDQYJYIZIAWUDBAIBBQCgggGXMBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMTExMTE1NDUzN1owLwYJKoZIhvcNAQkEMSIEIFDj
S9DDAqUn5ZC3EyI5skB04tdvXxjkw3hUQZ+EJa+WMF0GCSsGAQQBgjcQBDFQME4wOjELMAkGA1UE
BhMCVVMxEjAQBgNVBAoTCUlkZW5UcnVzdDEXMBUGA1UEAxMOVHJ1c3RJRCBDQSBBMTICEEABbQHW
pVVDfbC/HYRdhTowXwYLKoZIhvcNAQkQAgsxUKBOMDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJ
ZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQgQ0EgQTEyAhBAAW0B1qVVQ32wvx2EXYU6MGwGCSqG
SIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG
9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcN
AQEBBQAEggEAUB5olgH9fLBHob+ZhhYHSiuaKa0qYVWtajIr2fKdAfINeQei1OSxjaNYuUZ9Z/bp
hddvr+qY4ESqcA55B4UyPw7ulaYR0h8KHJK0/v7P6BESakf3tMv+vY6jr9LBJ9UQEpgdixlaLyze
/fWx5OjtJCGQ2E3Ix2C0K0CXn0oPiB/tsNdbnus6iXu+iOpCaXk0PTblsLbr98VE5VXR2S9XAgUc
v3OU8D0+Sbm0hTcr88zi3XPpm0ty8zcdd8X6swa6GGb8rxiK42v3M2k49uFBYbA0+KnQSRsPP5dL
aFTbVHedXP/nqCIBtEmfBmh5R69o/9XA0zpKDHaEJkmCjmA6lgAAAAAAAA==
--------------ms080703040809060001010207--


--===============1492411360322564331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--===============1492411360322564331==--

